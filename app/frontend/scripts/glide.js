import Glide from '@glidejs/glide'

document.addEventListener('DOMContentLoaded', () => {
  if(document.querySelector('.glide')) {
    const glide = new Glide('.glide', {
      type: 'carousel',
      startAt: 0,
      focusAt: 'center',
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