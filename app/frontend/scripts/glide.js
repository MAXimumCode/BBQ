import Glide from '@glidejs/glide'

document.addEventListener('DOMContentLoaded', () => {
  if(document.querySelector('.glide')) {
    const glide = new Glide('.glide', {
      type: 'slider',
      startAt: 0,
      rewind: false,
      bound: true,
      perView: 6,
      animationDuration: 800,
      animationTimingFunc: 'ease-in-out',
      breakpoints: {
        1024: {
          perView: 3
        },
        600: {
          perView: 2
        }
      }
    })

    glide.mount()
  }
})