//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContnetView: View {
    var body: some View {
        Text("Hello,").foregroundStyle(.red).italic()
        + Text("World!").foregroundStyle(.blue).bold()

    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.setLiveView(ContnetView())
