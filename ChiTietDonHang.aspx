<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChiTietDonHang.aspx.cs" Inherits="ChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gridCTDH" runat="server" AllowPaging="true" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="MaDonHang" HeaderText="Mã đơn hàng" />
            <asp:BoundField DataField="NgayDat" HeaderText="Ngày đặt" />
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm"  HtmlEncode="false" />
            <asp:BoundField DataField="SoLuong" HeaderText="Tổng số lượng" />
            <asp:BoundField DataField="Size" HeaderText="Size" HtmlEncode="false" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
        </Columns>
    </asp:GridView>
</asp:Content>
