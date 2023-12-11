document.addEventListener("DOMContentLoaded", function () {
    const menuIcon = document.querySelector(".menu-icon");
    const sideBar = document.querySelector(".sidebar");
    const contentConstainer = document.getElementById("contentContainer");
    menuIcon.addEventListener("click", function () {
        sideBar.classList.toggle("show");
        contentConstainer.style.width = sideBar.classList.contains("show") ? "calc(100vw - var(--sidebar-width)" : "100%";
    });
    /*Seach bar*/
    const searchInp = document.getElementById("ContentPlaceHolder1_Search_txtSearch");
    const searchClose = document.querySelector(".search__close");
    searchClose.addEventListener("click", function () {
        searchInp.value = "";
    });
    /*Show Modal*/
    const btnAdd = document.getElementById("btnAdd");
    const productModal = document.querySelector(".modal");
    /*Add Product*/
    btnAdd.addEventListener("click", function () {
        productModal.classList.toggle("show");
    });
    /*Update Product */
    const btnEditProduct = document.getElementById("btnEditProduct");
    btnEditProduct.addEventListener("click", function (event) {
        /*event.preventDefault();*/
        productModal.classList.toggle("show");
    });
    /*Xóa text đã nhập trong Modal thêm sản phẩm*/
    function clearModalInputs() {
        document.getElementById("txtTenSP").value = "";
        document.getElementById("txtMoTa").value = "";
        document.getElementById("txtGia").value = "";
        document.getElementById("txtSoLuong").value = "";
        document.getElementById("txtDanhMuc").value = "";
        document.getElementById("txtThuongHieu").value = "";
    }
    /*User DropDown*/
    const userInfo = document.getElementById("userInfo");
    const userDropdown = document.querySelector(".userDropdown");
    userInfo.addEventListener("click", function () {
        userDropdown.classList.toggle("show");
    });
});