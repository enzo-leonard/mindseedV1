const initDictionary = () => {

  const input = document.querySelector('#new_term');
  if (input) {



  input.addEventListener('change', () => {

    const definition = document.querySelector("#new_definition");
    fetch(`https://wordsapiv1.p.rapidapi.com/words/${document.querySelector('#new_term').value}/definitions`, {
        "method": "GET",
        "headers": {
          "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
          "x-rapidapi-key": "4e917b8f2dmsh4fa52e5533bb1d1p1a5513jsn5cac3f95ad3e"
        }
      })
      .then(response => {
        response.json().then(data => {
          if (data.message == "word not found") {
            console.log("Word not found.");
          } else {
            definition.innerHTML = data.definitions[0].definition
            console.log(data.definitions[0].definition)
            data.definitions.forEach(def =>
            console.log(def.definition)
        )}
      })
    })
    .catch(err => console.error(err))

   })

  }
};

export default initDictionary
