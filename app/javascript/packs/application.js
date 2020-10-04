// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require allow_numeric
//= require jquery-ui

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery");
require("jquery-ui");
require("bulma-pageloader")

$(document).on("turbolinks:load", function() {

  $('.pageloader').addClass('is-active');
  setTimeout(function(){
    $('.pageloader').removeClass('is-active');
  }, 3000)

  $("#avatar").on("change", function() {     
    let r = new FileReader();
    r.onload = function(e) {       
      $(".avatar-preview").show();
      $(".avatar-preview").append("<img class='avatar-preview' src="+ e.target.result+">");
    };
    r.readAsDataURL(this.files[0]);
  });
  
})