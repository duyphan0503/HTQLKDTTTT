<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<%@ Register Src="~/UC/Search.ascx" TagPrefix="uc1" TagName="Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="searchbar">
        <uc1:Search runat="server" ID="Search" />
        <button id="btnAdd" type="button">
            <i class="fa fa-plus"></i>
            Thêm mới
        </button>
    </div>
    <asp:GridView ID="gvCustomer" CssClass="gridThongKe" AutoGenerateColumns="false" AllowPaging="true" runat="server">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
        </Columns>
    </asp:GridView>
</asp:Content>

