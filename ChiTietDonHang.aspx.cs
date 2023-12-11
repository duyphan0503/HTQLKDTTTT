using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ChiTietDonHang : System.Web.UI.Page
{
    public static DataBaseDataContext db = new DataBaseDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                loadCTDH();
            }
        }
        catch { }
    }

    private void loadCTDH()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["MaSP"]))
        {
            var data = from ctdh in db.ChiTietDonHangs
                       join dh in db.DonHangs on ctdh.MaDH equals dh.MaDH
                       join sp in db.SanPhams on ctdh.MaSP equals sp.MaSP
                       join kh in db.KhachHangs on dh.MaKH equals kh.MaKH
                       join s in db.SizeSanPhams on sp.MaSP equals s.MaSP
                       where ctdh.MaSP == sp.MaSP
                       select new
                       {
                           MaDonHang = dh.MaDH,
                           NgayDat = dh.NgayDat,
                           TenSP = sp.TenSP,
                           SoLuong = ctdh.SoLuong,
                           Size = s.Size,
                           SL = s.SoLuongBan,
                           TongTien = ctdh.TongTien,
                           TenKH = kh.TenKH,
                           SDT = kh.SDT,
                           DiaChi = kh.DiaChi
                       };
            var groupedData = data.GroupBy(item => new { item.MaDonHang, item.NgayDat, item.TongTien, item.TenKH, item.SDT, item.DiaChi, item.SoLuong })
            .Select(group => new
            {
                MaDonHang = group.Key.MaDonHang,
                NgayDat = group.Key.NgayDat,
                TongTien = group.Key.TongTien,
                TenKH = group.Key.TenKH,
                SDT = group.Key.SDT,
                DiaChi = group.Key.DiaChi,
                SoLuong = group.Key.SoLuong,
                Size = string.Join("<br/>", group.Select(g => g.Size)),
                TenSP = string.Join("<br/>", group.Select(g => string.Format("{0} ({1})", g.TenSP, g.SL))),
            });

            if (groupedData != null)
            {
                gridCTDH.DataSource = groupedData.ToList();
                gridCTDH.DataBind();
            }
        }
    }
}