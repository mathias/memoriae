pageChange '.notes-create', aceEditorInit
pageChange '.notes-edit', aceEditorInit
pageChange '.notes-new', aceEditorInit

pageChange '.notes-show', ->
  converter = new Showdown.converter()
  scope = $('.notes-show')
  content = scope.find('#note-body').text()
  scope.find('.preview').html converter.makeHtml(content)
