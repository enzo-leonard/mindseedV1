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
      document.querySelector('.selector') !== null;

      const noTheme = document.querySelector('.add')
      const themeExist = document.querySelector('.add2')

      if (noTheme !== null) {
      document.querySelector('.add').classList.toggle('hidden')
      document.querySelector('.add form').setAttribute('action', `/themes`)
}

else {
      document.querySelector('.add2').classList.toggle('hidden')
      document.querySelector('.add2 form').setAttribute('action', `/decks/${id}/import`)
}
    })
  })
}

export default initCardLecteur


