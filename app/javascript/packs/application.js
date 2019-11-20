import "bootstrap";
import $ from 'jquery';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";
import initGoogleSign from '../components/initGoogleLog';
import initDictionary from "../components/initDictionary.js"

require("turbolinks").start()


var ready = function () {
  $(document).ready(() => {


  console.log('Nouvelle route ')

    initPhotosUpload();
    initDictionary();
    //initGoogleSign()
    initLearn();
    initPhotosUpload();
  })

};


$(document).on('turbolinks:load', ready);

