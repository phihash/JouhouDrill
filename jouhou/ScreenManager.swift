import SwiftUI
import Observation

enum ScreenType{
    case firstQuestion
    case setSelection
}

@Observable
class ScreenManager {
    var currentScreen: ScreenType = .setSelection
    
    func navigateTo(_ screen: ScreenType) {
        currentScreen = screen
    }
}
