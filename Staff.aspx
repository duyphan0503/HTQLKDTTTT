<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvStaff" CssClass="gridThongKe" AutoGenerateColumns="false" AllowPaging="true" runat="server">
    <Columns>
        <asp:BoundField DataField="MaNV" HeaderText="Mã khách hàng" />
        <asp:BoundField DataField="TenNV" HeaderText="Tên khách hàng" />
        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" />
        <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
        <asp:BoundField DataField="ChucVu" HeaderText="Chức vụ" />
        <asp:BoundField DataField="Luong" HeaderText="Lương" />
    </Columns>
</asp:GridView>
</asp:Content>

