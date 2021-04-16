// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap
//= require jquery3
//= require popper
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on("turbolinks:load", () => {
  $(".spinner-border").hide();

  $(document).on('ajax:send', function() {
    $('.spinner-border').show();
  });

  $(document).on('ajax:complete', function(){
    setTimeout(() => {$('.spinner-border').hide();}, 100);
  });
  //auto hide alert messages
  $(".alert").delay(3000).slideUp(500);
});
