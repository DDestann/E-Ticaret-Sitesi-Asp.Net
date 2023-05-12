using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class yonetim_yonetim : System.Web.UI.MasterPage
{
    dbislem db = new dbislem();

    protected void Page_Load(object sender, EventArgs e)
    {

        ContactMessage();
    }


    private void ContactMessage()
    {
        DataTable dt = db.GetDataTable("Select * From Contact Where Okundu=0");

        if (dt.Rows.Count > 0)
        {
            lblContactMessage.Text = " (" + dt.Rows.Count.ToString() + ")";
        }
    }



    protected void btnSingOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Clear();
        Session.Abandon();
        Response.Cookies.Clear();
        Response.Redirect("Login.aspx");
    }
   
}
