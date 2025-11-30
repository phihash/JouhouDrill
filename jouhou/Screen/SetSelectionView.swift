import SwiftUI

struct SetSelectionView: View {
    let screenManager: ScreenManager
    let contentManager: ContentManager
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 20) {
                    

                    ForEach(0..<contentManager.categories.count, id: \.self) { categoryIndex in
                        let category = contentManager.categories[categoryIndex]
                        
                        HStack{
                            Text(category.name)
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.top, 20)
                                .padding(.horizontal, 24)
                            Spacer()
                        }
                        
                        ForEach(0..<category.contentSets.count, id: \.self) { setIndex in
                            let contentSet = category.contentSets[setIndex]
                            Button {
                                contentManager.selectSet(categoryName: category.name, setTitle: contentSet.title)
                                screenManager.navigateTo(.firstQuestion)
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.calm)
                                    .frame(height: 60)
                                    .overlay {
                                        Text(contentSet.title)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.top,64)
            
        }
        .safeAreaInset(edge:.top){
            
            Text("情報ドリル")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.calm)
                .foregroundColor(.white)
            
        }
    }
}
