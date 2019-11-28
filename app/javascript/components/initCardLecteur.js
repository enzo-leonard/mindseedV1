const initCardLecteur = () => {
  const result = document.querySelectorAll(".result-deck");
  result.forEach((r) => {
    r.addEventListener('click', (event) => {
      const right = document.querySelector('.search-right')
      const btnRight = document.querySelector('.button-bar')
      right.classList.toggle("open");
      btnRight.classList.toggle("fix-btn");
      const id = event.currentTarget.id
      const flashcards = document.querySelector('.flashcards')
      const flashcard = gon.cards;
      flashcards.innerHTML = ""

      flashcard.forEach((f) => {
        if (f.deck_id == id) {
          const card = `<div class="flashcard">
            <img src="${f.photo}" />
            <div class="flashcard-infos">
            <h2>${f.term}</h2>
            <p>${f.definition}</p>
              <p class='italic'>${f.context}</p>
            </div>
          </div>`

          flashcards.insertAdjacentHTML("beforeend", card)
        }
      })


      const noTheme = document.querySelector('.add')
      const themeExist = document.querySelector('.add2')

      if (noTheme !== null) {
        document.querySelector('.add').classList.toggle('hidden')
        document.querySelector('.add form').setAttribute('action', `/themes`)
      }
      else {
        document.querySelector(".add2").classList.toggle('hidden')
        console.log('pas clean ')
        document.querySelector('.add2 form').setAttribute('action', `/decks/${id}/import`)



        document.querySelector("#deck_theme_id").addEventListener('change', (e) => {


          document.querySelectorAll("#deck_parent_id option").forEach((option) => {
            option.classList.add('hidden')
          })


          const themeIdSelected = e.currentTarget.value
          const decks = gon.decks;
          const themes = gon.themes;


          decks.forEach((deck) => {


              if (themeIdSelected == deck.theme_id) {
                console.log(deck)

          const addOption = `<option value="${deck.id}">${deck.name}</option>`
          document.querySelector("#deck_parent_id > option").insertAdjacentHTML("afterend", addOption)
           // document.querySelector("#new_deck > input.btn.hidden.btn.btn-white").classList.toggle('hidden')
          }
        })

          })


      //         const themeId = document.querySelector("#deck_theme_id").value
      //         const decks = gon.decks;
      //         const themes = gon.themes;

      //         decks.forEach((deck) => {
      //           themes.forEach((theme) => {
      //             const userId = gon.user
      //            if (userId == theme.user_id && themeId == deck.theme_id)
      //             console.log('coucou')
      //            // const deckOptions = `
      //            //  <%= f.association :parent, :collection => @sql_for_import %>

      //            //  `

      //            //  document.querySelector('.add2').insertAdjacentHTML("beforeend", deckOptions)
      //           })

      //         })

      //       })

      // }

          // })
        // })
      }
    })
  })
}

export default initCardLecteur


