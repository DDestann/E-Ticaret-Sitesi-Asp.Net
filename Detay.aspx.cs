using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Detay : System.Web.UI.Page
{
    dbislem db = new dbislem();
    string Baslik = "";
    string Fiyat = "";
    int Adet = 0;
    Decimal YeniFiyat = 0;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");

        DetayLİst();

       if (Request.QueryString["AltKategoriId"] != null && Request.QueryString["AltKategoriId"].ToString() != "")
       {

           if (!Page.IsPostBack)
           {
               if (Session["KullaniciId"] != null)
               {
                   DataRow drAdet = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + Request.QueryString["AltKategoriId"] + "' ");
                   if (drAdet!=null)
                   {
                       txtAdet.Text = drAdet["Adet"].ToString();
                   }
                   else
                   {
                       txtAdet.Text = "1";
                   }
               }
           }



           DataRow dr = db.GetDataRow("Select * From AltKategori Where AltKategoriId=" + Request.QueryString["AltKategoriId"]);

           Baslik = dr["AltKategoriAdi"].ToString();
           Page.Title = Baslik + Session["Title"].ToString();

           Page.MetaKeywords = Baslik;

           foreach (DataListItem item in dtlDetay.Items)
           {
                
                 Panel pnlFiyat = (Panel)item.FindControl("pnlFiyat");
                 Panel pnlYFiyat = (Panel)item.FindControl("pnlYFiyat");
                 Label lblYeniFiyat = (Label)item.FindControl("lblYeniFiyat");
                 Label lblFiyat = (Label)item.FindControl("lblFiyat");
                
                 if (dr["Kampanya"].ToString() == "0")
                 {
                     lblFiyat.Text = dr["AltKategoriFiyat"].ToString();
                     Fiyat = lblFiyat.Text;
                     pnlFiyat.Visible = true;
                     pnlYFiyat.Visible = false;

                 }
                 else
                 {
                     lblYeniFiyat.Text = dr["AltKategoriYFiyat"].ToString();
                     Fiyat = lblYeniFiyat.Text;
                     pnlFiyat.Visible = false;
                     pnlYFiyat.Visible = true;
                 }
           }


           





        if (Session["KullaniciId"] != null)
        {
            DataRow drfav = db.GetDataRow("Select * From Favoriler Where AltKategoriId='" + Request.QueryString["AltKategoriId"] + "' AND KullaniciId='" + Session["KullaniciId"] + "'");

            if (drfav != null)
            {
                btnFavEkle.Visible = false;
                btnFavSil.Visible = true;
            }
            else
            {
                btnFavEkle.Visible = true;
                btnFavSil.Visible = false;
            }

        }
       
    }

        
    }

    private void DetayLİst()
    {
        if (Request.QueryString["AltKategoriId"] != null && Request.QueryString["AltKategoriId"].ToString() != "")
        {

            
            DataTable dt = db.GetDataTable("Select * From AltKategori Where AltKategoriId=" + Request.QueryString["AltKategoriId"]);
            dtlDetay.DataSource = dt;
            dtlDetay.DataBind();
        
        }
    }


    protected void btnFavEkle_Click(object sender, EventArgs e)
    {
        db.execute("insert  into Favoriler(AltKategoriId,KullaniciId) values('" + Request.QueryString["AltKategoriId"] + "', '" + Session["KullaniciId"] + "')");
        Response.Redirect("Detay.aspx?AltKategoriId=" + Request.QueryString["AltKategoriId"]);
    }
    protected void btnFavSil_Click(object sender, EventArgs e)
    {
        db.execute("Delete From Favoriler Where AltKategoriId='" + Request.QueryString["AltKategoriId"] + "' AND KullaniciId='" + Session["KullaniciId"] + "' ");
        Response.Redirect("Detay.aspx?AltKategoriId=" + Request.QueryString["AltKategoriId"]);
    }

    
    protected void btnSepetEkle_Click(object sender, EventArgs e)
    {
        if (Session["KullaniciId"] != null)
        {
            try
            {
                DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + Request.QueryString["AltKategoriId"] + "' ");
            if (dr == null)
            {
                //Adet = Convert.ToInt32(dr["Adet"]);
                Adet = Convert.ToInt32(txtAdet.Text);
                YeniFiyat = (Convert.ToDecimal(Fiyat) * Adet);

                db.execute("insert into Sepet (KullaniciId,AltKategoriId,Onay,SiparisTarihi,Adet,YeniFiyat,YOnay,Fiyat) Values('" + Session["KullaniciId"] + "' , '" + Request.QueryString["AltKategoriId"] + "' , '" + 0 + "' , '" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy")) + "' , '" + txtAdet.Text + "', '" + YeniFiyat.ToString().Replace(",", ".") + "' , '" + 0 + "','" + Fiyat.Replace(",", ".") + "')");
                Response.Redirect("Detay.aspx?AltKategoriId=" + Request.QueryString["AltKategoriId"]);
                
            }
            else
            {
                Adet = Convert.ToInt32(dr["Adet"]);
                Adet = Convert.ToInt32(txtAdet.Text);
                YeniFiyat = (Convert.ToDecimal(Fiyat) * Adet);

                db.execute("UPDATE Sepet SET Adet='" + Adet + "' , YeniFiyat='" + YeniFiyat.ToString().Replace(",",".")+ "'  Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND AltKategoriId='" + Request.QueryString["AltKategoriId"] + "' ");
                Response.Redirect("Detay.aspx?AltKategoriId=" + Request.QueryString["AltKategoriId"]);
            }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Beklenmedik Bir Hata Oluştu')</script>");
            }
        }
        else
        {
            Response.Redirect("Kaydol.aspx");
        }
    }
}