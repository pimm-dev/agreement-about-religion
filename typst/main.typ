#let lead_manager = "정영도"
#let rev = "1.2"

#let color = (
  title: rgb("#000"),
  body: rgb("#333")
)

#let midline = path(
  stroke: .5pt + color.body,
  closed: false,
  (0pt, 0pt),
  (0pt, 30%)
)

#let doc_layout(body) = {
  text(fill: color.body)[
    #body
  ]
  linebreak()
  align(center)[
    #text(size: 6pt)[
      #grid(
        columns: 3,
        inset: (x: 4pt),
        [20#underline[ㅤㅤㅤ] 년], [#underline[ㅤㅤㅤㅤ] 월], [#underline[ㅤㅤㅤㅤ] 일]
      )
    ]
    

    #grid(
      columns: (1fr, 1fr, 1fr),
      rows: 2em,
      align: center + horizon,
      [전남대학교 게임개발동아리 PIMM], [대표자ㅤ#lead_manager], [(인)],
      [전남대학교 게임개발동아리 PIMM], [서명자ㅤ#underline[ㅤㅤㅤ]], [(인)]
    )
  ]
}

#let doc(body) = {
  set page("a4",
    flipped: true,
    margin: (x: 40pt, top: 35pt, bottom: 25pt),
    header: [
      #text(size: 5pt)[
        #columns(2)[
          #align(left)[종교에 관한 서약서, r#rev, 좌측]
          #colbreak()
          #align(right)[종교에 관한 서약서, r#rev, 우측]
        ]
      ]
    ]
  )
  set text(size: 6pt, font: ("Noto Serif KR"))
  
  show heading.where(level: 1): it => [
    #set align(center)
    #set text(size: 12pt, weight: "medium", fill: color.title)
    #it
    #set text(size: .5em)
    #linebreak()
  ]

  show heading.where(level: 2): it => [
    #set align(center)
    #set text(size: 8pt, weight: "regular", fill: color.title)
    #it
    #set text(size: .4em)
    #linebreak()
  ]

  grid(
    columns: (1fr, 70pt, 1fr),
    align(horizon)[
      #doc_layout(body)
    ],
    align(center + horizon)[
      #text(fill: color.body)[
        #midline
        (인)
        #midline
        (인)
        #midline
      ]
    ],
    align(horizon)[
      #doc_layout(body)
    ]
  )
}

#show: body => doc(body)

#include "README.typ"

