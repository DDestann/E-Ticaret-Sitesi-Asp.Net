<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/yonetim.master" AutoEventWireup="true" CodeFile="Ayarlar.aspx.cs" Inherits="yonetim_Ayarlar" %>

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

.Flu INPUT
{
    background-color:white;
    color:#6999e6;
    padding: 8px 12px 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    text-align:center;
}


    </style>




</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container-fluid">
<div class="row">

<!--------  Orta Alan Üst Başlık ------------------>
<div class=" col-sm-3 col-md-2"></div>
<div class=" col-sm-9  col-md-10">
  <h2 class=" page-header Baslik slidbar_top"> Ayarlar </h2>
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
      <asp:Label  ID="Label8" runat="server" class="col-sm-3 lable_Color">FirmaAdı</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtFirma" class="form-control"  placeholder="Firma Adı"  runat="server" ></asp:TextBox>
    </div>
  </div>
                              <div class="form-group">
      <asp:Label  ID="Label20" runat="server" class="col-sm-3 lable_Color">Açılış</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtAcilis" class="form-control"  placeholder="Açılış-Kapanış Saati"  runat="server" ></asp:TextBox>
    </div>
  </div>

                       <div class="form-group">
      <asp:Label  ID="Label16" runat="server" class="col-sm-3 lable_Color">Adres</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtAdres" class="form-control"  placeholder="Adres"  runat="server" ></asp:TextBox>
    </div>
  </div>

                       <div class="form-group">
      <asp:Label  ID="Label11" runat="server" class="col-sm-3 lable_Color">iletişim</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtiletisim" class="form-control"  placeholder="iletişim Numarası"  runat="server" ></asp:TextBox>
    </div>
  </div>
                       <div class="form-group">
      <asp:Label  ID="Label15" runat="server" class="col-sm-3 lable_Color">Harita</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtHarita" class="form-control"  placeholder="Harita link"  runat="server" ></asp:TextBox>
    </div>
  </div>

              <div class="form-group">
                  <asp:Label ID="Label12" runat="server" class="col-sm-3 lable_Color">SiteAdı</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtSite" class="form-control" placeholder="SiteAdı" runat="server"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label13" runat="server" class="col-sm-3 lable_Color">Host</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtHost" class="form-control" placeholder="smtp.Live.com && smtp.gmail.com && smtp.office365.com" runat="server"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
      <asp:Label  ID="Label17" runat="server" class="col-sm-3 lable_Color">Port</asp:Label>
    <div class="col-sm-9 ">
        <asp:TextBox ID="txtPort" class="form-control"  placeholder="587"  runat="server" ></asp:TextBox>
    </div>
  </div>

              <div class="form-group">
                  <asp:Label ID="Label1" runat="server" class="col-sm-3 lable_Color">Anahtar&nbsp;Kelime</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtKey" class="form-control" placeholder="Key" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label4" runat="server" class="col-sm-3 lable_Color">Açıklama</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtDesc" class="form-control" placeholder="Desc" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label5" runat="server" class="col-sm-3 lable_Color">Facebook&nbsp;Link</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtFlink" class="form-control" placeholder="Facebook" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label6" runat="server" class="col-sm-3 lable_Color">instegram&nbsp;Link</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtiLink" class="form-control" placeholder="instegram" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label7" runat="server" class="col-sm-3 lable_Color">Youtube&nbsp;Link</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtYLİnk" class="form-control" placeholder="Youtube" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>


              <div class="form-group">
                  <asp:Label ID="Label14" runat="server" class="col-sm-3 lable_Color">Yasal&nbsp;Haklar</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtYasalHak" class="form-control" placeholder="Yasal Hak" runat="server" TextMode="MultiLine"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label9" runat="server" class="col-sm-3 lable_Color">Mail</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtMail" class="form-control" placeholder="Mail" runat="server" TextMode="Email"></asp:TextBox>
                  </div>
              </div>

              <div class="form-group">
                  <asp:Label ID="Label10" runat="server" class="col-sm-3 lable_Color">Şifre</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:TextBox ID="txtSifre" class="form-control" placeholder="Şifre" runat="server"></asp:TextBox>
                  </div>
              </div>


              <div class="form-group">
                  <asp:Label ID="Label3" runat="server" class="col-sm-3 lable_Color">Logo</asp:Label>
                  <div class="col-sm-9 ">
                      <asp:FileUpload ID="fluResim" CssClass="form-control Flu" runat="server" />
                  </div>
              </div>

              <asp:Panel ID="pnlEskiResim" Visible="false" runat="server">

                  <div class="form-group">
                      <asp:Label ID="Label2" runat="server" class="col-sm-3 lable_Color">Eski&nbsp;Logo</asp:Label>
                      <div class="col-sm-9 ">
                          <asp:Image ID="ImageEskiResim" class="thumbnail" Width="171" Height="190" runat="server" />
                      </div>
                  </div>

              </asp:Panel>


              <br />
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
     <div class="panel-heading panel-heading-Height"><h5 class=" AltBaslik"> Ayar Listele </h5></div>
      <div class=" panel panel-body">
      <div class=" col-sm-6 col-md-12">
      

     <asp:DataList ID="Dtlist" Visible="true" Width="100%" runat="server">

         <HeaderTemplate>
                <table class="table table-hover ">
 
          <thead >
      <tr class="Tablo-bg Sekil">
        
          <th style="width:40%;" >Logo</th>
          
        <th style="width:40%;" >Key</th>
        
        <th style="width:5%;">Düzenle</th>
        
        
      </tr>
    </thead>
                    </table>
         </HeaderTemplate>

         <itemtemplate>
             <table class="table table-hover ">
                 <tbody>
                     <tr>
                         <td style="width:40%;">
                             
                             <img class="thumbnail" width="70" height="90" src="../images/yuklenen/Logo/kucuk/<%#Eval("Logo") %>"  />
                         </td>
                         <td style="width:40%;"><%#Eval("MetaKey") %></td>
                        
                         <td style="width:5%;"><a href="Ayarlar.aspx?Duzenle=<%#Eval("AyarId") %>">
                             <img src="images/user_edit.png"></a></td>
                         
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

