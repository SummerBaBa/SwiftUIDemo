/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
struct StoryView: View {
    @State private var isPlaying: Bool = false
    
    
    var body: some View {
        VStack {
            Text("test")
                .foregroundStyle(isPlaying ? .primary : .secondary)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
