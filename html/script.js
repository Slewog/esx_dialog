var modalIsShowed = false;
var modalState = '';
const modal = document.querySelector(".modal");
const modalTitle = document.querySelector(".modal-title");
const modalText = document.querySelector(".content-modal");

function listenTransition(e) {
    switch (e.type) {
        case "transitionend":
            if (e.propertyName == 'transform') {
                if (!modalIsShowed) {
                    modalIsShowed = true;
                } else {
                    modalTitle.innerHTML = '';
                    modalText.innerHTML = '';
                    modal.removeEventListener("transitionend", listenTransition, false);

                    $.post(`https://esx_dialog/return-action`, JSON.stringify({result: modalState}));
                    modalState = '';
                    modalIsShowed = false;
                }
            }
            break;
    }
}

function openModal(data) {
    if (!modalIsShowed) {
        modalTitle.innerHTML = '<i class="'.concat(data.icon, '"></i>', data.title);
        modalText.innerHTML = data.content;

        modal.classList.toggle("enter-done");
        modal.addEventListener("transitionend", listenTransition, false);
    }
}

function confirmModal() {
    if (modalIsShowed) {
        modalState = 'confirmed';
        modal.classList.toggle("enter-done");
    }
}

function cancelModal() {
    if (modalIsShowed) {
        modalState = 'declined';
        modal.classList.toggle("enter-done");
    }
}

$(function() {
    window.addEventListener('message', function (event) {
        var action = event.data.action;

        if (action == "open") {
            var modalInfo = event.data.info;
            
            openModal({
                'icon': modalInfo.icon,
                'title': modalInfo.title,
                'content': modalInfo.content
            });
        }
    });
});
