// AUTOMATICALLY GENERATED FILE, DO NOT EDIT!
#import "../global.typ": *

#let primary-color = rgb("#00aa88")
#let secondary-color = rgb("#ffaa00")

#let template(doc) = _template(primary-color, secondary-color, doc)

#let important(content) = _important(primary-color, content)
#let i(content) = important(content)

#let annotate(note,body) = _annotate(fill:primary-color, note,body)
#let a(note,body) = annotate(note,body)
