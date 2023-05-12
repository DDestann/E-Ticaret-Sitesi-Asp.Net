using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Sepetim : System.Web.UI.Page
{
    dbislem db = new dbislem();
  
    int Adet = 0;
    decimal YeniFiyat = 0;
    decimal Fiyat = 0;
    int Onay = 1;
    int ID = 0;
    string Tarih = "";
    string OdemeTipi = "";
    decimal Toplam1 = 0;
    int Sayi = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Title"] == null)
            Response.Redirect("Default.aspx");
        
        if (Session["KullaniciId"]!=null && Session["KullaniciId"]!="")
        {

            if (!Page.IsPostBack)
                SiparisOnayList();

        }
        else
        {
            Response.Redirect("Default.aspx");
        }


        SepetToplam();
    }

    private void SepetToplam()
    {
        if (Session["KullaniciId"] != null)
        {
            DataTable dtTutar = db.GetDataTable("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

            for (int i = 0; i < dtTutar.Rows.Count; i++)
            {
                Toplam1 += Convert.ToDecimal(dtTutar.Rows[i]["YeniFiyat"].ToString());
            }



            if (Toplam1 > 0)
            {
                lblAraToplam.Text = " " + Toplam1.ToString();
                lblToplam.Text = " " + Toplam1.ToString();

            }
            else
            {
                lblAraToplam.Text = " 0";
                lblToplam.Text = " 0";
            }

        }
       
    }






    private void SiparisOnayList()
    {

        DataTable dtSiparisOnay = db.GetDataTable("SELECT   Sepet.*, Kullanici.*, dbo.AltKategori.* FROM   Sepet INNER JOIN "+
                        " Kullanici ON Sepet.KullaniciId = Kullanici.KullaniciId INNER JOIN "+
                        " AltKategori ON Sepet.AltKategoriId = AltKategori.AltKategoriId Where Sepet.Onay=0  AND Sepet.KullaniciId=" + Session["KullaniciId"]);
        DtlSiparisOnay.DataSource = dtSiparisOnay;
        DtlSiparisOnay.DataBind();
    }
    protected void DtlSiparisOnay_ItemCommand(object source, DataListCommandEventArgs e)
    {
       
        Label lblFiyat = (Label)e.Item.FindControl("lblFiyat");
        TextBox txtAdet = (TextBox)e.Item.FindControl("txtAdet");

        DataRow dr = db.GetDataRow("Select * From Sepet Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0  ");

        if (e.CommandName=="btnArti")
        {
            Adet = Convert.ToInt32(txtAdet.Text);
                 if (int.TryParse(Adet.ToString(), out Sayi))
                 {
                     Adet = (Sayi + 1);
                 }

                 Fiyat = Convert.ToDecimal(lblFiyat.Text);
                 YeniFiyat = (Convert.ToDecimal(Fiyat) * Adet);
                db.execute("UPDATE Sepet SET Adet='" + Adet + "' , YeniFiyat='" + YeniFiyat.ToString().Replace(",",".")+ "'  Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND SepetId="+e.CommandArgument);

        }
        else if (e.CommandName=="btnEksi")
        {
            Adet = Convert.ToInt32(txtAdet.Text);

            if (int.TryParse(Adet.ToString(), out Sayi))
            {
                Adet = (Sayi - 1); 
            }
           if (Adet == 0) { Adet = 1; }

                Fiyat = Convert.ToDecimal(lblFiyat.Text);
                YeniFiyat = (Convert.ToDecimal(Fiyat) * Adet);
            db.execute("UPDATE Sepet SET Adet='" + Adet + "' , YeniFiyat='" + YeniFiyat.ToString().Replace(",", ".") + "'  Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND SepetId=" + e.CommandArgument);

        }

        else if (e.CommandName=="btnSepetSil")
        {
            db.execute("Delete From Sepet  Where KullaniciId='" + Session["KullaniciId"] + "' AND Onay=0 AND SepetId="+e.CommandArgument);
        }

        SiparisOnayList();
       Response.Redirect("Sepetim.aspx");

    }
    protected void btnSiparisTamam_Click(object sender, EventArgs e)
    {
        if (Session["KullaniciId"] != null && Session["KullaniciId"] != "")
        {
            DataRow drkontrol = db.GetDataRow("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);
            if (drkontrol != null)
            {
                if (rdbKredi.Checked)
                    OdemeTipi = "Kredi Kartı";
                else
                    OdemeTipi = "Nakit";

                if (txtMNot.Text=="")
                {

                    db.execute("Insert into SepetGetir(MNot,KullaniciId,MOnayTarihi,OdemeTipi,YOnay,Tutar) Values('" + "Not Yok" + "','" + Session["KullaniciId"] + "', '" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy HH:mm")) + "', '" + OdemeTipi + "' , '" + 0 + "','" + Toplam1.ToString().Replace(",",".")+ "')");
                }
                else
                {
                    db.execute("Insert into SepetGetir(MNot,KullaniciId,MOnayTarihi,OdemeTipi,YOnay,Tutar) Values('" + txtMNot.Text + "','" + Session["KullaniciId"] + "' , '" + Convert.ToString(DateTime.Now.ToString("dd.MM.yyyy HH:mm")) + "', '" + OdemeTipi + "' , '" + 0 + "','" + Toplam1.ToString().Replace(",", ".") + "' )");
                }
                
                DataTable dtTutar = db.GetDataTable("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

                for (int i = 0; i < dtTutar.Rows.Count; i++)
                {
                    Onay += Convert.ToInt32(dtTutar.Rows[i]["Onay"].ToString());
                    

                    DataTable dt = db.GetDataTable("Select * From SepetGetir Where KullaniciId=" + Session["KullaniciId"]);

                    for (int a = 0; a < dt.Rows.Count; a++)
                    {
                        ID = Convert.ToInt32(dt.Rows[a]["ID"]);
                        Tarih=dt.Rows[a]["MOnayTarihi"].ToString();

                    }
                }

                db.execute("update Sepet Set ID='" + ID + "' , Onay='" + Onay + "',SiparisTarihi='"+Tarih+"'  Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);


            }

            Response.Redirect("Profil.aspx");
        }
    }
}