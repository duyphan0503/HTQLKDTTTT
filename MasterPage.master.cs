using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try 
        {
            if(!IsPostBack)
            {
                if (Session["Username"]!=null)
                {
                    string username = Session["Username"].ToString();
                    lblUserMenu.Text = username;
                }
            }
        } catch (Exception ex) { }
    }

    public string PageTitle
    {
        get { return lblPageTitle.InnerText; }
        set { lblPageTitle.InnerText = value; }
    }
}