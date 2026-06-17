open Tyxml.Html

let index content = 
  html
    (head (title (txt "Test")) [ link ~rel:[`Stylesheet] ~href:"/static/style.css" ();])
    (body [
      div ~a:[a_id "app"] [
        header [
          nav ~a:[a_class ["header__nav"]] [ 
            a ~a:[a_href "/"; a_class ["header__nav__logo"]] [img ~src:"/static/img/logo.svg" ~alt:"Logo" ()];

            img ~src:"/static/img/test.svg" ~alt:"" ~a:[a_class ["nav-icon-two"; "swapping" ]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector";"swapping"]] ();
            img ~src:"/static/img/diamond-large.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();

            div ~a:[a_class ["nav-link-group"]] [
              div ~a:[a_class ["header__nav__sublinks"]] [
                a ~a:[a_href "#"; a_class ["header__nav__sublink"]] [txt "Posts"];
                a ~a:[a_href "#"; a_class ["header__nav__sublink"]] [txt "Handouts"];
                a ~a:[a_href "#"; a_class ["header__nav__sublink"]] [txt "Books"]
              ]
            ];

            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/diamond-triple.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ();
            img ~src:"/static/img/line-center.svg" ~alt:"" ~a:[a_class ["nav-line-connector"]] ();
            img ~src:"/static/img/diamond-large.svg" ~alt:"" ~a:[a_class ["nav-icon"]] ()
          ]
        ];

        section ~a:[a_id "main"] [content];
      ];
      script (Unsafe.data "let hasScrolled=false;window.addEventListener('scroll',()=>{const nav = document.querySelector('.header__nav');if(window.scrollY>50){nav.classList.add('is-scrolled');nav.classList.remove('is-initial');hasScrolled = true;}else if(hasScrolled){nav.classList.remove('is-scrolled');nav.classList.add('is-initial');}});")
    ])

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router Web.Routes.routes