#let _layout(title: "", authors: (), leadManager: "", body) = {
  set document(author: authors, title: title)
  set page("a4", margin: (top: 3em, bottom: 2em, left: 4em, right: 4em), /*numbering: "1",*/ number-align: center)
  set text(font: (
    "Noto Serif CJK KR",
    "Noto Serif KR",
    "RIDIBatang"
  ), lang: "ko")
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()
    let pattern = if level > 1 {
        "1.1.1."
      }
    if pattern != none {
      numbering(pattern, ..(nums.pos().slice(1, level)))
    }
  })
  set enum(numbering: "a.1.", indent: 10pt)
  set text(size: 9.7pt)

  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  pad(
    top: 0.3em,
    bottom: 0.3em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  set par(justify: true)

  body

  
  v(20pt)

  set align(center)
  text(1em)[
    20
    #underline[ㅤㅤ]
    년 
    #underline[ㅤㅤ]
    월 
    #underline[ㅤㅤ]
    일 
  ]
  
  set align(left)
  
  grid(
    columns: (1.5fr, 1fr, 1fr),
    gutter: 1em,
    align(right)[
      서명자의 종교: #underline()[ㅤㅤㅤㅤㅤㅤㅤㅤㅤ]
    ],
    [],
    [],
    align(right)[
      전남대학교 게임개발동아리 PIMM
    ],
    align(left)[
      대표자, #leadManager
    ],
    align(left)[
      (인)
    ],
    align(right)[
      전남대학교 게임개발동아리 PIMM
    ],
    align(left)[
      서명자, #underline[ㅤㅤㅤㅤ]
    ],
    align(left)[
      (인)
    ]
  )
}
