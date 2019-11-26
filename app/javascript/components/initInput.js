
import $ from 'jquery';
const initInput = () => {

  const addBtn = document.querySelector('.btn-add')

  const containerNew = document.querySelector('#form-container-card')
  if (addBtn) {


  containerNew.addEventListener('change', () => {
    console.log('changement formulaire')

    const btnNew = document.querySelector('.btn-new')
    btnNew.addEventListener('click', () => {
      console.log('envoie formulaire')
      let form = document.querySelector('.simple_form.new_card')
      console.log(form)
      Rails.fire(form, 'submit');

    })

  })


    const btnOtp = document.querySelector('.btn-opt')


    addBtn.addEventListener('mouseover', () => {
      btnOtp.classList.toggle('opt-visible')
      setTimeout(function () {
        btnOtp.classList.remove('opt-visible')
      }, 2000);

    })

    const editable = document.querySelector('.editable')
    const saveBtn = document.querySelector('#save-text-btn')
    let words = []
    saveBtn.addEventListener('click', () => {

      words = editable.innerText.split(' ')

      editable.innerHTML = ""
      words.forEach((word) => {
        editable.innerHTML += `<div class=word id="${word}">${word}</div>&nbsp`
      })
      words = []

      let savedWords = document.querySelectorAll('.word')
      savedWords.forEach((w) => {
        w.addEventListener('click', () => {
          addCard(w.innerHTML)


        });
      })
    })



    addBtn.addEventListener('click', () => {
      const add = document.querySelector('.new')
      if (addBtn.innerHTML == "+") addBtn.innerHTML = '-';
      if (addBtn.innerHTML == "-") addBtn.innerHTML = '+';
      add.classList.toggle('hidden')
      window.scrollTo(0, document.body.scrollHeight);
    })


    const update = (id) => { document.querySelector(`#update_btn_${id}`).click() }

    const btnUpdate = document.querySelectorAll(`.update-event`)
    btnUpdate.forEach((btn) => {
      btn.addEventListener('change', (event) => {
        const id = event.currentTarget.attributes.id.value.split('_')[1]
        update(id)
      })
    })


    const addCard = (word) => {
      const idDeck = document.querySelector('#id-deck').innerHTML
      const idTheme = document.querySelector('#id-theme').innerHTML
      fetch(`/themes/${idTheme}/decks/${idDeck}/cards`, { method: 'POST', headers: { 'Accepts': 'text/html', 'Content-Type': 'application/json' }, body: JSON.stringify({ term: word }) })
        .then(response => response.text())
        .then((data) => {
          //console.log(data)
          after.insertAdjacentHTML('beforeEnd', data)
          const btnUpdate = document.querySelectorAll(`.update-event`)
          console.log(btnUpdate)
          btnUpdate.forEach((btn) => {
            btn.addEventListener('change', (event) => {
              const id = event.currentTarget.attributes.id.value.split('_')[1]
              console.log(document.querySelector(`#update_btn_${id}`))
              const form = document.querySelector(`#edit_card_${id}`)
              Rails.fire(form, 'submit');
            })
          })
        })

      console.log(`ajout de la card ${word}`)
      let formNew = word
      const after = document.querySelector('.modal-after')
      after.insertAdjacentHTML('beforeEnd', formNew)



    };
  }
}

export default initInput
