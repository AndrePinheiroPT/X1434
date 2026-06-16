let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router Web.Routes.routes