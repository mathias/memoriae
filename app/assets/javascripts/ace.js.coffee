window.aceEditorInit = ->
  window.editor = ace.edit('note-editor')
  session = editor.getSession()
  doc = session.getDocument()

  textarea = $('form textarea[name="note[body]"]')
  preview = $('form .preview')
  converter = new Showdown.converter()

  editor.setTheme('ace/theme/twilight')
  session.setMode('ace/mode/markdown')

  updatePreview = ->
    preview.html(converter.makeHtml(doc.getValue()))

  updateTextarea = ->
    textarea.html(session.getValue())
    textarea.trigger('change')

  onUpdate = ->
    updatePreview()
    updateTextarea()

  onUpdate()
  session.on 'change', onUpdate
