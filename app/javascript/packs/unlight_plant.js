export default unlightPlant;

  console.log('in unlight_plant.js');
function unlightPlant(){
    let plant = document.querySelectorAll(".square");
    let darken = document.querySelectorAll(".darken");
  console.log(darken);

for (let i = 0; i < plant.length; i++) {
darken[i].addEventListener("click", (event) =>{
  console.log('out ofhighlight fonction');
  darken[i].remove();
  plant[i].classList.remove("highlight");
    });
  };
}
