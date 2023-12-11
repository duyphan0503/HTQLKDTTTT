<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThongKeBaoCao.aspx.cs" Inherits="ThongKeBaoCao" %>

<%@ Register Src="~/UC/Search.ascx" TagPrefix="uc1" TagName="Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="searchbar">
        <uc1:Search runat="server" ID="Search" />
    </div>
    <br />
    <div id="TimeLable">
        <asp:Label ID="TimeLabel" Text="" runat="server" />
        <asp:DropDownList ID="TimeRangeDropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="TimeRangeDropdown_SelectedIndexChanged">
            <asp:ListItem Text="Hôm nay" Value="today" />
            <asp:ListItem Text="Hôm qua" Value="yesterday" />
            <asp:ListItem Text="Tuần này" Value="thisweek" />
            <asp:ListItem Text="Tuần trước" Value="lastweek" />
            <asp:ListItem Text="Tháng này" Value="thismonth" />
        </asp:DropDownList>
    </div>
    
    <div>
        <asp:GridView ID="gridThongKe" CssClass="gridThongKe" AllowPaging="true" runat="server" AutoGenerateColumns="false" OnRowDataBound="gridThongKe_RowDataBound">
            <Columns>
                <asp:BoundField DataField="STT" HeaderText="STT" />
                <asp:HyperLinkField DataTextField="TenSP" DataNavigateUrlFields="MaSP" DataNavigateUrlFormatString="ChiTietDonHang.aspx?MaSP={0}" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="SLBan" HeaderText="Số lượng bán" />
                <asp:BoundField DataField="TonKho" HeaderText="Tồn kho" />
                <asp:BoundField DataField="DoanhSo" HeaderText="Doanh số" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


