#let blue = rgb("#4683FF")
#let green = rgb("#35C982")
#let purple = rgb("#AB52CB")
#let bg = rgb("#142027")
#let gray = rgb("#9aa4b2")
#let card-w = 324pt
#let card-h = 414pt

#let corner-box(rotate-deg: 0deg, size: 110pt) = {
  rotate(rotate-deg, image("assets/hacksu-box.png", width: size, height: size))
}

#let front-card() = box(width: card-w, height: card-h, fill: bg, clip: true)[
  #set text(font: "Arimo", fill: white, size: 10pt)
  #place(top + right, dx: 34pt, dy: -34pt, corner-box(size: 100pt))
  #place(bottom + left, dx: -34pt, dy: 34pt, corner-box(rotate-deg: 180deg, size: 100pt))

  #align(center)[
    #v(8pt)
    #image("assets/logo.svg", width: 165pt)
    #v(9pt)
    #text(size: 15pt, weight: "bold")[Interested in Coding?]
    #v(4pt)
    #box(width: 210pt)[
      #align(center)[
        #text(size: 9pt)[HacKSU teaches anyone, regardless of skill level or major, how to code!]
      ]
    ]
    #v(7pt)
    #box(
      fill: white,
      inset: 5pt,
      radius: 2pt,
      image("assets/discord.png", width: 96pt, height: 96pt),
    )
    #v(6pt)
    #text(size: 9pt, fill: gray)[discord.gg/hrRfNQBz5z]
    #v(6pt)
    #text(size: 12pt, weight: "bold")[Tuesdays, 7PM - 8PM]
    #v(0pt)
    #text(size: 12pt, weight: "bold")[IN PERSON]
    #v(4pt)
    #text(size: 9pt, fill: gray)[hacksu.com]
  ]
]

#let back-card() = box(width: card-w, height: card-h, fill: bg, clip: true)[
  #set text(font: "Arimo", fill: white, size: 10pt)
  #place(top + right, dx: 22pt, dy: -55pt, corner-box(size: 75pt))
  #place(bottom + left, dx: -30pt, dy: 30pt, corner-box(rotate-deg: 180deg, size: 110pt))

  #pad(x: 24pt, y: 30pt)[
    #text(size: 15pt, weight: "bold")[We'll show you how to...]
    #v(8pt)
    #set text(size: 10.5pt)
    #for item in ("Design a website", "Create a mobile app", "Write a Discord bot", "Host a webserver", "Debug a program", "And much more!") [
      #text(fill: gray)[\- ] #item \
    ]
    #v(10pt)
    #text(size: 10.5pt)[Even if you have no experience, we'll show you the ropes; regardless of your major!]
    #v(20pt)
    #text(size: 14pt, weight: "bold")[Interested in the Career Fair?]
    #v(6pt)
    #text(size: 10.5pt)[We host a resume workshop and bring in real managers to do mock interviews and give feedback on your resume!]
    #v(24pt)
    #align(right)[
      #box(width: 220pt)[
        #align(right)[
          #text(size: 14pt, weight: "bold")[Just want to socialize?]
          #v(6pt)
          #text(size: 10.5pt)[HacKSU is a great place to chat about coding and technology, or just hang out and play games!]
        ]
      ]
    ]
  ]
]

#set page(width: card-w, height: card-h, margin: 0pt, fill: bg)
#front-card()
#pagebreak()
#back-card()
