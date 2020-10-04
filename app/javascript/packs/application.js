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
require("jquery-mask-plugin/dist/jquery.mask.js")
require("bulma-pageloader")

import IMask from 'imask';

$(document).on("turbolinks:load", function() {

  [...document.getElementsByClassName("is-document")].forEach(function(el) {
    console.log("aqui")
    IMask(el, { mask: "000.000.000-00" });
  });    
  
  [...document.getElementsByClassName("is-phone")].forEach(function(el) {
    IMask(el, { mask: "(00) 00000-0000" });
  });
  

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

 $('#car_brand').on('change', function(){
  var brand = $(this).val();
  console.log(brand);  

  $.ajax({
    url: "/admin/get_car_models",
    method: "POST",  
    dataType: "json",
    data: {brand: brand},
    success: function (response) {
        console.log(response);  
        var models = response;     
        $("#car_model").empty();
        for(var i = 0; i < models.length; i++){
          $("#car_model").append('<option value="' + models[i]["id"] + '">' + models[i]["name"] + '</option>');
        }
    },
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
  });
 })
})