using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class UC_Search : System.Web.UI.UserControl
{
    private static DataBaseDataContext db = new DataBaseDataContext();
    public string TableName { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void searchButton_Click(object sender, EventArgs e)
    {
        string keyword = txtSearch.Text.Trim();
        if(!string.IsNullOrEmpty(keyword))
        {
            string redirectUrl = "";
            string currentPage = Request.Url.AbsolutePath;
            if(currentPage.Contains("Customer.aspx"))
            {
                redirectUrl = "Customer.aspx?keyword=" + keyword;
            }
            else if(currentPage.Contains("Product.aspx"))
            {
                redirectUrl = "Product.aspx?keyword=" + keyword;
            }
            else
            {
                redirectUrl = "Home.aspx";
            }
            Response.Redirect(redirectUrl);
        }
    }
    
}