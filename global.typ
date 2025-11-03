#import "@preview/big-todo:0.2.0": *

#let course-template(title, doc) = {
    set page(numbering: "1")
    show outline.entry.where(level: 1): it => {
        v(0.4cm)
        strong(it)
    }

    // content
    align(center, text(size: 20pt, title))
    outline()
    doc
}

#let _template(primary-color, secondary-color, doc) = {
    // page

    set heading(numbering: "1.1")
    // footnote
    set footnote.entry(separator: line(length: 50%, stroke: gradient.linear(
        primary-color,
        rgb("#ffffff00"),
        angle: 0deg,
    )))
    // table first raw
    show table.cell.where(y: 0): strong

    // text and paragraph
    set par(justify: true)
    set text(overhang: false, ligatures: false)

    let outline = secondary-color.desaturate(50%)

    show raw.where(block: false): it => box(
        stroke: 0.5pt + outline,
        radius: 2pt,
        inset: 2pt,
        fill: outline.transparentize(70%),
        it,
    )

    doc
}

#let _important(col, content) = block(
    width: 100%,
    radius: (right: 3pt),
    stroke: (left: 1.5pt + col),
    inset: 5pt,
    fill: col.transparentize(70%),
    content,
)
