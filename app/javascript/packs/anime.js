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



const Growing = anime({
  targets: '.growing',
  points: [
    { value: [
      '70 24 119.574 60.369 100.145 117.631 50.855 101.631 3.426 54.369',
      '70 41 118.574 59.369 111.145 132.631 60.855 84.631 20.426 60.369']
    },
    { value: '70 6 119.574 60.369 100.145 117.631 39.855 117.631 55.426 68.369' },
    { value: '70 57 136.574 54.369 89.145 100.631 28.855 132.631 38.426 64.369' },
    { value: '70 24 119.574 60.369 100.145 117.631 50.855 101.631 3.426 54.369' }
  ],
  easing: 'easeOutQuad',
  duration: 2000,
  loop: true
});

