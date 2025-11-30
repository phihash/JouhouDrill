import SwiftUI

struct StartView: View {
    @State private var screenManager = ScreenManager()
    @State private var contentManager = ContentManager()
    
    var body: some View {
        VStack{
            switch screenManager.currentScreen {
            case .firstQuestion:
                ContentView(screenManager: screenManager, contentManager: contentManager)
            case .setSelection:
                SetSelectionView(screenManager: screenManager, contentManager: contentManager)
            }
        }
    }
}
