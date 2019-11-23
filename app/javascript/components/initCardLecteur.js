const initCardLecteur = () => {
  const result = document.querySelectorAll(".result");
  result.forEach((r) => {
    r.addEventListener('click', (event) => {
      const id = event.currentTarget.id
      const flashcards = document.querySelector('.flashcards')
      const flashcard = gon.cards;
      flashcards.innerHTML = ""
      flashcard.forEach((f) => {
      if (f.deck_id == id ) {
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
    })
  })
}

export default initCardLecteur
