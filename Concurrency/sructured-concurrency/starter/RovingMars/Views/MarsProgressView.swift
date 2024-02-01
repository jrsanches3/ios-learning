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

struct MarsProgressView: View {
  @State var degreesY: Double = -92
  @State var offsetX: Double = -30

  var body: some View {
    VStack {
      Spacer()
      ZStack {
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 60, height: 60)
        .background {
          EllipticalGradient(
            colors: [Color.accentColor.opacity(0.2), Color.accentColor],
            center: UnitPoint(x: 0.2, y: 0.5),
            startRadiusFraction: 0.4,
            endRadiusFraction: 0.9
          )
          .clipShape(Circle())
        }

        Circle()
          .fill(Color.accentColor.opacity(0.5))
          .frame(width: 12, height: 12)
          .rotation3DEffect(
            .degrees(degreesY),
            axis: (x: 0, y: 1, z: 0),
            anchor: UnitPoint.init(x: 0.5, y: 0.5)
          )
          .offset(x: offsetX, y: -8)

        Circle()
          .fill(Color.accentColor.opacity(0.2))
          .frame(width: 4, height: 4)
          .rotation3DEffect(
            .degrees(degreesY),
            axis: (x: 0, y: 1, z: 0),
            anchor: UnitPoint.init(x: 0.5, y: 0.5)
          )
          .offset(x: offsetX - 6, y: 2)

        Circle()
          .fill(Color.accentColor.opacity(0.7))
          .frame(width: 6, height: 6)
          .rotation3DEffect(
            .degrees(degreesY + 2),
            axis: (x: 0, y: 1, z: 0),
            anchor: UnitPoint.init(x: 0.5, y: 0.5)
          )
          .offset(x: offsetX + 4, y: 5)
      }
      Text("Loading...")
        .foregroundColor(Color.accentColor)
        .padding()
      Spacer()
    }
    .task {
      withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
        degreesY = 90
        offsetX = 30
      }
    }
  }
}

struct MarsProgressView_Previews: PreviewProvider {
  static var previews: some View {
    MarsProgressView()
  }
}
