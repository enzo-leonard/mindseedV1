import "bootstrap";
import $ from 'jquery';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";

require("turbolinks").start()
require("@rails/activestorage").start()


var ready = function () {
  console.log('Nouvelle routes')

  $(document).ready(()=>{
    console.log('DOM chargé')
    initLearn();
    initPhotosUpload();
  })

};


$(document).on('turbolinks:load', ready);

