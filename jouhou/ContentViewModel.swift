import SwiftUI
import Observation

struct ContentSet {
    var title: String
    var contents: [Any]
}

struct TitleItem {
    var image: String
    var text: String
}

struct TextItem {
    var text: String
}

struct QuizItem {
    var text: String
    var buttons: [QuizButton]
    var selectedIndex: Int? = nil
}

struct QuizButton {
    var text: String
    var isCorrect: Bool
}


@Observable
class ContentViewModel{
    
    var contentSets: [ContentSet] = []
    var currentSetTitle = "基本編"
    var currentIndex = 0
    
    init() {
        resetAllData()
    }
    
    var currentSet: ContentSet {
        return contentSets.first { $0.title == currentSetTitle } ?? contentSets[0]
    }
    
    var currentContents: [Any] {
        return currentSet.contents
    }
    
    var canProceed : Bool {
        let currentContent = currentContents[currentIndex]
        
        if let quizItem = currentContent as? QuizItem {
            return quizItem.selectedIndex != nil
        }
        return true
    }
    
    var isFinish : Bool {
        return currentContents.count == currentIndex + 1
    }
    
    
    func selectQuizAnswer(_ buttonIndex: Int) {
        if var quizItem = currentContents[currentIndex] as? QuizItem {
            print("Quiz answer selected: \(buttonIndex)")
            quizItem.selectedIndex = buttonIndex
            
            // タイトルからセットのインデックスを見つけて更新
            if let setIndex = contentSets.firstIndex(where: { $0.title == currentSetTitle }) {
                contentSets[setIndex].contents[currentIndex] = quizItem
            }
            print("Quiz selectedIndex is now: \(quizItem.selectedIndex)")
        }
    }
    
    
    func nextItem(){
        if canProceed && currentIndex < currentContents.count - 1 {
            currentIndex += 1
        }
    }
    
    var isLastItem: Bool {
        return currentIndex == currentContents.count - 1
    }
    
    func resetAllData() {
        // 元データから新しいコピーを作成
        contentSets = originalContentData
    }
    
    func selectSet(title: String) {
        currentSetTitle = title
        currentIndex = 0
        resetCurrentSet()
    }
    
    func resetCurrentSet() {
        // 現在のセットだけ元データからコピーし直し
        if let setIndex = contentSets.firstIndex(where: { $0.title == currentSetTitle }),
           let originalSet = originalContentData.first(where: { $0.title == currentSetTitle }) {
            contentSets[setIndex] = originalSet
        }
    }
    
}