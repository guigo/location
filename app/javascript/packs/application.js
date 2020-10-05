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
import moment from 'moment';

var daysOff = []

$(document).on("turbolinks:load", function() {

  [...document.getElementsByClassName("is-document")].forEach(function(el) {
    IMask(el, { mask: "000.000.000-00" });
  });    
  
  [...document.getElementsByClassName("is-phone")].forEach(function(el) {
    IMask(el, { mask: "(00) 00000-0000" });
  }); 


  $('.days_reserved').on('click', function(){
    var car_id = this.getAttribute('value')
    $.ajax({
      url: "/portal/days_reserved",
      method: "POST",  
      dataType: "json",
      data: {car_id: car_id},
      success: function (response) {        
        if(response.length > 0){ 
          for(let i = 0; i <  response.length ; i++) {              
            response[i].map((f) => { 
              daysOff.push(f)
            });
          }         
        }    
        debugger 
      },
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
    }); 
  });
 
  $(".is-date").datepicker({ 
    dateFormat: "dd/mm/yy",
    locale: "pt-br",
    dayNames: [
      "Domingo",
      "Segunda",
      "Terça",
      "Quarta",
      "Quinta",
      "Sexta",
      "Sábado"
    ],
    dayNamesMin: ["D", "S", "T", "Q", "Q", "S", "S", "D"],
    dayNamesShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
    monthNames: [
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro"
    ],
    monthNamesShort: [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez"
    ],
    nextText: "Proximo",
    prevText: "Anterior",  
    beforeShowDay: function setDaysOff(date) {  
      for (let i = 0; i <  daysOff.length; i++) {             
        if (date.getFullYear() == moment(daysOff[i], "YYYY/MM/DD").format('YYYY')
            && date.getMonth() ==  moment(daysOff[i], "YYYY/MM/DD").format('MM') - 1
              && date.getDate() ==  moment(daysOff[i], "YYYY/MM/DD").format('DD')) {
            return [false];
        }
      }
      return [true, ''];
      }
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