#import "@preview/big-todo:0.2.0": *

#let course-template(title, doc) = {
    set page(numbering: "1")

    // content
    align(center, text(size: 20pt, title))
    outline()
    doc
}

#let primary-color = state("primary-color", blue)
#let secondary-color = state("secondary-color", green)

#let template(doc) = context {
    set heading(numbering: "1.1")

    // footnote
    set footnote.entry(separator: line(length: 50%, stroke: gradient.linear(
        secondary-color.get(),
        text.fill.lighten(20%),
        angle: 0deg,
    )))
    
    // table first raw
    show table.cell.where(y: 0): strong

    // text and paragraph
    set par(justify: true)
    set text(overhang: false, ligatures: false)

    let outline = secondary-color.get().desaturate(50%)

    set highlight(fill: primary-color.get().transparentize(50%).lighten(20%))

    show raw.where(block: false): it => box(
        stroke: 0.5pt + outline,
        radius: 2pt,
        inset: 2pt,
        fill: outline.transparentize(70%),
        it,
    )

    doc
}

#let _important(content) = context {
    block(
        stroke: (left: 1.5pt + primary-color.get()),
        width: 100%,
        inset: 5pt,
        fill: primary-color.get().transparentize(70%),
        content,
    )
}

#let _annotate(bracket, note, body) = layout(size => context {
    box[
        #place(
            horizon + left,
            dx: -55pt,
            box(width: 45pt, text(hyphenate: true, fill: primary-color.get(), note)),
        )
        #place(
            horizon + left,
            dx: -10pt,
            text(
                fill: primary-color.get(),
                $stretch(size: #{ measure(body, width: size.width).height + 0.5em }, #bracket)$,
            ),
        )
        #body
    ]
})

#let h(content) = highlight(content)

#let merge(separator: sym.arrow, ..content) = {
    content.pos().join(separator)
}


#let i(content) = _important(content)

#let a(bracket: ${$, note, body) = _annotate(bracket, note, body)
