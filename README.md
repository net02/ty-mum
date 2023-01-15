# ty-mum
*All the best things we have we made together*

A static, single page application website to honour my mother
- made with :heart: in [Elm](https://elm-lang.org/)
- hosted via [Cloudflare Pages](https://pages.cloudflare.com/)

### How-to
- use `elm reactor` as a sandbox, then head to http://localhost:8000/ to play around
- use `elm make src/Main.elm` to create a static HTML version
  - you can then visit it from the sandbox above
  - or just open the `./index.html` file in your browser
- use `elm make src/Main.elm --output=dist/main.js` to compile to javascript
  - so you can [embed it in your own HTML](https://guide.elm-lang.org/interop/#embedding-in-html)
- use `elm-format src/Main.elm --yes` to format (requires installing [elm-format](https://github.com/avh4/elm-format))

### Bucket list
TODOs, nice-to-have and ideas

- [ ] add on-hover pop-up effect on single photos
- [ ] add zoom-in modal on single photos
- [ ] with a carousel, *blackjack and hookers!*
- [ ] switch photos from cropped to full size original image
- [ ] setup analytics
- [ ] add captions
- [ ] add "go full-screen" buttons
- [x] ~~no i won't add a cookie settings banner, thank you!~~
- [ ] improve mobile UX/UI
- [ ] add photos' location and show it a map
- [ ] add a loader at startup, animations and some extra *fronzoli*
