let modalIsShowed = false;
let modalState = '';
let modalPlaySound = true;

const modal = document.querySelector(".modal");
const modalTitle = document.querySelector(".modal-title");
const modalText = document.querySelector(".content-modal");

const sound = new Audio('modal.ogg');
sound.volume = 1.0;

function listenModalTransition(e) {
    switch (e.type) {
        case "transitionend":
            if (e.propertyName == 'transform') {
                if (!modalIsShowed) {
                    modalIsShowed = true;
                } else {
                    modalTitle.innerHTML = '';
                    modalText.innerHTML = '';
                    modal.removeEventListener("transitionend", listenModalTransition, false);

                    $.post(`https://esx_dialog/modal-callback`, JSON.stringify({result: modalState}));
                    modalState = '';
                    modalIsShowed = false;
                }
            }
            break;
    }
}

function openModal(data) {
    if (!modalIsShowed) {
        modalTitle.innerHTML = `<i class="${data.icon}"></i>${data.title}`
        modalText.innerHTML = data.content;

        modal.classList.add("enter-done");
        modal.addEventListener("transitionend", listenModalTransition, false);

        if (modalPlaySound) {
            sound.play();
        }

        if (data.delay != undefined && data.delay && typeof(data.delay) == 'number') {
            setTimeout(function(){
                if (modalIsShowed) {
                    modalAction('canceled');
                }
            }, data.delay);
        }
    }
}

function modalAction(action) {
    if (modalIsShowed) {
        modalState = action;
        modal.classList.remove("enter-done");
    }
}

$(function() {
    $.post('http://esx_dialog/get-config', JSON.stringify({}), function(data){
        modalPlaySound = data.Sound.play;
        sound.volume = data.Sound.volume;

        let newColor = data.CustomColors

        if (newColor.primary.change) {
            modal.style.setProperty('--primary', newColor.primary.value);
        }

        if (newColor.textColor.change) {
            modal.style.setProperty('--textColor', newColor.textColor.value);
        }

        if (newColor.bgColor.change) {
            modal.style.setProperty('--bgColor', newColor.bgColor.value);
        }
    });

    window.addEventListener('message', function (e) {
        var action = e.data.action;

        if (action == "open-modal") {
            openModal(e.data.info);
        }
    });
});
