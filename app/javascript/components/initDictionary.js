import $ from 'jquery';

const initDictionary = () => {
  const input = document.querySelector('#new_term');
  const allDefs = document.querySelector('#new_definition');
  const divDef = document.querySelectorAll('.definitions');
  const hiddenDefs = document.querySelector('.defs-container')
  const hiddenUpdateDefs = document.querySelector('.defs-update-container')



  // const updateDefinition = (id) => {
  //   console.log(id)
  // }


  if (input) {
   document.querySelectorAll(`textArea`).forEach((term) => {
      term.addEventListener('click', (event) => {
        const id = event.currentTarget.id.split("-")[1]
        console.log(id)
        const allDefsUpdate = document.querySelector(`.update-definition${id}`);
        const divDefUpdate = document.querySelectorAll(`.definitions-update-${id}`)
        const updateDef = document.querySelector(`#def-${id}`)

        const mot = document.querySelector(`#term_${id}`).value

      fetch(`https://wordsapiv1.p.rapidapi.com/words/${mot}/definitions`, {
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
              let i = 0

              hiddenUpdateDefs.classList.toggle('hidden')

              divDefUpdate.forEach(div => {
                console.log(div)
                if (html[i] != null) {
                  div.innerText = html[i]

                  i += 1
                  div.addEventListener('click', () => {

                    hiddenUpdateDefs.classList.toggle('hidden')
                    updateDef.innerHTML = div.innerText
                  })
                }
              })

            })

            // }
            //
          })
        })
      });

    input.addEventListener('change', () => {
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
              console.log("I'm in the click")
              let i = 0
              hiddenDefs.classList.toggle('hidden')
              divDef.forEach(div => {
                if (html[i] != null) {
                  div.innerText = html[i]

                  i += 1
                  div.addEventListener('click', () => {

                    hiddenDefs.classList.toggle('hidden')
                    definition.innerHTML = div.innerText
                  })
                }
              })

            })

            // }
            //
          })
        })
        // .catch(err => console.error(err))

    })

  }
};

export default initDictionary
