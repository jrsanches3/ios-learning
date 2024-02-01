/// Copyright (c) 2021 Razeware LLC
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

extension CreateIceCreamView {
  // TODO: Call interactor to fetch data

  // HELPER VIEW FUNCTION
  func showIceCreamImage() -> Bool {
    if selectedCone.isEmpty || selectedFlavor.isEmpty || selectedTopping.isEmpty {
      return true
    }
    return false
  }
}

struct CreateIceCreamView: View {
  // TODO: Add interactor

  @ObservedObject var iceCream = IceCreamDataStore()
  @State private var selectedCone = ""
  @State private var selectedFlavor = ""
  @State private var selectedTopping = ""

  @State private var showDoneAlert = false

  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker("Select a cone or cup", selection: $selectedCone) {
            ForEach(iceCream.displayedCones, id: \.self) {
              Text($0)
            }
          }
          Picker("Choose your flavor", selection: $selectedFlavor) {
            ForEach(iceCream.displayedFlavors, id: \.self) {
              Text($0)
            }
          }
          .disabled(selectedCone.isEmpty)
          Picker("Choose a topping", selection: $selectedTopping) {
            ForEach(iceCream.displayedToppings, id: \.self) {
              Text($0)
            }
          }
          .disabled(selectedCone.isEmpty || selectedFlavor.isEmpty)
        } header: {
          Text("Let's make an ice cream!")
        }
        Section {
          Button {
            showDoneAlert = true
          } label: {
            Text("DONE")
              .font(.title3)
              .frame(
                maxWidth: .infinity,
                alignment: .center
              )
          }
          .disabled(showIceCreamImage())
          .alert(isPresented: $showDoneAlert) {
            Alert(
              title: Text("Your ice cream is ready!"),
              message: Text("Let's make a new one. You can never have too much ice cream..."),
              dismissButton: .default(Text("OK")) {
                selectedCone = ""
                selectedFlavor = ""
                selectedTopping = ""
              })
          }
        }
        Section {
          CreateIceCreamImageView(
            selectedCone: $selectedCone,
            selectedFlavor: $selectedFlavor,
            selectedTopping: $selectedTopping
          )
        }
      }
      .navigationTitle("Scoops&Scones")
    }
    .navigationViewStyle(.stack)
  }
}

struct IceCreamSelectView_Previews: PreviewProvider {
  static var previews: some View {
    CreateIceCreamView(iceCream: IceCreamDataStore())
  }
}
