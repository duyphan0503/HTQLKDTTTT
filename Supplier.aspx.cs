using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier : System.Web.UI.Page
{
    private static DataBaseDataContext db = new DataBaseDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ((MasterPage)Page.Master).PageTitle = "Nhà cung cấp".ToUpper();
                LoadNhaCC();
            }
        }
        catch (Exception ex)
        {
        }
    }
    private void LoadNhaCC()
    {
        var data = from ncc in db.NhaCungCaps
                   select new
                   {
                       MaNhaCC = ncc.MaNhaCC,
                       TenNhaCC = ncc.TenNhaCC,
                       DiaChi = ncc.DiaChi,
                       Email = ncc.Email,
                       SDT = ncc.SDT,
                   };
        if (data != null)
        {
            gvSupplier.DataSource = data;
            gvSupplier.DataBind();
        }
    }
}