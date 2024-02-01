/// Copyright (c) 2022 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,request
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

struct MarsRoverAPI {
  enum APIError: Error {
    case requestURLInvalid(String)
  }

  let apiKey = "YOUR KEY HERE"
  let apiURLBase = "https://api.nasa.gov/mars-photos/api/v1"

  func allRovers() async throws -> [Rover] {
    let api = APIRequest<RoversContainer>(urlString: "\(apiURLBase)/rovers")
    let container = try await request(api, apiKey: apiKey)
    return container.rovers
  }

  func latestPhotos(rover: Rover) async throws -> [Photo] {
    let api = APIRequest<LatestPhotos>(urlString: "\(apiURLBase)/rovers/\(rover.name)/latest_photos")
    let container = try await request(api, apiKey: apiKey)
    return container.photos
  }

  func photoManifest(rover: Rover) async throws -> PhotoManifest {
    let api = APIRequest<PhotoManifestContainer>(urlString: "\(apiURLBase)/manifests/\(rover.name)")
    let container = try await request(api, apiKey: apiKey)
    return container.photoManifest
  }

  func photos(roverName: String, sol: Int) async throws -> [Photo] {
    let api = APIRequest<PhotosContainer>(urlString: "\(apiURLBase)/rovers/\(roverName)/photos?sol=\(sol)")
    let container = try await request(api, apiKey: apiKey)
    return container.photos
  }

  func request<T>(_ apiRequest: APIRequest<T>, apiKey: String) async throws -> T {
    log.debug("Making request \(apiRequest.urlString)")
    guard var components = URLComponents(string: apiRequest.urlString) else {
      throw APIError.requestURLInvalid(apiRequest.urlString)
    }

    // Make sure the API key is always in the request query string
    let queryItems = (components.queryItems ?? []) + [URLQueryItem(name: "api_key", value: apiKey)]
    components.queryItems = queryItems

    guard let apiURL = components.url else {
      throw APIError.requestURLInvalid(apiRequest.urlString)
    }

    let request = URLRequest(url: apiURL)
    let data = try await URLSession.shared.data(for: request, delegate: nil).0
    return try apiRequest.decodeJSON(data)
  }
}

struct APIRequest<T: Decodable> {
  var urlString: String
  let decodeJSON: (Data) throws -> T
}

extension APIRequest {
  init(urlString: String) {
    self.urlString = urlString
    self.decodeJSON = { data in
      return try JSONDecoder().decode(T.self, from: data)
    }
  }
}
