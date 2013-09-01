function progressBarWidth(){
  setTimeout(function () {
    var progress_bar_width = $('.progress-bar-with-text').width();
    $(".current-progress-bar-with-text").addClass("in");
    $(".current-progress-bar-with-text-wrapper").css("width",progress_bar_width);
  }, 100);
}

function signPetitionWidth() {
  var signPetitionWidth = $('.petition-right-col').width();
  $(".petition-affix").css("width", signPetitionWidth);
}

progressBarWidth();
signPetitionWidth();
$(window).resize(function() {
  progressBarWidth();
  signPetitionWidth();
});


jQuery(window).load(function() {
  setTimeout(function () {
    var $sideBar = $('.petition-affix')
    $sideBar.affix({
      offset: {
      top: function () {
                return (this.top = $('.petition-affix').offset().top)
              },
      bottom: function () {
                return (this.bottom = $('.footer').outerHeight(true) + 48 )
              }
      }
    })
    window._sidebar = $sideBar;
  }, 100)
}).resize( function() {
  // _sidebar.data('bs.affix').options.offset.top = $('.petition-affix').offset().top
  _sidebar.data('bs.affix').options.offset.bottom = $('.footer').outerHeight(true) + 48
})
