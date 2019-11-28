
const initLearn = () => {
  const step = document.querySelector("#growing.active");
  console.log(step);


  const resultDiv = document.querySelector(".answers")
  if (resultDiv) {
    console.log("learn activé")
    const cardsRecto = document.querySelectorAll('.flip-card')
    const cardsVerso = document.querySelectorAll('.flip-card-inner')
    const btnYes = document.querySelector('#yes')
    const btnNo = document.querySelector('#no')
    const btnShow = document.querySelector("#show-card")
    const btnNext = document.querySelector("#btn-next")
    const progressTrue = document.querySelector("#progressTrue")
    const progressFalse = document.querySelector("#progressFalse")
    const nbMaxCard = 7
    const score = document.querySelector(".score")

    let trueAnswer = 0
    let falseAnswer = 0

      //const answer = $("#answer").value
      let i = -1;

      const hide = (card) => { //
        card.classList.add('hidden')
      }

      const show = (card) => { //nouveau recto
        card.classList.remove('hidden')
        btnYes.style.display = "none"
        btnNo.style.display = "none"
        btnNext.style.display = "none"
        btnShow.style.display = "block"
      }

      const reveal = (card) => { //quand on montre le verso
        card.style.transform = "rotateY(180deg)"
        btnYes.style.display = "block"
        btnNo.style.display = "block"
        btnShow.style.display = "none"
      }

      const next = () => {
        if (i >= 0) hide(cardsRecto[i])
          i++

        progressTrue.style.width = `${((trueAnswer / nbMaxCard) * 100).toFixed(1)}%`
        progressFalse.style.width = `${((falseAnswer / nbMaxCard) * 100).toFixed(1)}%`
        console.log(progressFalse.style.width)
        console.log(progressTrue.style.width)
        if (i < nbMaxCard) {
          show(cardsRecto[i])

          return [cardsRecto[i], cardsVerso[i]]
        } else result()
      }

      const result = () => {
        const resultcard = document.querySelector('.result')
        const learncard = document.querySelector(".card-learn")
        btnYes.style.display = "none"
        btnNo.style.display = "none"
        resultDiv.style.display = "block"
        learncard.classList.toggle("slide-out");
        resultcard.classList.toggle("slide-out");
        resultcard.classList.toggle("slide-in");
        // learncard.classList.toggle("hidden");
        // resultcard.classList.toggle("hidden");
        const resultcontent = document.querySelector(".result .content")
        resultcontent.insertAdjacentHTML("beforeend",

          `<div class="congrat">Congratulations !</div>
          <div class="debrief">You did great ! The vitality's score of your tree gain <strong>+30pts</strong> !</div>
          <div class="all-cards">
          <div class="known-card" > <h3 class="good nb"> ${trueAnswer} </h3> cards you do know.</div>
          <div class="unknown-card"> <h3 class="bad nb"> ${falseAnswer} </h3> cards you do soon !</div>
          </div>
          <div class = "score" > ${((trueAnswer / nbMaxCard) * 100).toFixed(1)}%</div>
          <div class="buttons">
          <a href="" class="btn btn-green" id=btn-again> <i class="fas fa-redo"></i> keep learning </a>
          <a href="/dashboard" class="btn btn-purple" id=btn-dashboard><i class="fas fa-seedling"></i> dashboard</a>
          </div>`)

        console.log(resultcard)

      }

      let card = next()

      btnNext.addEventListener('click', () => {
        card = next()
      })
      btnShow.addEventListener('click', () => {
        reveal(card[1])
      })
      btnYes.addEventListener('click', () => {
        trueAnswer++
        card = next()
        const step = document.querySelector("#growing.active");
        step.classList.toggle("active");
        if (step.nextElementSibling === null) {
          step.classList.toggle("active");
            // window.location.reload();
          } else {
            step.nextElementSibling.classList.toggle("active")
          }
        })
      btnNo.addEventListener('click', () => {
        falseAnswer++
        card = next()
      })
    }

  }

  export {
    initLearn
  }
