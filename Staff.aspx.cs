using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff : System.Web.UI.Page
{
    private static DataBaseDataContext db = new DataBaseDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ((MasterPage)Page.Master).PageTitle = "Nhân viên".ToUpper();
                LoadNV();
            }
        }
        catch (Exception ex)
        {
        }
    }
    private void LoadNV()
    {
        var data = from nv in db.NhanViens
                   select new
                   {
                       MaNV = nv.MaNV,
                       TenNV = nv.HoTen,
                       GioiTinh = nv.GioiTinh,
                       NgaySinh = nv.NgaySinh,
                       DiaChi = nv.DiaChi,
                       Email = nv.Email,
                       SDT = nv.SDT,
                       ChucVu = nv.ChucVu,
                       Luong = nv.Luong,
                   };
        if (data != null )
        {
            gvStaff.DataSource = data;
            gvStaff.DataBind();
        }
    }
}