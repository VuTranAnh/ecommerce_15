document.addEventListener('turbolinks:load', function() {
  $('.slider').slick({
    nextArrow: '<i class="angle right icon"></i>',
    prevArrow: '<i class="angle left icon"></i>',
    variableWidth: true,
    centerPadding: '60px',
    slidesToShow: 4,
    slidesToScroll: 4,
    infinite: false,
    responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
  });
})
