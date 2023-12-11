using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

public partial class ThongKeBaoCao : System.Web.UI.Page
{
    public static DataBaseDataContext db = new DataBaseDataContext();
    public static List<ThongKe> ListTK = new List<ThongKe>();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                LoadTK();
                ((MasterPage)Page.Master).PageTitle = "Thống kê".ToUpper();
                DataTable searchResult = Session["SearchResult"] as DataTable;
                if (searchResult != null)
                {
                    // Gán dữ liệu tìm kiếm vào GridView
                    gridThongKe.DataSource = searchResult;
                    gridThongKe.DataBind();
                }
            }
        }
        catch { }
    }

    private void LoadTK()
    {
        string selectedValue = TimeRangeDropdown.SelectedValue;
        DateTime startDate, endDate;
        UpdateTimeLabel(selectedValue, out startDate, out endDate);
        var data = GetDataWithinDateRange(startDate, endDate);
        if (Session["SearchData"] != null)
        {
            gridThongKe.DataSource = Session["SearchData"];
            gridThongKe.DataBind();
            Session.Remove("SearchData");
        }
        //gridThongKe.DataSource = data;
        //gridThongKe.DataBind();
    }

    protected void TimeRangeDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedValue = TimeRangeDropdown.SelectedValue;
        DateTime startDate, endDate;
        UpdateTimeLabel(selectedValue, out startDate, out endDate);
        var data = GetDataWithinDateRange(startDate, endDate);
        gridThongKe.DataSource = data;
        gridThongKe.DataBind();
    }

    protected void TimeRangeDropdown_SelectedIndexChanged(object sender, EventArgs e, string selectedValue, out DateTime startDate, out DateTime endDate)
    {
        UpdateTimeLabel(selectedValue, out startDate, out endDate);
    }

    private void UpdateTimeLabel(string selectedValue, out DateTime startDate, out DateTime endDate)
    {
        switch (selectedValue)
        {
            case "today":
                startDate = DateTime.Today;
                endDate = startDate.AddDays(1);
                break;

            case "yesterday":
                startDate = DateTime.Today.AddDays(-1);
                endDate = startDate.AddDays(1);
                break;

            case "thisweek":
                startDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
                endDate = startDate.AddDays(7);
                break;

            case "lastweek":
                startDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek - 7);
                endDate = startDate.AddDays(7);
                break;

            case "thismonth":
                startDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                endDate = startDate.AddMonths(1);
                break;

            default:
                startDate = DateTime.Today;
                endDate = startDate.AddDays(1);
                break;
        }
    }

    private IQueryable GetDataWithinDateRange(DateTime startDate, DateTime endDate)
    {
        var data = from tk in db.ThongKes
                   join ctdh in db.ChiTietDonHangs on tk.MaDH equals ctdh.MaDH
                   join sp in db.SanPhams on ctdh.MaSP equals sp.MaSP
                   join dh in db.DonHangs on tk.MaDH equals dh.MaDH
                   where dh.NgayDat >= startDate && dh.NgayDat <= endDate && dh.TrangThai == "Đã giao"
                   select new
                   {
                       STT = tk.idThongKe,
                       MaSP = ctdh.MaSP,
                       DoanhSo = tk.DoanhSo,
                       SLBan = tk.SLBan,
                       TonKho = tk.TonKho,
                       TenSP = sp.TenSP
                   };
        return data;
    }

    protected void gridThongKe_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string MaSP = (string)DataBinder.Eval(e.Row.DataItem, "MaSP");

            if (MaSP != null)
            {
                HyperLink hl = new HyperLink();
                hl.NavigateUrl = string.Format("ChiTietDonHang.aspx?MaSP={0}", MaSP);
                e.Row.Cells[1].Controls.Add(hl);
            }
        }
    }
}