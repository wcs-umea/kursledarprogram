#let custom-pdfs(
  course: none,
  title: none,
  datetag: none,
  footer: none,
  body
) = {

  // page styling
  set page(
    fill: rgb("#880088"),
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

  // override text color for dark background
  set text(fill: white)

  // center content
  set align(center)

  image("img/wcsumea-logo.png", width: 50%)

  v(100pt)

  text(size: 4em, weight: "bold", title)

  v(20pt)

  text(size: 2.5em, weight: "bold", datetag)

  v(100pt)

  text(size: 1.5em, weight: "bold", course)
}