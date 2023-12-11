<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <nav>
        <ul>
            <li>
                <a href="Product.aspx">
                    <i class="fa fa-list"></i>
                    <h2>Tổng sản phẩm</h2>
                    <label>10</label>
                </a>
            </li>
            <li>
                <a href="Product.aspx">
                    <i class="fa fa-user"></i>
                    <h2>Khách hàng</h2>
                    <label>10</label>
                </a>
            </li>
            <li>
                <a href="">
                    <i class="fa fa-shopping-cart"></i>
                    <h2>Đơn hàng</h2>
                    <label></label>
                </a>
            </li>
            <li></li>
            <li></li>
        </ul>
    </nav>
</asp:Content>

