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

struct MarsImageView: View {
  let photo: Photo

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .fill(Color.black)
      VStack {
        AsyncImage(url: URL(string: photo.imageSource)) { phase in
          switch phase {
          case .empty:
            Spacer()
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
              .clipShape(RoundedRectangle(cornerRadius: 8))
          case .failure(let error):
            Spacer()
            VStack {
              Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
              Text(error.localizedDescription)
                .font(.caption)
                .multilineTextAlignment(.center)
            }
          @unknown default:
            EmptyView()
          }
        }
        Spacer()
        MarsImageInfoView(photo: photo)
      }
      .padding()
    }
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

struct MarsImageView_Previews: PreviewProvider {
  static var previews: some View {
    MarsImageView(photo: Photo(
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
  }
}
