
let routes =
  [
    Dream.get "/" Pages.home;
    Dream.get "/static/**" (Dream.static "static")
  ]