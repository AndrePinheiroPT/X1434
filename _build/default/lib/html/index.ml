open Tyxml.Html

let index content = html
    (head 
      (title (txt "Home")) 
      [
        link
         ~rel:[`Stylesheet]
         ~href:"/static/style.css"
         ();
      ]
    )
    (body content )