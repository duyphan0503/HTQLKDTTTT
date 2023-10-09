<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/css/SignUp.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>Form Đăng Ký</h1>
        <label for="username">Tên đăng nhập:</label>
        <asp:TextBox runat="server" />
        <br />
        <label for="email">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" />
        <br />
        <label for="password">Mật khẩu:</label>
        <asp:TextBox TextMode="Password" runat="server" />
        <br />
        <label for="confirm_password">Xác nhận mật khẩu:</label>
        <asp:TextBox TextMode="Password" runat="server" />
        <br />
        <asp:Button ID="btnSignUp" Text="Đăng ký" OnClick="btnSignUp_Click" runat="server" />
    </form>
</body>
</html>
