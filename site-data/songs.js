function init() 
{
    let checkboxes = document.getElementsByTagName('input');
    for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('click', toggleClasses, false);
    }
}

function toggleClasses() {
    let device = this.value;
    switch (device) {
        
        case 'earth': {
        let earth = document.querySelectorAll('.earth');
        for (let i = 0; i < earth.length; i++) {
            earth[i].classList.toggle('yes');
        };
        };
        break;
        case 'space': {
        let space = document.querySelectorAll('.space');
        for (let i = 0; i < space.length; i++) {
            space[i].classList.toggle('yes');
        };
        };
        break;
        case 'water': {
        let work = document.querySelectorAll('.water');
        for (let i = 0; i < work.length; i++) {
            water[i].classList.toggle('yes');
        };
        };
        break;
        case 'air': {
        let air = document.querySelectorAll('.air');
        for (let i = 0; i < air.length; i++) {
            air[i].classList.toggle('on');
        };
        };
        break;
        case 'fire': {
        let fire = document.querySelectorAll('.fire');
        for (let i = 0; i < fire.length; i++) {
            fire[i].classList.toggle('on');
        };
        };
        break;
        case 'spirit': {
        let spirit = document.querySelectorAll('.spirit');
        for (let i = 0; i < spirit.length; i++) {
            spirit[i].classList.toggle('on');
        };
     
        };
        break;
    }
}

window.onload = init;