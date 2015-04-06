url = "http://www.randomtext.me/api/lorem/p-10/200/"

home = () ->
  el = $("#main")
  el.append("<h1>Home</h1>")
  $.get(url, (data) ->
    el.append(data.text_out)
  )

about = () ->
  el = $("#main")
  el.append("<h1>About</h1>")
  $.get(url, (data) ->
    el.append(data.text_out)
  )

help = () ->
  el = $("#main")
  el.append("<h1>Help</h1>")
  $.get(url, (data) ->
    el.append(data.text_out)
  )

pages =
  Home:
    name: "Home"
    render: home
  About:
    name: "About"
    render: about
  Help:
    name: "Help"
    render: help

class Navbar
  @rendered = false
  @activePage = false

  constructor: (pages) ->
    @pages = pages

  navigate: (page) ->
    # don't navigate if already on page
    if @activePage == page then return

    $("#main").empty()
    if @activePage then $("#" + @activePage).removeClass "active"
    @activePage = page
    $("#" + @activePage).addClass "active"
    @pages[page].render()

  render: () ->
    # only render once
    if @rendered then return
    @rendered = true

    $("body").append(
      Handlebars.templates.navbar(pages: @pages)
    )
    for page, props of @pages
      $("#" + props.name).click(
        (e) => @navigate e.toElement.innerText
      )

navbar = new Navbar(pages)
navbar.render()

$("body").append(
  Handlebars.templates.main()
)

navbar.navigate("Home")
