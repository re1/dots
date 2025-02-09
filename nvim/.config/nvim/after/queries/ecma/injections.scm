; extends

; /* HTML */ `<html>` or /*html*/ `<html>`
((comment) @comment
 (#match? @comment "^/\\* ?(HTML|html) ?\\*/")
 (template_string) @injection.content
 (#set! injection.include-children)
 (#set! injection.language "html"))
