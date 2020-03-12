const stickyNavbar = () => {
  const navFirst = document.querySelector(".navbar1")
  const navSecond = document.querySelector(".navbar2")
  window.addEventListener( "scroll", () => {
    if (window.scrollY >= 30) {
      navFirst.classList.add("navbar-fixed1")
    }
    else {
      navFirst.classList.remove("navbar-fixed1")
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
