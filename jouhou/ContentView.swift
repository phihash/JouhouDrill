import SwiftUI

struct ContentView: View {
    let screenManager: ScreenManager
    let contentViewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    ForEach(0...contentViewModel.currentIndex,id: \.self){ index in
                        contentItemView(content: contentViewModel.currentContents[index], index: index)
                    }
                }
                Button{
                    if contentViewModel.isLastItem {
                        screenManager.navigateTo(.setSelection)
                    } else {
                        contentViewModel.nextItem()
                    }
                } label : {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(contentViewModel.canProceed ? Color.blue :Color.gray)
                        .frame(height: 48)
                        .padding(.horizontal,24)
                        .overlay{
                            Text(contentViewModel.isLastItem ? "結果画面へ" : "次へ")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundStyle(Color.white)
                        }
                    
                }
                .disabled(!contentViewModel.canProceed)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("閉じる"){
                            contentViewModel.currentIndex = 0
                            screenManager.navigateTo(.setSelection)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func contentItemView(content: Any, index: Int) -> some View {
        if let titleItem = content as? TitleItem {
            Image(titleItem.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            Text(titleItem.text)
                .fontWeight(.bold)
                .font(.title2)
                .padding(.top,16)
        }
        
        if let quizItem = content as? QuizItem, index == contentViewModel.currentIndex {
            HStack{
                Text(quizItem.text)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.top,10)
                    .padding(.horizontal,24)
                Spacer()
            }
            
            VStack(spacing: 12) {
                ForEach(0..<quizItem.buttons.count, id: \.self) { buttonIndex in
                    Button {
                        contentViewModel.selectQuizAnswer(buttonIndex)
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .frame(height: 48)
                            .overlay{
                                Text(quizItem.buttons[buttonIndex].text)
                                    .foregroundStyle(Color.black.opacity(0.8))
                            }
                    }
                    .padding(.horizontal, 24)
                }
            }
            .padding(.top, 8)
        }
        
        if let textItem = content as? TextItem {
            HStack{
                Text(textItem.text)
                    .fontWeight(.medium)
                    .foregroundStyle(.black.opacity(0.8))
                    .padding(.top,8)
                    .padding(.horizontal,24)
                Spacer()
            }
        }
    }
}
