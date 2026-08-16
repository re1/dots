; Inject JavaScript into template_substitution nodes inside HTML
(
  (template_substitution) @injection.content
  (#set! injection.language "javascript")
)
