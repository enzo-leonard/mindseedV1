import $ from 'jquery';
const initInput = () => {
    const addBtn = document.querySelector('.btn-add')

    if (addBtn) {


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
  }
}

export default initInput
