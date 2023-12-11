<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="UC_Search" %>
<div class="search" id="search-bar">
    <asp:TextBox ID="txtSearch" TextMode="Search" placeholder="Nhập từ khóa tìm kiếm..." CssClass="search__inp" runat="server"></asp:TextBox>
    <asp:LinkButton ID="searchButton" CssClass="search__button" OnClick="searchButton_Click" runat="server">
        <i class="fa fa-magnifying-glass search__icon"></i>
    </asp:LinkButton>
        <i class="fa fa-xmark search__close" ></i>
</div>







