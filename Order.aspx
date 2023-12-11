<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="gvOrder" CssClass="gridThongKe" AllowPaging="true" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" />
            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" />
            <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
            <asp:BoundField DataField="NgayDat" HeaderText="Ngày đặt" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
            <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" />
        </Columns>
    </asp:GridView>
</asp:Content>

