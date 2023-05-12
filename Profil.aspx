<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Profil.aspx.cs" Inherits="Kullanici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>
                                <asp:Label ID="lblKulAd" runat="server" Text=""></asp:Label></h4>
                            <ul>
         <li>
             <asp:LinkButton ID="btnAdresSifre" runat="server" OnClick="btnAdresSifre_Click">Bilgilerim</asp:LinkButton>
         </li>
         <li>
             <asp:LinkButton ID="btnSiparis" runat="server" OnClick="btnSiparis_Click">Siparişlerim</asp:LinkButton>
         </li>
         <li>
             <asp:LinkButton ID="btnESiparis" runat="server" OnClick="btnESiparis_Click">Eski Siparişlerim</asp:LinkButton>
         </li>
        
         <li>
             <asp:LinkButton ID="btnFafori" runat="server" OnClick="btnFafori_Click">Faforilerim<asp:Label ID="lblFav" runat="server" Text=""></asp:Label></asp:LinkButton></li>
     </ul>
                        </div>
                        
                    </div>
                </div>
            
            
                <div class="col-lg-9 col-md-7">
                 
                 <!---- Adres - Sifre start----->
         <asp:Panel ID="pnlAdresSifre" Visible="false" runat="server">
                 <div class="checkout__form">
                <h4 style="text-align:center;">Bilgilerim</h4>


                     <div class="row was-validated">
                        <div class="col-lg-12 col-md-6">
                            <div class="checkout__input">
                                <label for="uname">Ad Soyad:</label>
                                <asp:TextBox ID="txtAdSoyad" class="form-control" style="color:black;" placeholder="Ad Soyad"  runat="server" required></asp:TextBox>
                            </div>

                           <div class="checkout__input">
                                <label for="uname">Adres:</label>
                                <asp:TextBox ID="txtAdres" class="form-control" style="color:black;" placeholder="Adres"  runat="server" required></asp:TextBox>
                            </div>



                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <label for="uname">Telefon:</label>
                                        <asp:TextBox ID="txtTel" class="form-control" style="color:black;" placeholder="Telefon Numarası"  runat="server" TextMode="Phone" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <label for="uname">E-Mail:</label>
                                        <asp:TextBox ID="txtMail" class="form-control" style="color:black;" placeholder="EMail"  runat="server" TextMode="Email" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    
                                    <div class="checkout__input">
                                        <label for="uname">Yeni Şifre:</label>
                                        <asp:TextBox ID="txtSifre" style="color:black;" class="form-control" placeholder="Şifre"  runat="server" TextMode="Password" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <label for="uname">Şifre Tekrar:</label>
                                        <asp:TextBox ID="txtTSifre" style="color:black;" class="form-control" placeholder="Şifre Tekrar"  runat="server" TextMode="Password" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12" style="text-align:center;" >
                                <asp:Label ID="lblGuncelle" style="text-align:center; color:#f53f3f; font-size:15pt;" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="col-lg-2" style="float: right;">
                                <asp:LinkButton ID="btnGuncelle" class="site-btn" style="color:white;" runat="server" OnClick="btnGuncelle_Click">Güncelle</asp:LinkButton>
                               
                                
                            </div>
                            

                        </div>
                        
                    </div>



                     </div>
                        </asp:Panel>
                    <!---- Adres - Sifre end----->
                    
            <!---- Favoriler Start----->

         <asp:Panel ID="pnlFavori" Visible="false" runat="server">
      <div class="checkout__form">
                <h4 style="text-align:center;">Favorilerim</h4>
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Ürünler</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                                    <tbody>
<tr>
                                        <asp:DataList ID="DtlFav"  runat="server" OnItemCommand="DtlFav_ItemCommand">
                                            <ItemTemplate>
                                                
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                          <td class="shoping__cart__item">
                                                        <img style="width: 100px; height: 100px;" src="images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>" alt="" />
                                                        <h5><a style="color:black; font:bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h5>
                                                    </td>
                                                    <td class="shoping__cart__price">&nbsp; </td>
                                                    <td class="shoping__cart__quantity">&nbsp;</td>
                                                    <td class="shoping__cart__total">&nbsp;</td>
                                                    <td class="shoping__cart__item__close">
                                                        <asp:LinkButton ID="btnFavKaldir" data-toggle="tooltip" title="Faforilerden Kaldır" CommandName="FavKaldir" CommandArgument='<%#Eval("FavoriId") %>' runat="server"><i class="fa fa-close"></i></asp:LinkButton>
                                                    </td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                               
                                            </ItemTemplate>
                                        </asp:DataList>
 </tr>
                            </tbody>
                               
                        </table>
                    </div>
                </div>
        </div>
    
         </asp:Panel>

            <!---- Favoriler end----->


                    
    <!---- Siparişlerim Start----->
         <asp:Panel ID="pnlSiparis" Visible="false" runat="server">
             <div class="checkout__form">
                <h4 style="text-align:center;">Onay Bekleyen Siparişler</h4>
             <div class="col-lg-12">
                    <div class="shoping__cart__table">

                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" style="width:55%;">Ürünler</th>
                                    <th style="width:15%;">Fiyat</th>
                                    <th style="width:15%;">Adet</th>
                                    <th style="width:15%;">Tutar</th>
                                    <%--<th style="width:15%;">Sil</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <asp:DataList ID="DtlSiparis" runat="server">
                                        <ItemTemplate>
                                            <td class="shoping__cart__item" style="width: 55%;">
                                                <img style="width: 100px; height: 100px;" src="images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>" alt="" />
                                                <h5><%#Eval("AltKategoriAdi") %></h5>
                                            </td>

                                            <td class="shoping__cart__total"  style="width: 15%;">
                                                <asp:Panel ID="pnlFiyat" Visible="true" runat="server">
                                                    <i class="fa fa-try"></i><%#Eval("Fiyat") %>
                                                </asp:Panel>

                                            </td>
                                          <td class="shoping__cart__total" style="width: 15%;">
                                                <%#Eval("Adet") %>
                                            </td>
                                            <td class="shoping__cart__total" style="width: 15%;">
                                                <i class="fa fa-try"></i><%#Eval("YeniFiyat") %>
                                            </td>
                                           <%-- <td class="shoping__cart__item__close" style="width: 15%;">
                                                <span class="icon_close"></span>
                                                
                                            </td>--%>
                                        </ItemTemplate>
                                    </asp:DataList>
                                 </tr>
                               

                            </tbody>
                            
                        </table>
                        
                    </div>

                    <div style="float:right;"><h4>Toplam: <i class="fa fa-try"></i>
                        <asp:Label ID="lblTutarSepet" runat="server" Text=""></asp:Label></h4></div>
                </div>
        </div>
         </asp:Panel>
            <!---- Siparişlerim end----->






    <!---- Eski Siparişlerim Start----->
         <asp:Panel ID="pnlESiparis" Visible="false" runat="server">

         <div class="checkout__form">
                <h4 style="text-align:center;">Eski Siparişlerim</h4>
             <div class="col-lg-12">
                    <div class="shoping__cart__table">

                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" style="width:40%;">Ürünler</th>
                                    <th style="width:15%;">Fiyat</th>
                                    <th style="width:15%;">Adet</th>
                                    <th style="width:15%;">Tutar</th>
                                    <th style="width:15%;">Tarih</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <asp:DataList ID="DtlEskiSiparis" runat="server">
                                        <ItemTemplate>
                                            <td class="shoping__cart__item" style="width: 40%;">
                                                <img style="width: 100px; height: 100px;" src="images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>" alt="" />
                                                <h5><%#Eval("AltKategoriAdi") %></h5>
                                            </td>

                                            <td class="shoping__cart__total"  style="width: 15%;">
                                                <asp:Panel ID="pnlFiyat" Visible="true" runat="server">
                                                    <i class="fa fa-try"></i><%#Eval("Fiyat") %>
                                                </asp:Panel>

                                            </td>
                                          <td class="shoping__cart__total" style="width: 15%;">
                                                <%#Eval("Adet") %>
                                            </td>
                                            <td class="shoping__cart__total" style="width: 15%;">
                                                <i class="fa fa-try"></i><%#Eval("YeniFiyat") %>
                                            </td>
                                            <td class="shoping__cart__item__close" style="width: 15%;">
                                                <%--<span class="icon_close"></span>--%>
                                                <%#Eval("SiparisTarihi") %>
                                            </td>
                                        </ItemTemplate>
                                    </asp:DataList>
                                 </tr>
                               

                            </tbody>
                            
                        </table>
                        
                    </div>

                    <div style="float:right;"><h4>Genel Toplam: <i class="fa fa-try"></i>
                        <asp:Label ID="lblTutar" runat="server" Text=""></asp:Label></h4></div>
                </div>
        </div>

         </asp:Panel>
            <!---- Eski Siparişlerim end----->

                    
                </div>
            </div>


        </div>
    </section>
    <!-- Product Section End -->

</asp:Content>

