using ASP;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using System.Reflection;

public partial class Product : System.Web.UI.Page
{
    private static DataBaseDataContext db = new DataBaseDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                ((MasterPage)Page.Master).PageTitle = "Sản Phẩm".ToUpper();
                //string keyword = Request.QueryString["keyword"];
                //if (!string.IsNullOrEmpty(keyword))
                //{
                //    List<SanPham> searchResults = GetSearchResults(keyword);
                //    ShowSearchResults(searchResults);
                //}
                //else
                LoadSP();
            }
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadSP()
    {
        var data = from sp in db.SanPhams
                   join s in db.SizeSanPhams on sp.MaSP equals s.MaSP
                   join g in db.GiaSanPhams on sp.MaSP equals g.MaSP
                   join m in db.MauSanPhams on sp.MaSP equals m.MaSP
                   group s by new { sp.MaSP, m.idMau } into groupedSize
                   select new
                   {
                       MaSP = groupedSize.Key.MaSP,
                       idMau = groupedSize.Key.idMau,
                       TongSoLuong = groupedSize.Sum(s => s.SoLuong)
                   };
        var mergedData = from sp in db.SanPhams
                         join g in db.GiaSanPhams on sp.MaSP equals g.MaSP
                         join m in db.MauSanPhams on sp.MaSP equals m.MaSP
                         join d in data on new { sp.MaSP, m.idMau } equals new { d.MaSP, d.idMau } into temp
                         from t in temp.DefaultIfEmpty()
                         select new
                         {
                             MaSP = sp.MaSP,
                             TenSP = sp.TenSP,
                             MoTa = sp.Mota,
                             Gia = g.Gia,
                             Mau= m.Mau.Mau1,
                             
                             GioiTinh = sp.GioiTinh,
                             HinhAnh = sp.HinhAnh,
                             DM = sp.DanhMuc.TenDanhMuc,
                             TH = sp.ThuongHieu.TenThuongHieu,
                             TongSoLuong=t != null ?t.TongSoLuong : 0
                         };

        if (mergedData != null)
        {
            gvSanPham.DataSource = mergedData.ToList();
            gvSanPham.DataBind();
        }



    }

    public string GenerateMaSP()
    {
        int sequenceNumber = db.SanPhams.Count() + 1;
        return "SP" + sequenceNumber.ToString().PadLeft(8, '0');
    }

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        //if (Session["IsProductAdded"] == null)
        //{
        //    DanhMuc newDanhMuc = db.DanhMucs.SingleOrDefault(dm => dm.TenDanhMuc == txtDanhMuc.Text);
        //    if (newDanhMuc == null)
        //    {
        //        newDanhMuc = new DanhMuc { TenDanhMuc = txtDanhMuc.Text };
        //        db.DanhMucs.InsertOnSubmit(newDanhMuc);
        //        db.SubmitChanges();
        //    }

        //    ThuongHieu newThuongHieu = db.ThuongHieus.SingleOrDefault(th => th.TenThuongHieu == txtThuongHieu.Text);
        //    if (newThuongHieu == null)
        //    {
        //        newThuongHieu = new ThuongHieu { TenThuongHieu = txtThuongHieu.Text };
        //        db.ThuongHieus.InsertOnSubmit(newThuongHieu);
        //        db.SubmitChanges();
        //    }

        //    SanPham newProduct = new SanPham();
        //    newProduct.MaSP = GenerateMaSP();
        //    newProduct.TenSP = txtTenSP.Text;
        //    newProduct.Mota = txtMoTa.Text;
        //    newProduct.Gia = int.Parse(txtGia.Text);
        //    newProduct.SoLuongTon = int.Parse(txtSoLuong.Text);
        //    if (fuImage.HasFile)
        //    {
        //        string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
        //        Stream fs = fuImage.PostedFile.InputStream;
        //        BinaryReader br = new BinaryReader(fs);
        //        byte[] bytes = br.ReadBytes((int)fs.Length);
        //        newProduct.HinhAnh = bytes;
        //        fuImage.SaveAs(Server.MapPath("assets/images/") + fileName);
        //    }
        //    newProduct.DanhMuc = newDanhMuc;
        //    newProduct.ThuongHieu = newThuongHieu;
        //    db.SanPhams.InsertOnSubmit(newProduct);
        //    db.SubmitChanges();
        //    Session["IsProductAdded"] = true;

        //}
    }

    protected void btnDeleteText_Click(object sender, EventArgs e)
    {
        txtTenSP.Text = string.Empty;
        txtMoTa.Text = string.Empty;
        txtGia.Text = string.Empty;
        txtSoLuong.Text = string.Empty;
        txtDanhMuc.Text = string.Empty;
        txtThuongHieu.Text = string.Empty;
        fuImage.Attributes.Clear();
        imgUploaded.ImageUrl = string.Empty;
    }

    protected void gvSanPham_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSanPham.PageIndex = e.NewPageIndex;
        LoadSP();
    }

    protected void gvSanPham_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string maSP = e.CommandArgument.ToString();
        if (e.CommandName == "Delete")
        {
            if (!string.IsNullOrEmpty(maSP))
            {
                SanPham product = db.SanPhams.SingleOrDefault(sp => sp.MaSP == maSP);

                if (product != null)
                {
                    db.SanPhams.DeleteOnSubmit(product);
                    db.SubmitChanges();
                }
                gvSanPham.DataBind();
            }
        }
        //if (e.CommandName == "Edit")
        //{
        //    GetProductInfo(maSP);
        //    btnAddProduct.Visible = false;
        //    btnUpdateProduct.Visible = true;
        //}
        if ((e.CommandName == "Update"))
        {

        }
    }
    //private void ShowProductInModal(SanPham product)
    //{
    //    txtTenSP.Text = product.TenSP;
    //    txtMoTa.Text = product.TenSP;
    //    txtGia.Text = product.Gia.ToString();
    //    txtSoLuong.Text = product.SoLuongTon.ToString();


    //}
    //private SanPham GetProductInfo(string maSP)
    //{
    //    using (var db = new DataBaseDataContext())
    //    {
    //        var sanPham = db.SanPhams.FirstOrDefault(sp => sp.MaSP == maSP);
    //        var danhMuc = db.DanhMucs.FirstOrDefault(dm => sanPham.idDanhMuc == dm.idDanhMuc);
    //        var thuongHieu = db.ThuongHieus.FirstOrDefault(th => sanPham.idThuongHieu == th.idThuongHieu);
    //        if (maSP != null)
    //        {
    //            txtTenSP.Text = sanPham.TenSP;
    //            txtMoTa.Text = sanPham.TenSP;
    //            txtGia.Text = sanPham.Gia.ToString();
    //            txtSoLuong.Text = sanPham.SoLuongTon.ToString();
    //            txtDanhMuc.Text = danhMuc.TenDanhMuc;
    //            txtThuongHieu.Text = thuongHieu.TenThuongHieu;

    //        }
    //        return sanPham;
    //    }
    //}

    protected void gvSanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvSanPham_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void gvSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void btnUpdateProduct_Click(object sender, EventArgs e)
    {

    }
    //private List<SanPham> GetSearchResults(string keyword)
    //{
    //    using (var db = new DataBaseDataContext())
    //    {
    //        var results = db.SanPhams
    //                        .Where(sp => sp.TenSP.Contains(keyword)
    //                                     || sp.MaSP.Contains(keyword))
    //                        .Join(db.DanhMucs,
    //                              sp => sp.idDanhMuc,
    //                              dm => dm.idDanhMuc,
    //                              (sp, dm) => new { SanPham = sp, DanhMuc = dm })
    //                        .Join(db.ThuongHieus,
    //                              joined => joined.SanPham.idThuongHieu,
    //                              th => th.idThuongHieu,
    //                              (joined, th) => th.TenThuongHieu)
    //                        .ToList();
    //        return results;
    //    }
    //}
    private void ShowSearchResults(List<SanPham> searchResults)
    {
        gvSanPham.DataSource = searchResults;
        gvSanPham.DataBind();
    }
}