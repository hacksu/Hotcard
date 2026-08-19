#import "hotcard.typ": card-w, card-h, front-card, back-card

#let sheet-w = 612pt
#let sheet-h = 792pt
#let margin = 16pt
#let gap = 12pt

#let avail-w = (sheet-w - 2 * margin - gap) / 2
#let avail-h = (sheet-h - 2 * margin - gap) / 2
#let s = calc.min(avail-w / card-w, avail-h / card-h)
#let cw = card-w * s
#let ch = card-h * s

#let grid-w = 2 * cw + gap
#let grid-h = 2 * ch + gap
#let left0 = (sheet-w - grid-w) / 2
#let top0 = (sheet-h - grid-h) / 2

#let positions = (
  (left0, top0),
  (left0 + cw + gap, top0),
  (left0, top0 + ch + gap),
  (left0 + cw + gap, top0 + ch + gap),
)

#let mark-len = 7pt
#let mark-gap = 3pt
#let mstroke = 0.4pt + black

#let crop-marks(x, y) = {
  place(dx: x - mark-gap - mark-len, dy: y, line(length: mark-len, angle: 0deg, stroke: mstroke))
  place(dx: x, dy: y - mark-gap - mark-len, line(length: mark-len, angle: 90deg, stroke: mstroke))
  place(dx: x + cw + mark-gap, dy: y, line(length: mark-len, angle: 0deg, stroke: mstroke))
  place(dx: x + cw, dy: y - mark-gap - mark-len, line(length: mark-len, angle: 90deg, stroke: mstroke))
  place(dx: x - mark-gap - mark-len, dy: y + ch, line(length: mark-len, angle: 0deg, stroke: mstroke))
  place(dx: x, dy: y + ch + mark-gap, line(length: mark-len, angle: 90deg, stroke: mstroke))
  place(dx: x + cw + mark-gap, dy: y + ch, line(length: mark-len, angle: 0deg, stroke: mstroke))
  place(dx: x + cw, dy: y + ch + mark-gap, line(length: mark-len, angle: 90deg, stroke: mstroke))
}

#let sheet(card-fn, label) = {
  set page(width: sheet-w, height: sheet-h, margin: 0pt, fill: white)
  for (x, y) in positions {
    place(dx: x, dy: y, scale(x: s * 100%, y: s * 100%, origin: top + left, card-fn()))
    crop-marks(x, y)
  }
}

#sheet(front-card, "FRONT sheet")
#pagebreak()
#sheet(back-card, "BACK sheet")
