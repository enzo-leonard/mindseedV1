import $ from 'jquery';

const initPhotosUpload = () => {
'use strict';
if (document.querySelector('.decks.show')) {


   const modalAfter = document.querySelector('.modal-after')
   console.log(modalAfter)
   modalAfter.addEventListener('click', () => {
      console.log('changement de la modal after')
      replaceNoPhoto();
    })


  const ImageSearchAPIClient = require('azure-cognitiveservices-imagesearch');
  const CognitiveServicesCredentials = require('ms-rest-azure').CognitiveServicesCredentials;
  const serviceKey = "4182fdf2da204cfda3fbdd407fbfc6db";
  let credentials = new CognitiveServicesCredentials(serviceKey);
  let imageSearchApiClient = new ImageSearchAPIClient(credentials);

  const replaceNoPhoto = () => {
    console.log('replace no photo')

    let noPhoto = []

    document.querySelectorAll('.hidden-photo').forEach((pic) => {
      if (pic.value == "") {
        let id = pic.id.split('_')[1]
        noPhoto.push(id)
      }
    })

    console.log('no photo : '+noPhoto)
    noPhoto.forEach((id) => {
      let image = document.querySelector(`#img_${id}`)
      let searchTerm = document.querySelector(`#term_${id}`).value
      let src = document.querySelector(`#photo_${id}`)
      if (searchTerm == "") searchTerm = "search"

      const sendQuery = async () => {return await imageSearchApiClient.imagesOperations.search(searchTerm); };

      sendQuery()
      .then(imageResults => {
        if (imageResults == null) {
          console.log("No image results were found.");
        } else {
          let firstImageResult = imageResults.value[0];
          if (firstImageResult){
          image.src = firstImageResult.contentUrl
          src.value = firstImageResult.contentUrl
          document.querySelector(`#update_btn_${id}`).click()
          }
        }
    })
    .catch(err => console.error(err))
  })
}

replaceNoPhoto()




let input = document.querySelector('#new_term');
const image = document.querySelector("#new-img");
const input_photo = document.querySelector('#new_img_hidden');
const altPhoto = document.querySelectorAll('.alt-photo-new');
const containerAltPhotoNew = document.querySelector('.alt-photo-container-new')
const btnChangePhoto = document.querySelector('.btn-change-photo-new')



//instantiate the image search client


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
         input_photo.value = firstImageResult.contentUrl
         let i = 0

         altPhotoId.forEach((alt) => {
           alt.src = imageResults.value[i].thumbnailUrl
           i++
           alt.addEventListener('click', () => {
             image.src = alt.src
             src.value = alt.src
             update(id)
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



  if (document.querySelector('.btn-change-photo')){
    document.querySelectorAll('.btn-change-photo').forEach((btn) => {
      btn.addEventListener('click', (e) => {
        let id = e.currentTarget.attributes.data_id.value
        let hidden = document.querySelector(`#alts_${id}`)
        hidden.classList.toggle('hidden')
        console.log("la")
        loadPhoto(id)

    })
    });


btnChangePhoto.addEventListener('click', () => {changePhotoNew()})
document.querySelector('#new_term').addEventListener("change", loadPhotoNew)
  }

  }

}




export default initPhotosUpload
