import SwiftUI

struct SetSelectionView: View {
    let screenManager: ScreenManager
    let contentViewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("コンテンツセット選択")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                ForEach(0..<contentViewModel.contentSets.count, id: \.self) { index in
                    Button {
                        contentViewModel.selectSet(title: contentViewModel.contentSets[index].title)
                        screenManager.navigateTo(.firstQuestion)
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue)
                            .frame(height: 60)
                            .overlay {
                                Text(contentViewModel.contentSets[index].title)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                    }
                    .padding(.horizontal, 24)
                }
                
                Spacer()
            }
        }
    }
}
