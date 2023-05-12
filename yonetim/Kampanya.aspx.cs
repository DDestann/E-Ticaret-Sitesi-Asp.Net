using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class yonetim_Kampanya : System.Web.UI.Page
{
    dbislem db = new dbislem();
    mesajislemleri msj = new mesajislemleri();

       string Baslik = "Kampanya";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YoneticiId"] != null && Session["YoneticiId"] != "")
        {
            if (Session["Title"] == null)
                Response.Redirect("Default.aspx");

            Page.Title = Baslik + Session["Title"].ToString();


            //lblBaslik.Text = Baslik + " Kampanya Eklendi";


            if (Request.QueryString["Onay"] != null && Request.QueryString["Onay"].ToString() != "")
            {
                db.execute("Update AltKategori Set Kampanya=1 Where AltKategoriId='" + Request.QueryString["Onay"] + "'");
                lblBasarili.Text = msj.basarili(Baslik, " Eklendi");
                pnlBasarili.Visible = true;
                pnlHata.Visible = false;
                pnlKontrol.Visible = false;
            }
            if (Request.QueryString["Kaldir"] != null && Request.QueryString["Kaldir"].ToString() != "")
            {
                db.execute("Update AltKategori Set Kampanya=0 Where AltKategoriId='" + Request.QueryString["Kaldir"] + "'");
                lblBasarili.Text = msj.basarili(Baslik, "dan Çıkarıldı");
                pnlBasarili.Visible = true;
                pnlHata.Visible = false;
                pnlKontrol.Visible = false;
            }




            Onay();
            Kaldır();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }



    private void Kaldır()
    {
        DataTable dtKaldır = db.GetDataTable("Select * from AltKategori where Kampanya=1");

        Sayfalama.DataSource = dtKaldır.DefaultView;
        Sayfalama.BindToControl = DtlKaldır;
        DtlKaldır.DataSource = Sayfalama.DataSourcePaged;
        DtlKaldır.DataBind();
        pnlKaldır.Visible = true;
       
    
    }

    private void Onay()
    {

        DataTable dtOnay = db.GetDataTable("Select * from AltKategori where Kampanya=0");

        Sayfalama1.DataSource = dtOnay.DefaultView;
        Sayfalama1.BindToControl = DtlOnay;
        DtlOnay.DataSource = Sayfalama1.DataSourcePaged;
        DtlOnay.DataBind();
        pnlOnay.Visible = true;
      

    }





}