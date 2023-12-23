const toasts = document.querySelectorAll(".toast");
const closeModalBtns = document.querySelectorAll(".overlay .close-icon");

// Mở modal
const openOverlay = (id) => {
    try {
        const overlay = document.getElementById(id);
        overlay.style.display = "block";
        const thisModal = overlay.querySelector("div");
        thisModal.addEventListener("click", (e) => {
            e.stopPropagation();
        });
        overlay.addEventListener("click", function () {
            this.style.display = "none";
        })
    } catch (error) {
        console.error(error);
    }
}

// Mở toast message
const openToast = (id) => {
    try {
        const element = document.getElementById(id);
        element.style.display = "flex";
        setTimeout(() => {
            element.style.display = "none";
        }, 5000);
    } catch (error) {
        console.error(error);
    }
}

// Hàm để đóng bất cứ element nào
const closeSomething = (elements, selector) => {
    try {
        elements.forEach(element => {
            element.addEventListener("click", function (e) {
                e.stopPropagation();
                const parent = this.closest(selector);
                console.log(parent);
                parent.style.display = "none";
            })
        })
    } catch (error) {
        console.error(error);
    }
}

window.onload = () => {
    closeSomething(closeModalBtns, ".overlay")
    closeSomething(toasts, ".toast")
}
