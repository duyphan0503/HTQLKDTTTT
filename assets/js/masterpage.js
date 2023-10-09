document.addEventListener("DOMContentLoaded", function() {
    const menuIcon = document.querySelector(".menu-icon");
    const sideBar = document.querySelector(".sidebar");
    menuIcon.addEventListener("click", function() {
        sideBar.classList.toggle("show");
    });
});