import "bootstrap";
import $ from 'jquery';
import 'mousetrap';
import initPhotosUpload from "../components/initPhotosUpload.js";
import {
  initLearn
} from "../components/initLearn.js";
import initGoogleSign from '../components/initGoogleLog';
import initDictionary from "../components/initDictionary.js"
import init from "../components/initMindMap.js";
import initD3 from "../components/initD3.js"
// import 'd3-webpack-loader'
import initStickyBar from "../components/initStickyBar.js"
import "./anime";
import highlightPlant from "./highlight_plant";
import initCardLecteur from "../components/initCardLecteur.js"

require("turbolinks").start()

var ready = function () {
  $(document).ready(() => {


    console.log('Nouvelle route ')

    initPhotosUpload();
    initDictionary();
    // init();
    initD3();
    //initGoogleSign()
    // initLearn();
    initPhotosUpload();
    initStickyBar();
    highlightPlant();
    initCardLecteur();
  })

};


$(document).on('turbolinks:load', ready);
