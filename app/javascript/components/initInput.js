import $ from 'jquery';
const initInput = () => {

    const addBtn = document.querySelector('.btn-add')

    if (addBtn) {
      const btnOtp = document.querySelector('.btn-opt')


      addBtn.addEventListener('mouseover', () => {
      btnOtp.classList.toggle('opt-visible')
      setTimeout(function () {
        btnOtp.classList.remove('opt-visible')
      }, 2000);
      console.log('hover')
    })

    const editable = document.querySelector('.editable')
    const saveBtn = document.querySelector('#save-text-btn')
    console.log(editable)
    let words = []
    saveBtn.addEventListener('click', () => {

      words = editable.innerText.split(' ')

      editable.innerHTML = ""
      words.forEach((word) => {
        editable.innerHTML += `<div class=word id="${word}">${word}</div>&nbsp`
      })
      words = []

      let savedWords = document.querySelectorAll('.word')
      savedWords.forEach((w) => {
        w.addEventListener('click', () => {
          addCard(w.innerHTML)


      });
      })
      console.log(editable.innerHTML)
    })



    addBtn.addEventListener('click', () => {
      const add = document.querySelector('.new')
      if (addBtn.innerHTML == "+") addBtn.innerHTML = '-';
      if (addBtn.innerHTML == "-") addBtn.innerHTML = '+';
      add.classList.toggle('hidden')
      window.scrollTo(0, document.body.scrollHeight);
    })



    const update = (id) => {document.querySelector(`#update_btn_${id}`).click() }

    const btnUpdate = document.querySelectorAll(`.update-event`)
    btnUpdate.forEach((btn) => {
      btn.addEventListener('change', (event) => {
        const id = event.currentTarget.attributes.id.value.split('_')[1]
        update(id)
      })
    })


    const addCard = (word) => {
      console.log(`ajout de la card ${word}`)
      let formNew = `
      <div id="input-card-new">
        <div class="input-card-new">
          <form class="simple_form new_card" id="new_card" novalidate="novalidate" action="/decks/470/cards" accept-charset="UTF-8" data-remote="true" method="post"><input type="hidden" name="authenticity_token" value="f6Gz2hXpvrtIBAk+9eOuBrsMbRezQMZJflY3V7HG0RrADCCN+XFcKgXAHcoNNErkr3MrgA5YFg14wceDBWgKVA==">

            <div class="input-card-left">
              <div class="form-group string optional card_term"><label class="string optional" for="new_term">Term</label><input class="form-control string optional" id="new_term" value=${word} type="text" name="card[term]"></div>
                <div class="form-group hidden card_photo"><input class="form-control hidden" id="new_img_hidden" type="hidden" name="card[photo]"></div>
                  <div class="change-photo">
                    <a class="btn-change-photo-new"><i class="fas fa-exchange-alt"></i></a>
                    <img src="" id="new-img" alt="img">
                      <div class="alt-photo-container-new hidden">
                        <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
                          <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
                            <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
                              <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
                                <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
                                  <img class="alt-photo-new" src="https://source.unsplash.com/random" alt="img">
     </div>
   </div>
 </div>

                              <div class="input-card-right">
                                <div class="form-group text optional card_definition"><label class="text optional" for="new_definition">Definition</label><textarea class="form-control text optional" id="new_definition" name="card[definition]"></textarea></div>

                                <div class="defs-container-new hidden">
                                  <div class="definitions hidden suggestion"> </div>
                                  <div class="definitions hidden suggestion"> </div>
                                  <div class="definitions hidden suggestion"> </div>
                                  <div class="definitions hidden suggestion"> </div>
                                </div>

                                <div class="form-group string optional card_context"><label class="string optional" for="new_context">Context</label><input class="form-control string optional" id="new_context" type="text" name="card[context]"></div>
                                  <div class="form-group string optional card_memo"><label class="string optional" for="new_memo">Memo</label><input class="form-control string optional" id="new_memo" type="text" name="card[memo]"></div>
                                  </div>



</form></div>
                              <input type="submit" name="commit" value="Create Card" class="btn" data-disable-with="Create Card">
</div>`
const after = document.querySelector('.modal-after')
after.insertAdjacentHTML('beforeEnd', formNew)



    };
  }
}

export default initInput
