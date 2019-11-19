const initPhotosUpload = () =>{
'use strict';
const ImageSearchAPIClient = require('azure-cognitiveservices-imagesearch');
const CognitiveServicesCredentials = require('ms-rest-azure').CognitiveServicesCredentials;

//replace this value with your valid subscription key.
//the search term for the request
let searchTerm = "blue waffle";

//instantiate the image search client
let credentials = new CognitiveServicesCredentials(serviceKey);
let imageSearchApiClient = new ImageSearchAPIClient(credentials);

//a helper function to perform an async call to the Bing Image Search API
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
        //display the details for the first image result. After running the application,
        //you can copy the resulting URLs from the console into your browser to view the image.
        console.log(`Total number of images found: ${imageResults.value.length}`);
        console.log(`Copy these URLs to view the first image returned:`);
        console.log(`First image thumbnail url: ${firstImageResult.thumbnailUrl}`);
        console.log(`First image content url: ${firstImageResult.contentUrl}`);
    }
  })
  .catch(err => console.error(err))
};

export default initPhotosUpload
