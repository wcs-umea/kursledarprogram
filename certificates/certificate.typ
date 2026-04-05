#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm)
)

#set text(fill: rgb("#444444"))
#set par(leading: 0.8em)

// Inputs from CLI
#let name = sys.inputs.name
#let date = sys.inputs.date
#let cert_id = sys.inputs.cert_id
#let course = sys.inputs.course
#let issuer = sys.inputs.issuer
#let signer = sys.inputs.signer
#let role = sys.inputs.role

// Center everything by default
#set align(center)


// Logo
#image("img/wcsumea-logo-black.png", width: 35%)

#v(1.2cm)

// Title
#text(size: 2.8em, weight: "bold", fill: rgb("#621273"))[
  Kursintyg
]



// Intro text
#text(size: 1.1em)[
  Det här intyget verifierar att
]


// Name (highlighted)
#text(size: 3em, weight: "bold")[
  #name
]


// Description
#text(size: 1.1em)[
  har slutfört 
]


// Course name
#text(size: 2em, weight: "bold", fill: rgb("#621273"))[
  #course
]


// Issuer
#text(size: 1.1em)[
  av 
]

#v(0.1cm)

#text(size: 1.5em, weight: "bold")[
  #issuer
]

#text(size: 1em)[
  #date
]

#v(0.3cm)

#align(center)[
  #block()[
    #set par(justify: true)
    #par[
      Utbildningen har omfattat kursplanering för Steg 1 och Steg 2, samt grundläggande pedagogik, 
      ledarskap, anpassning av undervisning, skapande av trygga och inkluderande 
      lärmiljöer, musikval samt reflekterande undervisningspraktik inom West Coast Swing.
    ]
  ]
]

#v(0.5cm)

#align(left)[
    #image("img/signature_cropped.png", width: 35%)
]

// Bottom row: certificate ID + signature
#align(left)[

      #signer
      #linebreak()
      #role
    ]

 