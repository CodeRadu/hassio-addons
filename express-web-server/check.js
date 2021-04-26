$('.preloader-back').hide()
setInterval(()=>{
const ping=new XMLHttpRequest()
ping.onerror=()=>{
  $('.preloader-back').fadeIn('slow')
}
ping.onload=()=>{
  $('.preloader-back').fadeOut('slow')
}
ping.open('GET', 'ping')
ping.send()
}, 10000)