const stickyNavbar = () => {
  const navFirst = document.querySelector(".navbar1")
  const navSecond = document.querySelector(".navbar2")
  const homeBtn = document.querySelector(".home-button")
  window.addEventListener( "scroll", () => {
    if (window.scrollY >= 30) {
      navFirst.classList.add("navbar-fixed1")
      homeBtn.classList.add("home-button1")
    }
    else {
      navFirst.classList.remove("navbar-fixed1")
      homeBtn.classList.remove("home-button1")
    }
  })
  window.addEventListener( "scroll", () => {
    if (window.scrollY >= 110) {
      navSecond.classList.add("navbar-fixed2")
    }
    else {
      navSecond.classList.remove("navbar-fixed2")
    }
  })
}

export { stickyNavbar }
