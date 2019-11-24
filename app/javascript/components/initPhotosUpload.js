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

const changePhoto = (id) => {
  document.querySelector(`#alts_${id}`).classList.toggle('hidden')
}

const update = (id) => {
  console.log('update photo')
  document.querySelector(`#update_btn_${id}`).click()
}
const changePhotoNew = () => {containerAltPhotoNew.classList.toggle('hidden')}



const loadPhoto = (id) => {
   let searchTerm = document.querySelector(`#term_${id}`).value
   const image = document.querySelector(`#img_${id}`);
   const altPhotoId = document.querySelectorAll(`.alt-${id}`)
   const src = document.querySelector(`#photo_${id}`)

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
         src.value = firstImageResult.contentUrl
         console.log("ancienne source")
          console.log(src)
         input_photo.value = firstImageResult.contentUrl
         let i = 0

         altPhotoId.forEach((alt) => {
           alt.src = imageResults.value[i].thumbnailUrl
           i++
           alt.addEventListener('click', () => {
             image.src = alt.src
             src.value = alt.src
             update(id)
             console.log("nouvelle source")
             console.log(src)
             changePhoto(id)
           })
         })
         //display the details for the first image result. After running the application,
         //you can copy the resulting URLs from the console into your browser to view the image.
         // console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
         // console.log(`First image content url: ${firstImageResult.contentUrl}`);

       }
     })
     .catch(err => console.error(err))

   };
const loadPhotoNew = () => {
     let searchTerm = input.value;
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

           altPhoto.forEach((alt) => {
             alt.src = imageResults.value[i].thumbnailUrl
             i++
             alt.addEventListener('click', () => {
               image.src = alt.src
               input_photo.value = alt.src
               changePhotoNew()
             })
           })
           //display the details for the first image result. After running the application,
           //you can copy the resulting URLs from the console into your browser to view the image.
           // console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
           // console.log(`First image content url: ${firstImageResult.contentUrl}`);

         }
       })
       .catch(err => console.error(err))

   };


$('.btn-change-photo').click((e) => {
     let id = e.currentTarget.attributes.data_id.value
     let hidden = document.querySelector(`#alts_${id}`)
     hidden.classList.toggle('hidden')
     console.log(hidden)
     loadPhoto(id)
   });


btnChangePhoto.addEventListener('click', () => {changePhotoNew()})
document.querySelector('#new_term').addEventListener("change", loadPhotoNew)


  }}




export default initPhotosUpload
