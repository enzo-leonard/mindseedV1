import "bootstrap";
import $ from 'jquery';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";

require("turbolinks").start()


var ready = function () {
  console.log('Nouvelle route ')


    initLearn();
    initPhotosUpload();


};


$(document).on('turbolinks:load', ready);

