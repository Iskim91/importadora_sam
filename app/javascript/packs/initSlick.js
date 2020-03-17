import $ from 'jquery'
import 'slick-carousel'

import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

const carousel = () => {
  const photos = document.querySelectorAll('.slider')
  if (photos) {
    $('.slider').slick({
  dots: true,
  // centerPadding: '0px',
  infinite: true,
  // autoplay: true,
  // autoplaySpeed: 2000,
  fade: true,
  arrows: false,
    });
  }
}

export { carousel };
