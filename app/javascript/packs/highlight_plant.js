export default highlightPlant;


function highlightPlant(){
if (document.querySelector(".forest.tree")) {

console.log('in highlightPlant ');
    let plant = document.querySelectorAll(".forest.tree");
    let return_dashbaord = document.querySelector(".return-dash");
    let popout = document.querySelector(".popout");

  for (let i = 0; i < plant.length; i++) {
        plant[i].addEventListener("click", (event) => {
          console.log('in highlight part');
          plant[i].insertAdjacentHTML("afterend","<div class='popout'><div class='content'>content.theme</div></div>");
          plant[i].className += " highlight";
          return_dashbaord.classList.toggle("hidden");
      });
    };



  return_dashbaord.addEventListener("click", (event) =>{
    const plant = document.querySelector('.tree.highlight');
    let popout = document.querySelector(".popout");
    console.log('get return click');
    popout.remove();
    plant.classList.remove("highlight");
    return_dashbaord.classList.toggle("hidden");
      });
    }
}







