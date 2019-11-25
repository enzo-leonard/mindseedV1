import $ from 'jquery';

const initPhotosUpload = () => {
'use strict';
if (document.querySelector('#new-img')) {


const ImageSearchAPIClient = require('azure-cognitiveservices-imagesearch');
const CognitiveServicesCredentials = require('ms-rest-azure').CognitiveServicesCredentials;
const serviceKey = "d484f69aa59d4cfd8ddba54c472562d8";

let input = document.querySelector('#new_term');
const image = document.querySelector("#new-img");
const input_photo = document.querySelector('#new_img_hidden');
const altPhoto = document.querySelectorAll('.alt-photo-new');
const containerAltPhotoNew = document.querySelector('.alt-photo-container-new')
const btnChangePhoto = document.querySelector('.btn-change-photo-new')



//instantiate the image search client
let credentials = new CognitiveServicesCredentials(serviceKey);
let imageSearchApiClient = new ImageSearchAPIClient(credentials);

const changePhoto = (id) => {document.querySelector(`.alt-photo-container-${id}`).classList.toggle('hidden')}

const changePhotoNew = () => {containerAltPhotoNew.classList.toggle('hidden')}



const loadPhoto = (id) => {
    console.log('update photo')
   let searchTerm = document.querySelector(`#term_${id}`).value
   const image = document.querySelector(`#img-${id}`);
   const altPhotoId = document.querySelectorAll(`.alt-${id}`)
   if (searchTerm == "") searchTerm = "search"

   const sendQuery = async () => {
     return await imageSearchApiClient.imagesOperations.search(searchTerm);
   };

   sendQuery().then(imageResults => {
       if (imageResults == null) {
         console.log("No image results were found.");
       } else {
         let firstImageResult = imageResults.value[0];
         image.src = firstImageResult.contentUrl
         input_photo.value = firstImageResult.contentUrl
         let i = 0

         altPhotoId.forEach((alt) => {
           alt.src = imageResults.value[i].thumbnailUrl
           i++
           alt.addEventListener('click', () => {
             image.src = alt.src
             changePhoto(id)
           })
         })
         //display the details for the first image result. After running the application,
         //you can copy the resulting URLs from the console into your browser to view the image.
         // console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
         // console.log(`First image content url: ${firstImageResult.contentUrl}`);
         console.log(imageResults.value)
       }
     })
     .catch(err => console.error(err))

   };

   const loadPhotoNew = () => {
     console.log('new photo')
     let searchTerm = input.value;
     if (searchTerm == "") searchTerm = "search"
     console.log(searchTerm)

     const sendQuery = async () => {
       return await imageSearchApiClient.imagesOperations.search(searchTerm);
     };

     sendQuery().then(imageResults => {
         if (imageResults == null) {
           console.log("No image results were found.");
         } else {
           let firstImageResult = imageResults.value[0];
           image.src = firstImageResult.contentUrl
           input_photo.value = firstImageResult.contentUrl
           let i = 0

           altPhoto.forEach((alt) => {
             alt.src = imageResults.value[i].thumbnailUrl
             i++
             alt.addEventListener('click', () => {
               image.src = alt.src
               input_photo.value = alt.src
               console.log('new')
               changePhoto("new")
             })
           })
           //display the details for the first image result. After running the application,
           //you can copy the resulting URLs from the console into your browser to view the image.
           // console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
           // console.log(`First image content url: ${firstImageResult.contentUrl}`);
           console.log(imageResults.value)
         }
       })
       .catch(err => console.error(err))

   };


document.querySelector('.btn-change-photo').addEventListener('click', (e) => {
     let id = e.currentTarget.attributes.data_id.value
     console.log("je suis dans le clic frérot")
     const hidden = document.querySelector(`[data_container_id='${id}']`)
     console.log(hidden)
     hidden.classList.toggle('hidden')

     loadPhoto(id)
   });


btnChangePhoto.addEventListener('click', () => {changePhotoNew()})
document.querySelector('#new_term').addEventListener("change", loadPhotoNew)


  }}




export default initPhotosUpload
