let imgsItems = document.querySelectorAll('.product__preview-item img')
let mainImg = document.querySelector('.product__preview-main')

//Цикл по массиву
imgsItems.forEach((item) =>{
    item.addEventListener('mouseover', function(){
        let path = item.getAttribute('src')
        mainImg.style.backgroundImage = `url(${path})`
    })
    item.addEventListener('mouseout', function() {
        mainImg.style.backgroundImage = `url('images/long_sleeve.jpg')` 
    })
})
