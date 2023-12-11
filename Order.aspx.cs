using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    private DataBaseDataContext db = new DataBaseDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ((MasterPage)Page.Master).PageTitle = "Đơn hàng".ToUpper();
                LoadDH();
            }
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadDH()
    {
        var data = from dh in db.DonHangs
                   join tt in db.TrangThaiDHs on dh.MaDH equals tt.MaDH into joined
                   from lastestStatus in joined.OrderByDescending(tt => tt.ThoiGian).Take(1).DefaultIfEmpty()
                   orderby dh.MaDH ascending
                   select new
                   {
                       MaDH = dh.MaDH,
                       MaKH = dh.MaKH,
                       MaNV = dh.MaNV,
                       NgayDat = dh.NgayDat,
                       TongTien = dh.TongTien,
                       TrangThai = lastestStatus.TrangThai,
                       
                   };
        if (data != null)
        {
            gvOrder.DataSource = data;
            gvOrder.DataBind();
        }
    }
}