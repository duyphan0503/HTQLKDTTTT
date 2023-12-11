<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/css/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h1>Login</h1>
            <asp:Label CssClass="lblUsername" runat="server">
                Email hoặc Tên đăng nhập
            </asp:Label>

            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            <asp:Label CssClass="lblPassword" runat="server">Mật khẩu</asp:Label>

            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <asp:CheckBox ID="cbLoginSave" runat="server" Text="Ghi nhớ đăng nhập"/>
            <asp:LinkButton runat="server">Quên mật khẩu?</asp:LinkButton>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click"/>
            <br />
            <asp:Label runat="server">
                Chưa có tài khoản?
                <asp:LinkButton PostBackUrl="~/SignUp.aspx" runat="server">Đăng ký</asp:LinkButton>
            </asp:Label>
        </div>
    </form>
</body>
</html>
