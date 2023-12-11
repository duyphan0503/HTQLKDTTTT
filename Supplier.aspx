<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:GridView ID="gvSupplier" CssClass="gridThongKe" AutoGenerateColumns="false" AllowPaging="true" runat="server">
    <Columns>
        <asp:BoundField DataField="MaNhaCC" HeaderText="Mã nhà cung cấp" />
        <asp:BoundField DataField="TenNhaCC" HeaderText="Tên nhà cung cấp" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
    </Columns>
</asp:GridView>
</asp:Content>

