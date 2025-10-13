
#set text(fill: rgb("#444444"))
#set par(leading: 0.7em)
#set block(spacing: 1.4em)


#set table(
  gutter: 0.0em,
  stroke: rgb("C0C0C0"),
  inset: (right: 1.5em, top: 0.5em, bottom: 0.5em),
)



#let custom-pdfs(
  course: none,
  title: none,
  datetag: none,
  footer: none,

  body

) = {
  

  // body font
  set text(12.5pt)


  set page(
    margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 3cm),

    footer: {
      set text(8pt)
      set par(leading: 0.5em)
      set block(spacing: 1em)
      set par(justify: true)
      footer
      set text(6pt)
    }
  )



  // underline links.
  show link: underline

  // page body
  grid(
    columns: 1fr,
    row-gutter: 20pt,
    

    // body flow
    {
      set par(justify: true)
      body
    }

  )
}