open Tyxml.Html

module StringMap = Map.Make(String)
  
let main field_map nav_content entry content = 
  let tit = match StringMap.find_opt "title" field_map  with
    | Some v -> v
    | None -> "[NONE]"
  in
  let date = match StringMap.find_opt "date" field_map  with
    | Some v -> [i [txt v]];
    | None -> []
  in
  html
    (head (title (txt tit)) 
    [ 
      link ~rel:[`Stylesheet] ~href:"/static/style.css" ();
      script ~a:[
        a_id "MathJax-script";
        a_async ();
        a_src "https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js";
      ] (txt "")
    ])
    (body [
      div ~a:[a_id "app"] [
        header [
          nav ~a:[a_class ["header__nav"]] [ 
            a ~a:[a_href entry; a_class ["header__nav__logo"]] [img ~src:"/static/img/logo.svg" ~alt:"Logo" ()];

            img ~src:"/static/img/test.svg" ~alt:"" ~a:[a_class ["nav-icon-two"; "swapping" ]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector";"swapping"]] ();
            img ~src:"/static/img/diamond-large.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();

            div ~a:[a_class ["nav-link-group"]] nav_content;

            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/diamond-triple.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/diamond-large.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ()
          ]
        ];

        section ~a:[a_id "main"] (date @ [hr ()] @ content);
      ];
      script (Unsafe.data "let hasScrolled=false;window.addEventListener('scroll',()=>{const nav=document.querySelector('.header__nav');if(window.scrollY>50){nav.classList.add('is-scrolled');nav.classList.remove('is-initial');hasScrolled = true;}else if(hasScrolled){nav.classList.remove('is-scrolled');nav.classList.add('is-initial');}});")
    ])