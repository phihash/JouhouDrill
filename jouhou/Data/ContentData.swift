import Foundation

let originalContentData: [Category] = [
    Category(name: "情報デザイン", contentSets: [
        ContentSet(title: "基本編", contents: [
            TitleItem(image: "icon", text: "タイトル"),
            TextItem(text: "情報を伝達するための媒体をメディアと言います。"),
            TextItem(text: "メディアには、テレビや新聞といった伝達メディア、DVDやUSBメモリなどの記録メディアなどに分類されます。"),
            QuizItem(text: "このとき、テレビや新聞などはマスメディアと言われますが、理由として", buttons: [
                QuizButton(text: "直接、手に触れられるからです", isCorrect: false),
                QuizButton(text: "時空を超えて情報を伝えられるからです", isCorrect: true),
                QuizButton(text: "発信者が大量の情報を、不特定多数の受信者に一方向に伝達できるからです", isCorrect: false)
            ]),
            QuizItem(text: "近年では誰もが情報発信できます。このメディアを", buttons: [
                QuizButton(text: "表現メディアと言います", isCorrect: false),
                QuizButton(text: "ネットワークメディアといいます", isCorrect: true),
                QuizButton(text: "記録メディアです", isCorrect: false)
            ]),
            TextItem(text: "最後"),
        ]),
        ContentSet(title: "応用編", contents: [
            TitleItem(image: "icon", text: "応用タイトル"),
            TextItem(text: "新しいコンテンツ"),
            TextItem(text: "終了")
        ])
    ]),
    Category(name: "数学", contentSets: [
        ContentSet(title: "基本編", contents: [
            TitleItem(image: "icon", text: "数学基本"),
            TextItem(text: "数学の基本を学びます"),
            TextItem(text: "終了")
        ])
    ])
]
