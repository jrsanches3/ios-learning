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

// Title ViewModifier
// 1
struct DetailedInfoTitleModifier: ViewModifier {
  // 2
  func body(content: Content) -> some View {
    content
      // 3
      .lineLimit(1)
      .font(.title2)
      .bold()
  }
}

// Text extension
extension Text {
  func detailedInfoTitle() -> some View {
    modifier(DetailedInfoTitleModifier())
  }
  func buttonLabel() -> some View {
    modifier(ButtonLabelModifier())
  }
}

// Button Label Modifier
struct ButtonLabelModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(Color.pink)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.pink, lineWidth: 1.5)
      )
  }
}

// Button Style
// 1
struct PrimaryButtonStyle: ButtonStyle {
  // 2
  func makeBody(configuration: Configuration) -> some View {
    // 3
    configuration.label
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(
        configuration.isPressed
        ? Color.mint.opacity(0.2)
        : Color.pink
      )
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(
            configuration.isPressed
            ? Color.mint.opacity(0.2)
            : Color.pink,
            lineWidth: 1.5
          )
      )
  }
}

// Email Validate View Modifier
// 1
struct Validate: ViewModifier {
  var value: String
  var validator: (String) -> Bool

  // 2
  func body(content: Content) -> some View {
    // 3
    content
      .border(validator(value) ? .green : .secondary)
  }
}

// TextField extension
extension TextField {
  func validateEmail(
    value: String,
    validator: @escaping (String) -> (Bool)
  ) -> some View {
    modifier(Validate(value: value, validator: validator))
  }
}

// Image extension
extension Image {
  // 1
  func photoStyle(
    withMaxWidth maxWidth: CGFloat = .infinity,
    withMaxHeight maxHeight: CGFloat = 300
  ) -> some View {
    // 2
    self
      .resizable()
      .scaledToFill()
      // 3
      .frame(maxWidth: maxWidth, maxHeight: maxHeight)
      .clipped()
  }
}

// CHALLENGE SOLUTION
// View extension
extension Text {
  func prefixedWithSFSymbol(named name: String) -> some View {
    HStack {
      Image(systemName: name)
        .resizable()
        .scaledToFit()
        .frame(width: 17, height: 17)
      self
    }
    .padding(.leading, 12)
  }
}
