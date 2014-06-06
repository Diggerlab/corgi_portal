#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

getSelectedApps = (form) ->
  ids = []
  $(form).find("input:checked").each (index, control) ->
    ids.push($(control).val())
  return ids

activateSubmenu = () ->
  path = window.location.pathname
  current_link = $("#admin_menu").find('a[href^="/'+ path.split('/')[1]+'"]')
  if current_link
    $("#admin_menu").children("li").removeClass()
    current_link.parents('li').addClass('active')

$ ->
  activateSubmenu()

  $("#btn-new").click (e) ->
    window.location.href = "/apps/new"

  $("#btn-remove").click (e) ->
    if window.confirm("Are you sure to remove selected apps?")
      form = $('#remove_form')
      $(form).find("input[name=ids]").val getSelectedApps($('#apps_table'))
      $(form).submit()

  $("#btn-toggle").click (e) ->
    if window.confirm("Are you sure to toggle selected apps?")
      form = $('#toggle_form')
      $(form).find("input[name=ids]").val getSelectedApps($('#apps_table'))
      $(form).submit()
