#import "@preview/fletcher:0.4.2" as fletcher: node, edge
#import "_palette.typ": *
#import "_utils.typ": *

#let post(no, subtitle, content) = {
  set page(fill: color.rgb("#d2d2d2"))
  set text(font: "Pretendard")
  show heading.where(level: 1): set text(size: 24pt)
  show heading.where(level: 2): set text(size: 20pt)
  show heading.where(level: 3): set text(size: 16pt)
  show heading.where(level: 4): set text(size: 14pt)
  show heading.where(level: 5): set text(size: 10pt)

  // ref: https://gist.github.com/aifrak/36d54bf8c97b9b888e7dc41ee00547be
  show raw.where(lang: "typlog_regexp"): content => {
    // Based on Typst Light Theme: https://github.com/typst/typst/blob/a33d8bf32208ef0fe8556200dd0c9c5a1ad10c54/crates/typst/src/text/raw.rs#L829-L864
    let default-fill = color.rgb("#298e0d")
    let fg(fill) = content => context {
      if text.fill.to-hex() == default-fill.to-hex() {
        text(fill: color.rgb(fill))[#content]
      } else {
        content
      }
    }

    // seealso: https://macromates.com/manual/en/regular_expressions

    // == Character types
    set text(fill: default-fill)
    // == Syntax Element
    show regex("[\\|()]"): fg("#d73a49")
    // == Characters
    show regex("\\\\[tvnrbfae]|\\\\[0-7]{3}|(\\\\x[0-9a-fA-F]{2})"): fg("#16718d")
    // == Character Property
    show regex("\\\\[pP]\\{[^}]*\\}"): fg("#8b41b1")
    // == Quantifier
    show regex("[?+*]"): fg("#d73a49")
    show regex("\\{([0-9]+,?|[0-9]*,[0-9]+)\\}"): fg("#d73a49")
    // == Anchors
    show regex("^$\\\\[bBAZzG]"): fg("#16718d")
    // == Character class
    show regex("\\[[^]]*\\]"): fg("#4b69c6")
    // == Extended groups
    show regex("\\?<[^>]+>"): fg("#16718d")
    content
  }

  [= 프로그래밍 언어를 만들자\ #text(size: 3em / 4)[\##no : #subtitle]]
  content
}
