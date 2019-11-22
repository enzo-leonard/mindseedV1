const initStickybar = () => {
  const navbar = document.querySelector("#sticky-header");
  const logo = document.querySelector(".logo");
  const login = document.querySelector(".login")
  if (navbar) {
    const sticky = navbar.offsetTop;
    window.onscroll = function () {
      scrollFunction()
    };

    function scrollFunction() {
      if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky-header")
        logo.classList.replace('logo', 'logo-sticky');
        login.classList.replace('login', 'login-sticky');
      } else {
        navbar.classList.remove("sticky-header");
        logo.classList.replace('logo-sticky', 'logo');
        login.classList.replace('login-sticky', 'login');
      }
    };
  }
}

export default initStickybar;
