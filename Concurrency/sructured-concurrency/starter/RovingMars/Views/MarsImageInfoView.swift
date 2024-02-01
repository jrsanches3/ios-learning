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

struct MarsImageInfoView: View {
  let photo: Photo
    var body: some View {
      VStack(alignment: .leading) {
        HStack(alignment: .top) {
          Text("Earth date:")
          Text.marsDateText(dateString: photo.earthDate)
        }
        HStack(alignment: .top) {
          Text("Sol:")
          Text("\(photo.sol)")
        }
        HStack(alignment: .top) {
          Text("Camera:")
          Text("\(photo.camera.fullName) (\(photo.camera.name))")
        }
        Divider()
        HStack(alignment: .top) {
          Text("Rover:")
          Text(photo.rover.name)
        }
        HStack(alignment: .top) {
          Text("Launch:")
          Text.marsDateText(dateString: photo.rover.launchDate)
        }
        HStack(alignment: .top) {
          Text("Landing:")
          Text.marsDateText(dateString: photo.rover.landingDate)
        }
        HStack(alignment: .top) {
          Text("Status:")
          Text(photo.rover.status)
        }
      }
      .font(.caption)
      .foregroundColor(.white)
    }
}

struct MarsImageInfoView_Previews: PreviewProvider {
  static var previews: some View {
    MarsImageInfoView(photo:
      Photo(
        id: 1,
        sol: 1,
        camera: Camera(name: "CMF", fullName: "Camera McLens Face"),
        imageSource: "https://example.com",
        earthDate: "2022-01-12",
        rover: PhotoRoverReference(
          id: 1,
          name: "Rovy",
          landingDate: "2019-01-01",
          launchDate: "2018-12-31",
          status: "active"
        )
      )
    )
    .background(Color.black)
  }
}
