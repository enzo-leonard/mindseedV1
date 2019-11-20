const initPhotosUpload = () =>{
'use strict';
if (document.querySelector('#card_photo')) {

const ImageSearchAPIClient = require('azure-cognitiveservices-imagesearch');
const CognitiveServicesCredentials = require('ms-rest-azure').CognitiveServicesCredentials;
const serviceKey = "d484f69aa59d4cfd8ddba54c472562d8";

//replace this value with your valid subscription key.
//the search term for the request
let input = document.querySelector('#card_term');
const image = document.querySelector("#img");
const input_photo = document.querySelector('#card_photo');





//instantiate the image search client
let credentials = new CognitiveServicesCredentials(serviceKey);
let imageSearchApiClient = new ImageSearchAPIClient(credentials);

//a helper function to perform an async call to the Bing Image Search API
input.addEventListener("change", () => {
  let searchTerm = input.value;
  if (searchTerm == "") searchTerm = "search"
  console.log(searchTerm)


  const sendQuery = async () => {
      return await imageSearchApiClient.imagesOperations.search(searchTerm);
  };

  sendQuery().then(imageResults => {
      if (imageResults == null) {
      console.log("No image results were found.");
      }
      else {
          console.log(`Total number of images returned: ${imageResults.value.length}`);
          let firstImageResult = imageResults.value[0];
          image.src = firstImageResult.contentUrl
          input_photo.value = firstImageResult.contentUrl
          //display the details for the first image result. After running the application,
          //you can copy the resulting URLs from the console into your browser to view the image.
          console.log(`Total number of images found: ${imageResults.value.length}`);
          console.log(`Copy these URLs to view the first image returned:`);
          console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
          console.log(`First image content url: ${firstImageResult.contentUrl}`);
      }
    })
    .catch(err => console.error(err))

     });

    }

}


export default initPhotosUpload
