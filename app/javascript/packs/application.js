import "bootstrap";
import $ from 'jquery';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";
import initGoogleSign from '../components/initGoogleLog';
import initPhotosUpload from "../components/initPhotosUpload.js"
import initDictionary from "../components/initDictionary.js"

require("turbolinks").start()


var ready = function () {
  console.log('Nouvelle route ')

    initPhotosUpload();
    initDictionary();
    initGoogleSign()
    initLearn();
    initPhotosUpload();


};


$(document).on('turbolinks:load', ready);

