<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Detay.aspx.cs" Inherits="Detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

   <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
           
              
                <asp:DataList ID="dtlDetay"  runat="server">
                   <ItemTemplate>
                       <div class="row">
                       <div class="col-lg-6 col-md-6">
                           <div class="product__details__pic">
                               <div class="product__details__pic__item">
                                   <img class="product__details__pic__item--large" alt="" src="images/yuklenen/Galeri/buyuk/<%#Eval("ResimYolu") %>" />
                               </div>

                           </div>
                       </div>

                       <div class="col-lg-6 col-md-6">

                           <div class="product__details__text">

                               <h3><%#Eval("AltKategoriAdi") %></h3>
                               <div class="product__details__price">

                                   <asp:Panel ID="pnlFiyat" Visible="false" runat="server">
                                  
                                       <i class="fa fa-try"></i> <asp:Label ID="lblFiyat" runat="server" Text=""></asp:Label>
                                
                                    </asp:Panel>

                                   <asp:Panel ID="pnlYFiyat" Visible="false" runat="server">
                                       <i class="fa fa-try"></i>
                                       <asp:Label ID="lblYeniFiyat" runat="server" Text=""></asp:Label>&nbsp;&nbsp;<i class="fa fa-try"></i><del><%#Eval("AltKategoriFiyat") %></del></asp:Panel>
                              

                               </div>
                               <ul>
                                   <li><b>Availability</b> <span>In Stock</span></li>
                                   <li><b>Shipping</b> <span>01 day shipping.
                               <samp>Free pickup today</samp></span></li>
                                   <li><b>Weight</b> <span>0.5 kg</span></li>

                               </ul>
                           </div>
                       </div>
                </div>
                   </ItemTemplate>
               </asp:DataList>

            
                <div class="col-lg-11 col-md-11" >
                    <div class="product__details__text"  style="float:right; ">
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <asp:TextBox ID="txtAdet" min="1" runat="server"  TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <asp:LinkButton ID="btnSepetEkle" CssClass="primary-btn" style="color:white;" runat="server" OnClick="btnSepetEkle_Click">Sepete Ekle <i class="fa fa-shopping-cart"></i></asp:LinkButton>

                        <asp:LinkButton ID="btnFavEkle" class="heart-icon"  Visible="false" runat="server" OnClick="btnFavEkle_Click"><i class="fa fa-heart"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnFavSil" class="heart-icon" style="color:white; background:red; border-color:red; " Visible="false" runat="server" OnClick="btnFavSil_Click"><i class="fa fa-heart"></i></asp:LinkButton>
                        

                    </div>
                </div>
            <br />

            <div class="col-lg-10 col-md-10">

     <div style="margin-top:-20px;">

                     <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link active" style="font-weight:600" href="#">Yorumlar</a>


    </li>
    <li class="nav-item">
      <a class="nav-link active" style="font-weight:600" href="#">Yorum Yaz</a>

        

               


    </li>
    

                         

        
                      <asp:Panel ID="PnlYorum" style="margin-top:20px;" runat="server">

                          Lego -. Uygun fiyata ücretsiz hızlı teslimat. 30 gün içinde ücretsiz iade. Binlerce Ürüne Göz Atın ve Keşfedin. Müşteri Yorumlarını Okuyun ve En Çok Satanları Bulun. Taksit seçenekleri. Ücretsiz hızlı kargo. Kargo takibi. 30 gün ücretsiz iade. Uygun fiyatlar. Binlerce ürün.

                </asp:Panel>



                          <asp:Panel ID="pnlYorumYaz" style="margin-top:20px;" runat="server">

                    YAZ
                </asp:Panel>

  </ul>

     </div>

               


            </div>


       </div>
        
    </section>
    <!-- Product Details Section End -->

   




   







</asp:Content>

