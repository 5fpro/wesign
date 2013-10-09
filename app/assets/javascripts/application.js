// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap

//= require_self

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

$(document).ready(function() {
  $(".quick-post-petition-action").on("click", function() {
    var sync_target = $('[data-content="target"]')
    var sync_content = $('[data-content="content"]')
    $("#petition_target").val($(sync_target).val());
    $("#petition_content").val($(sync_content).val());
  });
})
