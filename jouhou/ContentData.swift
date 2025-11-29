import Foundation

let originalContentData: [ContentSet] = [
    ContentSet(title: "基本編", contents: [
        TitleItem(image: "icon", text: "タイトル"),
        TextItem(text: "咲き誇れ"),
        QuizItem(text: "sんpsjmpこk?", buttons: [
            QuizButton(text: "しkmlmkmkたち", isCorrect: true),
            QuizButton(text: "mlmkmpmkmpの大生活", isCorrect: false),
            QuizButton(text: "有名mkっmkmkmk", isCorrect: false)
        ]),
        TextItem(text: "咲き誇れ"),
        TextItem(text: "最後")
    ]),
    ContentSet(title: "応用編", contents: [
        TitleItem(image: "icon", text: "応用タイトル"),
        TextItem(text: "新しいコンテンツ"),
        TextItem(text: "終了")
    ])
]
