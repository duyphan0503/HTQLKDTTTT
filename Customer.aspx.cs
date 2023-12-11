using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer : System.Web.UI.Page
{
    private DataBaseDataContext db = new DataBaseDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ((MasterPage)Page.Master).PageTitle = "Khách hàng".ToUpper();
                string keyword = Request.QueryString["keyword"];
                
                if (!string.IsNullOrEmpty(keyword))
                {
                    List<KhachHang> searchResults = GetSearchResults(keyword);
                    ShowSearchResult(searchResults);
                }
                else
                    LoadKH();   
                    
            }
        }
        catch (Exception ex)
        {
        }
    }

    

    private void LoadKH()
    {
        var data = from kh in db.KhachHangs
                   select new
                   {
                       MaKH = kh.MaKH,
                       TenKH = kh.TenKH,
                       Email = kh.Email,
                       SDT = kh.SDT,
                       DiaChi = kh.DiaChi,
                   };
        if (data != null)
        {
            gvCustomer.DataSource = data;
            gvCustomer.DataBind();
        }
    }
    private List<KhachHang> GetSearchResults(string keyword)
    {
        using (var db = new DataBaseDataContext())
        {
            var results = db.KhachHangs.Where(kh=>kh.TenKH.Contains(keyword)||kh.MaKH.Contains(keyword)||kh.SDT.Contains(keyword)||kh.Email.Contains(keyword)).ToList();
            return results;
        }
    }
    private void ShowSearchResult(List<KhachHang> searchResults)
    {
        gvCustomer.DataSource=searchResults;
        gvCustomer.DataBind();
    }
}