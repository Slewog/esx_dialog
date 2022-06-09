const modal = document.querySelector(".modal");
const modalTitle = document.querySelector(".modal-title");
const modalText = document.querySelector(".content-modal");
const sound = new Audio('modal.ogg');

let modalIsShowed = false;
let modalState = '';
let modalPlaySound = true;

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

function configModal(color, btn) {
    let btnConfirm = document.querySelector("#confirm-modal");
    let btnCancel = document.querySelector("#cancel-modal");

    btnConfirm.innerHTML = `<i class="fa-solid fa-check"></i><span>${btn.confirm}</span>`;
    btnCancel.innerHTML = `<i class="fa-solid fa-xmark"></i><span>${btn.cancel}</span>`;

    if (color.primary.change) {
        modal.style.setProperty('--primary', color.primary.value);
    }

    if (color.textColor.change) {
        modal.style.setProperty('--textColor', color.textColor.value);
    }

    if (color.bgColor.change) {
        modal.style.setProperty('--bgColor', color.bgColor.value);
    }
}

$(function() {
    $.post('http://esx_dialog/get-config', JSON.stringify({}), function(data){
        modalPlaySound = data.Sound.play;
        sound.volume = data.Sound.volume;

        configModal(data.Colors, data.Button);
    });

    window.addEventListener('message', function (e) {
        var action = e.data.action;

        if (action == "open-modal") {
            openModal(e.data.info);
        }
    });
});
