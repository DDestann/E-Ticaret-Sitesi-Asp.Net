<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Yonetim.aspx.cs" Inherits="yonetim_Yonetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
        .Sekil { float:right; width:100%;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <!--------  Orta Alan  ------------------>
<div class="container-fluid">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top"> Yönetim </h2>
</div>
<!--------  Orta Alan Üst Başlık Bitti ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-4">
<div class="panel panel-primary">
      <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> <asp:Label ID="lblBaslik" runat="server" Text=""></asp:Label> </h5></div>
      <div class="panel-body">
      
      
      <div style="margin-top:5px;">

<div class="col-md-12">
    <asp:Panel ID="pnlBasarili" Visible="false" runat="server">
<div class="alert alert-success fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Başarılı! </strong><asp:Label ID="lblBasarili" runat="server" Text=""></asp:Label> 
  </div>
</asp:Panel>
 <!-------- <div class="alert alert-info fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Info!</strong> This alert box could indicate a neutral informative change or action.
  </div>
  <div class="alert alert-warning fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Warning!</strong> This alert box could indicate a warning that might need attention.
  </div>------>
    <asp:Panel ID="pnlHata" Visible="false" runat="server">
  <div class="alert alert-danger fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Hatalı! </strong> <asp:Label ID="lblHata" runat="server" Text=""></asp:Label> .
  </div>
</asp:Panel>
 </div>
</div>


<div class="Temizle"></div>
      
<!-----<div style="margin-top:5px;">
<div class="col-md-4 lable_Center">Kategori Adı:</div>
<div class="col-md-8"> <input type="text" class="form-control" placeholder="Search..."> </div>
</div>------->
          <div class="form-horizontal">

       


              <div class="form-group">
      <asp:Label  ID="Label3" runat="server" class="col-sm-3 lable_Color">Kullanıcı&nbsp;Adı</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtAd" class="form-control"  placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
    </div>
  </div>

              <div class="form-group">
                  <asp:Label ID="Label1" runat="server" class="col-sm-3 lable_Color">Email</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtMail" class="form-control" placeholder="Email" runat="server" TextMode="Email"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label2" runat="server" class="col-sm-3 lable_Color">Şifre</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtSifre" class="form-control" placeholder="Şifre" runat="server"></asp:TextBox>
                  </div>
              </div>


              <br/>
              <br />
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <asp:Button ID="btnKaydet" Text="Kaydet" runat="server" class="btn btn-primary Button-Right btn-sm Button-Top" OnClick="btnKaydet_Click" />
                  </div>
              </div>
          </div>

      
      </div>
    </div>

</div>
<!--------  Orta Alan Sağ ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9 col-md-6">


   <div class="panel panel-primary">
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> Yönetici Listele </h5></div>
      <div class=" panel panel-body">
      <div class=" col-sm-6 col-md-12">
      

     <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
        
          <th style="width:5%;" >ID</th>
        <th style="width:30%;" >Yönetici Adı</th>
        <th style="width:30%;" >Yönetici Mail</th>
        <th style="width:25%; text-align:center;">Şifre</th>
        <th style="width:5%;">Düzenle</th>
        <th  style="width:5%;">Sil</th>
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr>
                         <td><%#Eval("YoneticiId") %></td>
                         <td><%#Eval("YoneticiAdi") %></td>
                         <td><%#Eval("YoneticiMail") %></td>
                         <td  ><%#Eval("Sifre") %></td>
                         <td ><a href="Yonetim.aspx?Duzenle=<%#Eval("YoneticiId") %>">
                             <img src="images/user_edit.png"></a></td>
                         <td ><a href="Yonetim.aspx?Sil=<%#Eval("YoneticiId") %>" onclick='return confirm("Silmek istediğinizden emin misiniz?");'>
                             <img src="images/trash.png"></a></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>
 
         
  
  <!---- page ------>
<ul class="pagination pagin">
<li><a href="#">Previous</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">Next</a></li>
</ul>
<!---- page ------>
</div>
      </div>
    </div>

</div>
<!--------  Orta Alan Sağ Bitti ------------------>

</div>
</div>


</asp:Content>

