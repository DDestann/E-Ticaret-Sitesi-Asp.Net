using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class jsMenu : System.Web.UI.Page
{
    dbislem db = new dbislem();
    int Toplam = 1;
    int ID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = db.GetDataTable("Select * From Kullanici");
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }

    protected void btnSiparisTamam_Click(object sender, EventArgs e)
    {
        if (Session["KullaniciId"]!=null && Session["KullaniciId"]!="")
        {
            DataRow drkontrol = db.GetDataRow("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);
            if (drkontrol != null)
            {
                      db.execute("Insert into SepetGetir(MNot,KullaniciId) Values('" + "Yok" + "','"+Session["KullaniciId"]+"')");
                      DataTable dtTutar = db.GetDataTable("Select * From Sepet Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

                for (int i = 0; i < dtTutar.Rows.Count; i++)
                {
                    Toplam += Convert.ToInt32(dtTutar.Rows[i]["Onay"].ToString());

                    DataTable dt = db.GetDataTable("Select * From SepetGetir Where KullaniciId=" + Session["KullaniciId"]);

                    for (int a = 0; a < dt.Rows.Count; a++)
                    {
                        ID = Convert.ToInt32(dt.Rows[a]["ID"]);

                    }
                }

                db.execute("update Sepet Set ID='" + ID + "' , Onay='" + Toplam + "'  Where Onay=0 AND KullaniciId=" + Session["KullaniciId"]);

            
            }

            
        }
        
    }
}