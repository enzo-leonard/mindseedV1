export default highlightPlant;

console.log('in highlight_plant.js');

function highlightPlant(){
console.log('in highlightPlant ');
    let plant = document.querySelectorAll(".plant");
    let return_dashbaord = document.querySelector(".return_dash");
    let popout = document.querySelector(".popout");
    console.log(plant);
  for (let i = 0; i < plant.length; i++) {
        plant[i].addEventListener("click", (event) => {
          console.log('in highlight part');
          plant[i].insertAdjacentHTML("afterend","<div class='popout'><div class='content'>content.theme</div></div>");
          plant[i].className += " highlight";
          return_dashbaord.classList.toggle("hidden");
      });
    };

      console.log('in unlight part');

  return_dashbaord.addEventListener("click", (event) =>{
    const plant = document.querySelector('.plant.highlight');
    let popout = document.querySelector(".popout");
    console.log('get return click');
    popout.remove();
    plant.classList.remove("highlight");
    return_dashbaord.classList.toggle("hidden");
      });
    }







