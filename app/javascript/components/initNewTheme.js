const initNewTheme = () => {
  const newTheme = document.querySelector('#launch-new-theme')
  const themeContainerNew = document.querySelector('#form-container-theme')

  if (newTheme) {
    newTheme.addEventListener('click', () => {
      const newForm = document.querySelector('.new')
      newForm.classList.toggle('hidden')
    })
  }
}

export default initNewTheme
