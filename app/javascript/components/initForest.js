const initForest = () => {
  const forests = document.querySelectorAll('.tree-forest')
  const links = document.querySelectorAll('.list-element')


  forests.forEach((tree) => {
    tree.addEventListener('click', () => {
      console.log('tree')
    })
  })

  links.forEach((link) => {

    link.addEventListener('mouseover', () => {
      let id = link.id.split('_')[1]
      let tree = document.querySelector(`#forest_${id}`)
      tree.mouseover
      console.log(tree)
    })
  })
}

export default initForest
