import SwiftUI

struct StartView: View {
    @State private var screenManager = ScreenManager()
    @State private var contentViewModel = ContentViewModel()
    
    var body: some View {
        VStack{
            switch screenManager.currentScreen {
            case .firstQuestion:
                ContentView(screenManager: screenManager, contentViewModel: contentViewModel)
            case .setSelection:
                SetSelectionView(screenManager: screenManager, contentViewModel: contentViewModel)
            }
        }
    }
}
