import "bootstrap";
import $ from 'jquery';
import 'mousetrap';
import initPhotosUpload from "../components/initPhotosUpload.js";
import { initLearn } from "../components/initLearn.js";
import initGoogleSign from '../components/initGoogleLog';
import initDictionary from "../components/initDictionary.js"
import init from "../components/initMindMap.js";
import initD3 from "../components/initD3.js"
import initStickyBar from "../components/initStickyBar.js"
import "./anime";
import highlightPlant from "./highlight_plant";
import render from "../components/initTree"
import initInput from "../components/initInput"

require("turbolinks").start()

var ready = function () {
  $(document).ready(() => {


  console.log('Nouvelle route ')

    const json = (document.querySelector('.raw-json'))
    if (json) render(JSON.parse(json.innerHTML))

    initPhotosUpload();
    initInput();
    initDictionary();
   // init();
    initD3();
    //initGoogleSign()
    initLearn();
    initPhotosUpload();
    initStickyBar();
    highlightPlant();

  })

};


$(document).on('turbolinks:load', ready);

