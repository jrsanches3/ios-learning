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
/// or information technology.  Permission for such use, copying, modification,
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

import SwiftUI

struct RoversContainer: Codable {
  let rovers: [Rover]
}

struct Rover: Codable, Identifiable {
  let id: Int
  let name: String
  let landingDate: String
  let launchDate: String
  let status: String
  let maxSol: Int
  let maxDate: String
  let totalPhotos: Int
  let cameras: [Camera]

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case landingDate = "landing_date"
    case launchDate = "launch_date"
    case status
    case maxSol = "max_sol"
    case maxDate = "max_date"
    case totalPhotos = "total_photos"
    case cameras
  }
}

struct Camera: Codable {
  let name: String
  let fullName: String

  private enum CodingKeys: String, CodingKey {
    case name
    case fullName = "full_name"
  }
}

struct LatestPhotos: Codable {
  let photos: [Photo]

  private enum CodingKeys: String, CodingKey {
    case photos = "latest_photos"
  }
}

struct Photo: Codable, Identifiable {
  let id: Int
  let sol: Int
  let camera: Camera
  let imageSource: String
  let earthDate: String
  let rover: PhotoRoverReference

  private enum CodingKeys: String, CodingKey {
    case id
    case sol
    case camera
    case imageSource = "img_src"
    case earthDate = "earth_date"
    case rover
  }
}

struct PhotoRoverReference: Codable {
  let id: Int
  let name: String
  let landingDate: String
  let launchDate: String
  let status: String

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case landingDate = "landing_date"
    case launchDate = "launch_date"
    case status
  }
}

struct PhotoManifestContainer: Codable {
  let photoManifest: PhotoManifest

  private enum CodingKeys: String, CodingKey {
    case photoManifest = "photo_manifest"
  }
}

struct PhotoManifest: Codable {
  let name: String
  let landingDate: String
  let launchDate: String
  let status: String
  let maxSol: Int
  let maxDate: String
  let totalPhotos: Int
  let entries: [ManifestEntry]

  private enum CodingKeys: String, CodingKey {
    case name
    case landingDate = "landing_date"
    case launchDate = "launch_date"
    case status
    case maxSol = "max_sol"
    case maxDate = "max_date"
    case totalPhotos = "total_photos"
    case entries = "photos"
  }
}

struct ManifestEntry: Codable {
  let sol: Int
  let earthDate: String
  let totalPhotos: Int
  let cameras: [String]

  private enum CodingKeys: String, CodingKey {
    case sol
    case earthDate = "earth_date"
    case totalPhotos = "total_photos"
    case cameras
  }
}

struct PhotosContainer: Codable {
  let photos: [Photo]

  private enum CodingKeys: String, CodingKey {
    case photos
  }
}


extension DateFormatter {
  static let marsDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
  }()
}

extension Text {
  static func marsDateText(dateString: String) -> Text {
    guard let date = DateFormatter.marsDateFormatter.date(from: dateString) else {
      return Text(dateString)
    }
    return Text(date, style: .date)
  }
}
