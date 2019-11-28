import anime from "animejs";


// anime({
//   targets: ' .tree',
// keyframes: [
//   {opacity: 0.1, scaleY: '0.1', scaleX: '1.2'}
//   {opacity: 1, scaleY: '1.2', scaleX: '1.2'}
//   ],
//   easing: 'easeOutElastic(1, .8)',
//   delay: anime.stagger(400),
//   duration: 1000
// });




anime({
  targets: '.tree',
  opacity: [
    { value: 0, duration: 0},
    { value: 1, duration: 2000}
  ],
  scaleX: [
    { value: 1.2, duration: 0},
    { value: 1.2, duration: 2000}
  ],
  scaleY: [
    { value: 0.1, duration: 0, easing: 'easeOutElastic(1, .3)'},
    { value: 1.2, duration: 2000, easing: 'easeOutElastic(1, .3)'}
  ],
  delay: anime.stagger(400),
});
