#import "@preview/pointless-size:0.1.2": zh as zh-size

#import "/src/fonts.typ"


#let _list-keywords(header, keywords, sep) = {
  set par(first-line-indent: 0em)
  show heading: set text(weight: "regular")
  show heading: box

  heading(header, numbering: none)
  box(sep + keywords)
}

#let abstract(zh, en) = {
  // 中文摘要页
  show title: it => {
    set text(font: fonts.sans, zh-size(-2))
    // 使用段落显示标题可让标题保持与正文的行距一致
    align(center, par(if it.body == auto { document.title } else { it.body }))
  }
  title()
  heading(numbering: none)[摘要]
  zh.abstract
  _list-keywords([关键词], zh.keywords.join([，]), [：])
  pagebreak(weak: true)

  // 英文摘要页
  set text(lang: "en", region: "us")
  heading(numbering: none)[Abstract]
  en.abstract
  _list-keywords([Keywords], en.keywords.join([, ]), [: ])
  pagebreak(weak: true)
}
