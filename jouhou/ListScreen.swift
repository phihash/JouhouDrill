import SwiftUI

struct ListScreen: View {
    let screenManager: ScreenManager
    var body: some View {
        Button("クイズ"){
            screenManager.navigateTo(.firstQuestion)
        }
    }
}


