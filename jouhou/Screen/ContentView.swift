import SwiftUI

struct ContentView: View {
    let screenManager: ScreenManager
    let contentManager: ContentManager
    
    var body: some View {
        NavigationView {
            
            VStack{
                ScrollView{
                    ForEach(0...contentManager.currentIndex,id: \.self){ index in
                        contentItemView(content: contentManager.currentContents[index], index: index)
                    }
                }
                Button{
                    if contentManager.isLastItem {
                        screenManager.navigateTo(.setSelection)
                    } else {
                        contentManager.nextItem()
                    }
                } label : {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(contentManager.canProceed ? Color.calm :Color.gray)
                        .frame(height: 48)
                        .padding(.horizontal,24)
                        .overlay{
                            Text(contentManager.isLastItem ? "結果画面へ" : "次へ")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundStyle(Color.white)
                        }
                    
                }
                .disabled(!contentManager.canProceed)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("閉じる"){
                            contentManager.currentIndex = 0
                            screenManager.navigateTo(.setSelection)
                        }
                    }
                }
            }
            .navigationTitle("タイトル")
            .navigationBarTitleDisplayMode(.inline)
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
                .padding(.top,20)
        }
        
        if let quizItem = content as? QuizItem, index == contentManager.currentIndex {
            HStack{
                Text(quizItem.text)
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(.top,10)
                    .padding(.horizontal,12)
            }
            
            VStack(spacing: 12) {
                ForEach(0..<quizItem.buttons.count, id: \.self) { buttonIndex in
                    Button {
                        contentManager.selectQuizAnswer(buttonIndex)
                    } label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .frame(height: 48)
                            .overlay{
                                Text(quizItem.buttons[buttonIndex].text)
                                    .foregroundStyle(Color.black.opacity(0.8))
                            }
                    }
                    .padding(.horizontal, 12)
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
            }
        }
    }
}
