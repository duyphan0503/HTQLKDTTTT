<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<%@ Register Src="~/UC/Search.ascx" TagPrefix="uc2" TagName="Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="searchbar">
        <uc2:Search runat="server" ID="Search" />
        <button id="btnAdd" type="button">
            <i class="fa fa-plus"></i>
            Thêm mới
        </button>
    </div>
    <asp:GridView ID="gvSanPham" CssClass="gridThongKe" AllowPaging="true" AutoGenerateColumns="false" runat="server"
        OnPageIndexChanging="gvSanPham_PageIndexChanging" OnRowCommand="gvSanPham_RowCommand" OnRowDeleting="gvSanPham_RowDeleting" OnRowEditing="gvSanPham_RowEditing" OnRowUpdating="gvSanPham_RowUpdating">
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" />
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
            <asp:BoundField DataField="Gia" HeaderText="Giá" />
           <%-- <asp:BoundField DataField="Size" HeaderText="Size" />--%>
            <asp:BoundField DataField="TongSoLuong" HeaderText="Số lượng sản phẩm" />
            <asp:BoundField DataField="Mau" HeaderText="Màu" />
            <%--<asp:BoundField DataField="SoLuongMau" HeaderText="Số lượng màu" />--%>
            <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
            <asp:BoundField DataField="HinhAnh" HeaderText="Hình ảnh" />
            <asp:BoundField DataField="DM" HeaderText="Danh mục" />
            <asp:BoundField DataField="TH" HeaderText="Thương hiệu" />
        </Columns>
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEditProduct" ClientIDMode="Static" CssClass="btnProduct" runat="server" CommandName="Edit" OnClientClick="return false;" CommandArgument='<%# Eval("MaSP") %>'>
                        <i class="fa fa-edit"></i>
                    </asp:LinkButton>

                    <asp:LinkButton CssClass="btnProduct" runat="server" CommandName="Delete" CommandArgument='<%# Eval("MaSP") %>'>
                        <i class="fa fa-trash-can"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Panel ID="ProductModal" CssClass="modal" runat="server">

        <div class="modal-content">
            
                <i class="fa fa-close modalClose"></i>
            
            <asp:Label ID="lblTenSP" class="lblProductModal" Text="Tên sản phẩm" runat="server" />
            <asp:TextBox ID="txtTenSP" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Label ID="lblMoTa" class="lblProductModal" Text="Mô tả" runat="server" />
            <asp:TextBox ID="txtMoTa" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Label ID="lblGia" class="lblProductModal" Text="Giá" runat="server" />
            <asp:TextBox ID="txtGia" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:FileUpload ID="fuImage" runat="server" />
            <asp:Image ID="imgUploaded" runat="server" />
            <asp:Label ID="lblSoLuong" class="lblProductModal" Text="Số lượng nhập" runat="server" />
            <asp:TextBox ID="txtSoLuong" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Label ID="lblDanhMuc" class="lblProductModal" Text="Tên danh mục" runat="server" />
            <asp:TextBox ID="txtDanhMuc" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Label ID="lblThuongHieu" class="lblProductModal" Text="Tên thương hiệu" runat="server" />
            <asp:TextBox ID="txtThuongHieu" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Button CssClass="btnProductModal" ID="btnDeleteText" runat="server" Text="Xóa" OnClientClick="clearModalInputs();" UseSubmitBehavior="false" />
            <asp:Button CssClass="btnProductModal" ID="btnAddProduct" runat="server" Text="Thêm" OnClick="btnAddProduct_Click" Visible="true" ClientIDMode="Static" />
            <asp:Button CssClass="btnProductModal" ID="btnUpdateProduct" Text="Cập nhật" CommandName="Update" runat="server" Visible="false" ClientIDMode="Static" OnClick="btnUpdateProduct_Click" />
        </div>
    </asp:Panel>
</asp:Content>

