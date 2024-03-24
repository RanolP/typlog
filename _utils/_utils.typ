#let word(korean, english) = box[#block(breakable: false)[#korean#sub[#english]]]

#let engraved = (fill: color.rgb("#b2b2b2"), stroke: (
  top: color.rgb("#424242"),
  left: color.rgb("#424242"),
  right: color.rgb("#e2e2e2"),
  bottom: color.rgb("#e2e2e2"),
))
#let embossed(fill) = (fill: fill, stroke: (
  top: fill.desaturate(50%).lighten(30%),
  left: fill.desaturate(50%).lighten(30%),
  right: fill.darken(30%),
  bottom: fill.darken(30%),
))
