; extends

; /* HTML */ `<html>` or /*html*/ `<html>`
(
  (comment) @comment
  .
  (template_string) @injection.content
  (#match? @comment "^/\\* ?(HTML|html) ?\\*/$")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children)
  (#set! injection.language "html")
  (#set! injection.combined)
)
