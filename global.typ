#let lighten = 85%

#let course-template(title, doc) = {
    set page(numbering: "1")

    // outline
    show outline.entry.where(level: 1): it => {
        show repeat: none
        v(0.4cm)
        strong(it)
    }
    show outline: it => {
        it
        pagebreak(weak: true)
    }
    set outline(title: none)

    // content
    align(center, text(size: 20pt, title))
    outline()
    doc
}

#let primary-color = state("primary-color", blue)
#let secondary-color = state("secondary-color", green)

#let template(doc) = context {
    // heading
    set heading(numbering: "1.1")

    // table first raw
    show table.cell.where(y: 0): strong

    // text and paragraph
    set par(justify: true)
    set text(overhang: false, ligatures: false)

    let outline = secondary-color.get().desaturate(50%)

    set highlight(fill: primary-color.get().transparentize(50%).lighten(20%))

    show raw.where(block: false): highlight.with(
        fill: secondary-color.get().lighten(lighten),
        radius: 2pt,
        top-edge: 1em,
    )
    show raw.where(block: true): it => box(
        stroke: 0.5pt + outline,
        radius: 2pt,
        inset: 2pt,
        fill: outline.transparentize(70%),
        it,
    )

    doc
}

#let important(content) = context {
    let color = primary-color.get()
    show: block.with(
        stroke: (left: 1.5pt + color),
        width: 100%,
        inset: 5pt,
        fill: color.lighten(lighten),
    )
    content
}

#let annotate(bracket, note, body) = layout(size => context {
    show: box.with()
    place(
        horizon + left,
        dx: -55pt,
        box(width: 45pt, text(hyphenate: true, fill: primary-color.get(), note)),
    )
    place(
        horizon + left,
        dx: -10pt,
        text(
            fill: primary-color.get(),
            $stretch(size: #{ measure(body, width: size.width).height + 0.5em }, #bracket)$,
        ),
    )
    body
})


#let merge(separator: sym.arrow, ..content) = {
    content.pos().join(separator)
}

#let note(supplement: none, title, body) = context {
    let color = primary-color.get()
    let header = []
    if (supplement != none) {
        header = smallcaps(lower(supplement)) + [: ]
    }
    header += title
    show: block.with(stroke: 1pt + color, fill: color.lighten(lighten), inset: 5pt, radius: 2pt)
    strong(header)
    v(1pt)
    body
}

// shortcuts
#let h(content) = highlight(content)
#let u(content) = underline(content)
#let i(content) = important(content)
#let n(supplement: none, title, body) = note(supplement, title, body)

#let a(bracket: ${$, note, body) = annotate(bracket, note, body)


