<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="AltKategori.aspx.cs" Inherits="yonetim_AltKategori" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

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
<div class="container-fluid">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top">Alt Kategoriler </h2>
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

               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                                  <div class="form-group">
      <asp:Label  ID="Label1" runat="server" class="col-sm-3 lable_Color">Kategori&nbsp;Adı</asp:Label>
    <div class="col-sm-9 ">
        <asp:DropDownList ID="drpKat" class="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpKat_SelectedIndexChanged"></asp:DropDownList>
    </div>
  </div>
                      <div class="clearfix"></div>
                  </ContentTemplate>
              </asp:UpdatePanel>

              <div class="clearfix"></div>

              <div class="form-group">
      <asp:Label  ID="Label4" runat="server" class="col-sm-3 lable_Color">AltKategori&nbsp;Adı</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtAltKatAd" class="form-control"  placeholder="AltKategori Adı" runat="server"></asp:TextBox>
    </div>
  </div>

              <div class="clearfix"></div>

              <div class="form-group">
      <asp:Label  ID="Label3" runat="server" class="col-sm-3 lable_Color">AltKategori&nbsp;Fiyat</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtAltKatFiyat" class="form-control"  placeholder=" Fiyat" runat="server"></asp:TextBox>
    </div>
  </div>

   <div class="clearfix"></div>

              <div class="form-group">
      <asp:Label  ID="lblAltKatYFiyat" runat="server" class="col-sm-3 lable_Color">Indirimli&nbsp;Fiyat</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtYfiyat" class="form-control" Enabled="false"  placeholder=" indirimli Fiyat" runat="server"></asp:TextBox>
    </div>
  </div>


   <div class="clearfix"></div>

              <div class="form-group">
      <asp:Label  ID="lblYuzde" runat="server" class="col-sm-3 lable_Color">Yüzdelik&nbsp;Indirim</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtYuzde" class="form-control"  placeholder=" Yüzdelik" runat="server"></asp:TextBox>
    </div>
  </div>


              <div class="clearfix"></div>
                             
            <div class="form-group">
      <asp:Label  ID="Label6" runat="server" class="col-sm-3 lable_Color">Resim</asp:Label>
    <div class="col-sm-9 ">
        <asp:FileUpload ID="fluResim"  CssClass="form-control Sayfalama" runat="server" />
    </div>
  </div>

              <div class="clearfix"></div>

               <asp:Panel ID="pnlEskiResim" Visible="false" runat="server">

                  <div class="form-group">
                      <asp:Label ID="Label7" runat="server" class="col-sm-3 lable_Color">Eski&nbsp;Resim</asp:Label>
                      <div class="col-sm-9 ">
                          <asp:Image ID="ImageEskiResim" class="thumbnail" width="171" height="190" runat="server" />
                      </div>
                  </div>

              </asp:Panel>

              <div class="clearfix"></div>



              <div class="form-group">
      <asp:Label  ID="Label2" runat="server" class="col-sm-3 lable_Color">Içerik</asp:Label>
    <div class="col-sm-9 ">
        <CKEditor:CKEditorControl ID="CKicerik" runat="server"></CKEditor:CKEditorControl>
    </div>
  </div>


            <div class="clearfix"></div>


          
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                      <asp:Button ID="btnKaydet" Text="Kaydet" runat="server" 
                          class="btn btn-primary Button-Right btn-sm Button-Top" 
                          OnClick="btnKaydet_Click"  />
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
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> AltKategori Listele </h5></div>
      <div class=" panel panel-body">
      <div class=" col-md-12">
      
        <asp:Label  ID="Label5" runat="server" class="col-sm-2 lable_Color">Ara</asp:Label>
    <div class="col-sm-8 ">
        <asp:TextBox ID="txtAra" class="form-control"  placeholder="Ürün veya Kategori Adı "  runat="server"></asp:TextBox>

    </div>
                  <div class="col-sm-2">
                      <asp:Button ID="btnAra" Text="Ara" runat="server" class="btn btn-primary Button-Right btn-sm Button-Top" OnClick="btnAra_Click" />
                  </div>
<div class=" Top"></div>
    


      <br />
      <br />
      <br />
     <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
          <th style="width:10%;" >Resim</th>
        <th style="width:40%;" >Kategori Adı</th>
        <th style="width:40%;" >AltKategori Adı</th>
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
                        <td style="width:10%;"> <img class="thumbnail" width="70" height="80"  src="../images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>" /> </td>
                         <td style="width:40%;"><%#Eval("KategoriAdi") %></td>
                         <td style="width:40%;"><%#Eval("AltKategoriAdi") %></td>
                        
                         <td style="width:5%;"><a href="AltKategori.aspx?Duzenle=<%#Eval("AltKategoriId") %>">
                             <img src="images/user_edit.png"></a></td>
                         <td style="width:5%;"><a href="AltKategori.aspx?Sil=<%#Eval("AltKategoriId") %>" onclick='return confirm("Silmek istediğinizden emin misiniz?");'>
                             <img src="images/trash.png"></a></td>
                     </tr>

                 </tbody>
             </table> 
      </itemtemplate>
     
          </asp:DataList>
 
         
  
  <!---- page ------>

  










        
      <cc1:CollectionPager ID="Sayfalama" runat="server" BackNextDisplay="Buttons"
BackNextLinkSeparator="" BackNextLocation="Split" BackNextStyle=""
BackText="<" ControlCssClass="Sayfalama" ControlStyle=""
FirstText="<<" HideOnSinglePage="True" IgnoreQueryString="True"
LabelStyle="" LabelText="Sayfalar :" LastText=">>" MaxPages="100"
NextText=">" PageNumbersDisplay="Numbers" PageNumbersSeparator="&amp;nbsp;"
PageNumbersStyle="" PageNumberStyle="" PageSize="8" PagingMode="PostBack"
QueryStringKey="Sayfa"
ResultsFormat="{2} tane makaleden {0} - {1} arası gösteriliyor"
ResultsLocation="None" ResultsStyle="" SectionPadding="10" ShowFirstLast="True"
ShowLabel="False" ShowPageNumbers="True" SliderSize="15"  UseSlider="True">
        </cc1:CollectionPager>



              

  

<!---- page ------>
</div>
      </div>
    </div>

</div>
<!--------  Orta Alan Sağ Bitti ------------------>

</div>
</div>



</asp:Content>

