# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  Dropzone.options.employeeImport =
    init: () ->
      this.options.autoProcessQueue = false
      this.options.maxFiles = 1
      this.dictDefaultMessage = "Drag & Drop CSV Here"
      this.on "addedfile", (file) ->
        handleFileUpload(file)

  handleFileUpload = (file) ->
    if window.File && window.FileReader && window.FileList && window.Blob
      if file
        r = new FileReader()
        r.onload = (e) ->
          contents = e.target.result
          getCsvRows(contents)
        # Assuming file type is CSV
        r.readAsText(file)
      else
        alert "Failed to load the file."
    else
      alert "Your browser does not support this feature.  Works best with Sarari, IE, FF, and Chrome."

  getCsvRows = (contents) ->
    Papa.parse(contents,
      complete: (results) ->
        rows = $.map(results.data, (val,i) -> val.join())
        loadTable(rows)
    )

  columnToAttr = (column) ->
    columns = {"Email":"email", "Payout":"payout", "Unused":"unused"}
    columns[column]

  rowToAttrHash = (row, schema) ->
    attrs = {}
    cells = row.split(",")
    $.each cells, (index, cell) ->
      if !(schema[index] == "Unused" || columnToAttr(schema[index]) == false)
        attrs[columnToAttr(schema[index])] = cell
    attrs

  getSchema = () ->
    schema = []
    $.each $('table#employees-table thead select'), (key, select) ->
      column_value = $(select).val();
      if columnToAttr(column_value)
        schema.push column_value
    schema

  hasHeaders = () ->
    $('input#headers').is(':checked')

  buildSelectHeaders = (rows) ->
    columns = ["Email", "Payout", "Unused"]
    $.each rows[0].split(","), (index, column) ->
      header_class = ""
      dropdown = "<select class=\"header-select\">"
      dropdown += $.map(columns, (val, map_index) ->
        selected_text = ""
        if index >= columns.length && val == "Unused" || columns[index] == "Unused"
          selected_text = "selected"
          header_class = "unused"
          $("table#employees-table tr td:nth-child(" + (index + 1) + ")").addClass "unused"
        if val == columns[index]
          selected_text = "selected"
        "<option value=\"" + val + "\" " + selected_text + ">" + val + "</option>"
      ).join("")
      dropdown += "</select>"
      $("table#employees-table thead tr:first").append "<th class=\"" + header_class + "\">" + dropdown + "</th>"

  importRows = (rows) ->
    if hasHeaders()
      rows.shift()
    $.each rows, (i,row) ->
      attrs = rowToAttrHash(row, getSchema())
      $('#import-employees').after "<p>" + JSON.stringify(attrs) + "</p>"

  loadTable = (rows) ->
    $.each rows.slice(0,5), (k,v) ->
      attributes = v.split(",")
      $('table#employees-table tbody').append '<tr><td>' + attributes.join('</td><td>') + '</td></tr>'
    buildSelectHeaders(rows)
    $('#headers-checkbox').fadeIn('slow')
    $('button#import-employees').fadeIn('slow')
    $('table#employees-table').slideDown()
    $('button#import-employees').bind "click", () ->
      importRows(rows)

  $(document).on "change", ".header-select", (e) ->
    header = $(this).parent()
    columnIndex = header.index() + 1
    nthCells = $("table#employees-table tr td:nth-child(" + columnIndex + ")")
    if $(this).val() == "Unused"
      header.addClass "unused"
      nthCells.addClass "unused"
    else
      header.removeClass "unused"
      nthCells.removeClass "unused"

  $(document).on "change", "input#headers", (e) ->
    $("table#employees-table tbody tr:first").toggleClass "unused"
