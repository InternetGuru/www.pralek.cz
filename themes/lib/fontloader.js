require("WebFont", function() {
  WebFont.load({
    google: {
      families: ['Roboto:300,400,400italic,700:latin-ext&display=swap'],
    },
    active: function () {
      sessionStorage.fonts = true
    },
  })
})