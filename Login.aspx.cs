using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;
        if(username=="admin" && password == "000000")
        {
            Session["Username"] = username;
            Response.Redirect("Home.aspx");
        }
        else
        {
            Response.Write("<script>alert('Thông tin đăng nhập không chính xác!');</script>");
        }
    }
}