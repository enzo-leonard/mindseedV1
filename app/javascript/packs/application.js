import "bootstrap";
import $ from 'jquery';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";
import initGoogleSign from '../components/initGoogleLog';
import initDictionary from "../components/initDictionary.js"
import init from "../components/initMindMap.js";

require("turbolinks").start()


var ready = function () {
  $(document).ready(() => {


  console.log('Nouvelle route ')

    initPhotosUpload();
    initDictionary();
    init();
    //initGoogleSign()
    initLearn();
  })

};


$(document).on('turbolinks:load', ready);

