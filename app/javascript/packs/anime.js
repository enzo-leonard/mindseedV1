import anime from "animejs";

const listPop = anime({
  targets: '.dash-list-theme .list-element',
  opacity: [
    { value: 0, duration: 0},
    { value: 1, duration: 1500}
 ],
  delay: anime.stagger(200),
});

const treesPop = anime({
  targets: '.tree-forest .tree',
  opacity: [
    { value: 0, duration: 0},
    { value: 1, duration: 1500}
 ],
  scaleX: [
   { value: 1.4, duration: 0},
   { value: 1.2, duration: 1500}
  ],
  scaleY: [
   { value: 0.1, duration: 0, easing: 'easeOutElastic(1, .3)'},
   { value: 1.2, duration: 1500, easing: 'easeOutElastic(1, .3)'}
  ],
  delay: anime.stagger(200),
});

const congratAnime = anime({
  targets: '.congrat',
  scaleY: [
   { value: 1, duration: 0, easing: 'easeOutElastic(1, .3)'},
   { value: 1.1, duration: 2000, easing: 'easeOutElastic(1, .3)'},
   { value: 1, duration: 1000, easing: 'easeOutElastic(1, .3)'}
  ],
   scaleX: [
   { value: 1, duration: 0, easing: 'easeOutElastic(1, .3)'},
   { value: 1.1, duration: 2000, easing: 'easeOutElastic(1, .3)'},
   { value: 1, duration: 1000, easing: 'easeOutElastic(1, .3)'}
  ],
loop: true,
});



