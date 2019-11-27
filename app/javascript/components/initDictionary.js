import $ from 'jquery';

const initDictionary = () => {
  const input = document.querySelector('#new_term');
  const allDefs = document.querySelector('#new_definition');
  const divDef = document.querySelectorAll('.definitions');
  const containerNew = document.querySelector('.defs-container-new')





  const googleKnowledge = (query) => {
    console.log('google api with: '+query)
    var service_url = 'https://kgsearch.googleapis.com/v1/entities:search';
    var params = {
      'query': query,
      'limit': 5,
      'indent': true,
      'key': 'AIzaSyDSadQ6BhTJzITsuhwYLCswPbaFKRWfrkQ',
    };

    $.getJSON(service_url + '?callback=?', params, function (response) {
      console.log(response.itemListElement)
      // $.each(response.itemListElement, function (i, element) {
      //   $('<div>', { text: element['result']['name'] }).appendTo(document.body);
      // });
    });

  }

  if (input) {


    const modalAfter = document.querySelector('.editable')
    modalAfter.addEventListener('click', () => {
      const def = document.querySelectorAll('.modal-after .update-definition')
      def.forEach((d) => {
        const id = d.id.split('-')[1]
        const term = document.querySelector(`#term_${id}`).value
        const divDefUpdate = document.querySelectorAll(`.definitions-update-${id}`)


        if (d.value != null) {

        fetch(`https://wordsapiv1.p.rapidapi.com/words/${term}/definitions`, {
          "method": "GET",
          "headers": {
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key": "4e917b8f2dmsh4fa52e5533bb1d1p1a5513jsn5cac3f95ad3e"
          }
        }).then(response => {
          response.json().then(data => {
            if (data.message == "word not found") {
              console.log("Word not found.");
            } else {

              const html = data.definitions.map(definition => {
                return `${definition.definition}`;
              })
              let i = 0
              d.value = html[0]

              divDefUpdate.forEach(div => {
                if (html[i] != null) {
                  div.classList.toggle('hidden')
                  div.innerText = html[i]
                  i += 1
                  div.addEventListener('click', () => {
                    document.querySelector(`#container_${id}`).classList.toggle('hidden')
                    updateDef.innerHTML = div.innerText
                    const form = document.querySelector(`#edit_card_${id}`)
                    Rails.fire(form, 'submit');
                  })
                }
              })




            }
          })
        })

      }
        console.log(term)



      })
    })

   document.querySelectorAll(`textArea`).forEach((term) => {
      term.addEventListener('click', (event) => {
        const id = event.currentTarget.id.split("-")[1]
        const allDefsUpdate = document.querySelector(`.update-definition${id}`);
        const divDefUpdate = document.querySelectorAll(`.definitions-update-${id}`)
        const updateDef = document.querySelector(`#def-${id}`)
        const mot = document.querySelector(`#term_${id}`).value
        document.querySelector(`#container_${id}`).classList.toggle('hidden')
        googleKnowledge(mot)

      fetch(`https://wordsapiv1.p.rapidapi.com/words/${mot}/definitions`, {
          "method": "GET",
          "headers": {
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key": "4e917b8f2dmsh4fa52e5533bb1d1p1a5513jsn5cac3f95ad3e"
          }
        }).then(response => {
          response.json().then(data => {
            if (data.message == "word not found") {
              console.log("Word not found.");
            } else {

            const html = data.definitions.map(definition => {
              return `${definition.definition}`;
            })
              let i = 0

              divDefUpdate.forEach(div => {
                if (html[i] != null) {
                  div.classList.toggle('hidden')
                  div.innerText = html[i]
                  i += 1
                  div.addEventListener('click', () => {
                    document.querySelector(`#container_${id}`).classList.toggle('hidden')
                    updateDef.innerHTML = div.innerText
                    document.querySelector(`#update_btn_${id}`).click()
                  })
                }
              })




            }
            })
          })
        })
      });

    input.addEventListener('change', () => {
      console.log('la')
      const definition = document.querySelector("#new_definition");

      fetch(`https://wordsapiv1.p.rapidapi.com/words/${input.value}/definitions`, {
          "method": "GET",
          "headers": {
            "x-rapidapi-host": "wordsapiv1.p.rapidapi.com",
            "x-rapidapi-key": "4e917b8f2dmsh4fa52e5533bb1d1p1a5513jsn5cac3f95ad3e"
          }
        }).then(response => {
          response.json().then(data => {
            // if (data.message == "word not found") {
            //   console.log("Word not found.");
            // } else {

            const html = data.definitions.map(definition => {
              return `${definition.definition}`;
            })
            if (html[0] != null) {
              definition.innerHTML = html[0]
            };

            allDefs.addEventListener('click', () => {
              let i = 0
              containerNew.classList.toggle('hidden')
              divDef.forEach(div => {
                if (html[i] != null) {
                  div.innerText = html[i]
                  div.classList.toggle('hidden')
                  i += 1
                  div.addEventListener('click', () => {
                    containerNew.classList.toggle('hidden')
                    definition.innerHTML = div.innerText
                  })
                }
              })

            })
          })
        })
        .catch(err => console.error(err))
    })
  }
};

export default initDictionary
