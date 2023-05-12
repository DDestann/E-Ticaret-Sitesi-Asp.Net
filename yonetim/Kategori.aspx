<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Kategori.aspx.cs" Inherits="yonetim_Kategori" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   

    <style type="text/css">

        .Sekil { float:right; width:100%;
        }


   .Sayfalama a:link, .Sayfalama a:visited, .Sayfalama a:active
{

    color: #6999e6;
   padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    text-align:center;
    
}

        .Sayfalama a:hover
{
     background-color: #eee;
    padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    
}

.Sayfalama INPUT
{
    background-color:white;
 color:#6999e6;
    padding: 8px 12px 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
text-align:center;
}

.Sayfalama INPUT:hover
{
   background-color: #eee;
 color:#6999e6;
    padding: 8px 12px 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
text-align:center;
}

.Sayfalama B
{

    background-color: #6999e6;
    color: white;
    padding: 10px 12px 10px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
}




    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--------  Orta Alan  ------------------>
 <!--------  Orta Alan  ------------------>
<div class="container-fluid">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top"> Kategori </h2>
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
  </div>------>

    <asp:Panel ID="pnlKontrol" Visible="false" runat="server">
         <div class="alert alert-warning fade in">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Uyarı!</strong> <asp:Label ID="lblKontrol" runat="server" Text=""></asp:Label>
  </div>
    </asp:Panel>

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
                  <asp:Label ID="Label1" runat="server" class="col-sm-3 lable_Color">Kategori&nbsp;Adı</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtKategoriAd" class="form-control" placeholder="Kategori Adı" runat="server"></asp:TextBox>
                  </div>
              </div>
              <div class="clearfix"></div>
              <div class="form-group">
                  <asp:Label ID="Label3" runat="server" class="col-sm-3 lable_Color">Resim</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:FileUpload ID="fluResim" CssClass="form-control Sayfalama" runat="server" />
                  </div>
              </div>
              <div class="clearfix"></div>
              <asp:Panel ID="pnlEskiResim" Visible="false" runat="server">

                  <div class="form-group">
                      <asp:Label ID="Label2" runat="server" class="col-sm-3 lable_Color">Eski&nbsp;Resim</asp:Label>
                      <div class="col-sm-9 ">
                          <asp:Image ID="ImageEskiResim" class="thumbnail" Width="171" Height="190" runat="server" />
                      </div>
                  </div>

              </asp:Panel>


              <br />
              <br />
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <asp:Button ID="btnKaydet" Text="Kaydet" runat="server"
                          class="btn btn-primary Button-Right btn-sm Button-Top"
                          OnClick="btnKaydet_Click" />
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
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> Kategori Listele </h5></div>
      <div class=" panel panel-body">
      <div class=" col-sm-6 col-md-12">
      

     <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
        
          <th style="width:40%;" >Resim</th>
          
        <th style="width:40%;" >Kategori Adı</th>
        
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
                         <td style="width:40%;">
                             <img class="thumbnail" width="70" height="90" src="../images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>"  />
                         </td>
                         <td style="width:40%;"><%#Eval("KategoriAdi") %></td>
                        
                         <td style="width:5%;"><a href="Kategori.aspx?Duzenle=<%#Eval("KategoriId") %>">
                             <img src="images/user_edit.png"></a></td>
                         <td style="width:5%;"><a href="Kategori.aspx?Sil=<%#Eval("KategoriId") %>" onclick='return confirm("Silmek istediğinizden emin misiniz?");'>
                             <img src="images/trash.png"></a></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>
 
         
  
  <!---- page ------>

        
          <cc1:collectionpager id="Sayfalama" runat="server" backnextdisplay="Buttons"
              backnextlinkseparator="" backnextlocation="Split" backnextstyle=""
              backtext="<" controlcssclass="Sayfalama" controlstyle=""
              firsttext="<<" hideonsinglepage="True" ignorequerystring="True"
              labelstyle="" labeltext="Sayfalar :" lasttext=">>" maxpages="100"
              nexttext=">" pagenumbersdisplay="Numbers" pagenumbersseparator="&amp;nbsp;"
              pagenumbersstyle="" pagenumberstyle="" pagesize="8" pagingmode="PostBack"
              querystringkey="Sayfa"
              resultsformat="{2} tane makaleden {0} - {1} arası gösteriliyor"
              resultslocation="None" resultsstyle="" sectionpadding="10" showfirstlast="True"
              showlabel="False" showpagenumbers="True" slidersize="15" useslider="True">
        </cc1:collectionpager>






  

<!---- page ------>
</div>
      </div>
    </div>

</div>
<!--------  Orta Alan Sağ Bitti ------------------>

</div>
</div>

</asp:Content>

