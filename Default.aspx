<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .indirim {
            height: 45px;
	width: 45px;
	background: #dd2222;
	border-radius: 50%;
	font-size: 14px;
	color: #ffffff;
	line-height: 45px;
	text-align: center;
	position: absolute;
	left: 15px;
	top: 15px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
<!--------------------------->
        <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>İndirimli Ürünler</h2>
                       
                    </div>
                    
                </div>
            </div>
     
                        <div class="row">
                        
                            <div class="product__discount__slider owl-carousel">
      <asp:Repeater ID="rptKampanya" runat="server" OnItemCommand="rptKampanya_ItemCommand">
      <ItemTemplate>
      <div class="col-lg-4">
                                    <div class="product__discount__item text-center">
                                        <div class="product__discount__item__pic set-bg" data-setbg="">
                                            <a style="color: black; font: bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"> <img src="./images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu")%>" /></a>
                                           
                                            <div class="product__discount__percent">-<%#Eval("Indirim")%>%</div>
                                            <div class="product__item__pic__hover">
                                                 <asp:LinkButton ID="btnKampanyaSepeteEkle" CssClass="site-btn" style="color:white;" CommandName="KampSepeteEkle" CommandArgument='<%#Eval("AltKategoriId") %>' runat="server">Sepete Ekle &nbsp;<i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                            </div>
                                            <%--<ul class="product__item__pic__hover">
                                                <li><a href="#" ><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>--%>
                                        </div>
                                        <div class="featured__item__text">
                                            <h6>Stok:150</h6>
                                            <h6><a style="color: black; font: bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h6>

                                            <div class="product__item__price">
                                                <i class="fa fa-try" style="font-size: 16pt; font: bold;  color: black;">
                                                    <asp:Label ID="lblYeniFiyat" style="font-weight:700;" runat="server" Text='<%#Eval("AltKategoriYFiyat") %>' CommandName="lblYeniFiyat" CommandArgument='<%#Eval("AltKategoriId") %>'></asp:Label></i>&nbsp;<del class="fa fa-try" style="font-size: 12pt; font: bold; color: red;"><%#Eval("AltKategoriFiyat") %></del></div>
                                        </div>
                                    </div>
                                </div>
      </ItemTemplate>
      </asp:Repeater>
                                
                                
                            </div>
                        </div>
                    
                    

<!---------start pro----------->
            <div class="row" style="margin-top:50px;">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Son Eklenen Ürünler</h2>
                    </div>
                    
                </div>
            </div>
                <div class="row">
                <asp:Repeater ID="rptSonEklenen" runat="server"  OnItemCommand="rptSonEklenen_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-5 col-sm-5">
                        <div class="featured__item">


                            <div class="featured__item__pic set-bg" data-setbg="">
                                <a style="color: black;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"> <img src="./images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu")%>" /></a>
                                <div class="featured__item__pic__hover">
                                    <asp:LinkButton ID="btnSepeteEkle" CssClass="site-btn" style="color:white;" CommandName="SepeteEkle" CommandArgument='<%#Eval("AltKategoriId") %>' runat="server">Sepete Ekle &nbsp;<i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                </div>

                            </div>
                            <div class="featured__item__text">
                                <h6>Stok:150</h6>
                                <h6><a style="color:black; font:bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h6>
                                <h5><i class="fa fa-try"></i>
                                    <asp:Label ID="lblFiyat" runat="server" Text='<%#Eval("AltKategoriFiyat") %>' CommandArgument='<%#Eval("AltKategoriId") %>' ></asp:Label></h5>
                            </div>






                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                    
                   
        </div>

<!--------end pro ------------>




            <!---------start fav----------->
            <asp:Panel ID="pnlFav" Visible="false" runat="server">
                
                 <div class="row" style="margin-top:50px;">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>İndirimde Olan Favoriler</h2>
                    </div>
                    
                </div>
            </div>
                <div class="row">
                <asp:Repeater ID="rptFav" runat="server" OnItemCommand="rptFav_ItemCommand">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-5 col-sm-5">
                        <div class="featured__item">

                            <asp:Panel ID="pnlindirim" runat="server">

                                <div class="featured__item__pic set-bg" data-setbg="images/yuklenen/Galeri/kucuk/<%#Eval("ResimYolu") %>">
                                <div class="indirim">-<%#Eval("Indirim") %>%</div>
                               <div class="featured__item__pic__hover">
                                    <asp:LinkButton ID="btnFavindirim" CssClass="site-btn" style="color:white;" CommandName="FavindirimEkle" CommandArgument='<%#Eval("AltKategoriId") %>' runat="server">Sepete Ekle &nbsp;<i class="fa fa-shopping-cart"></i></asp:LinkButton>
                               </div>
                                 </div>

                            <div class="featured__item__text" >
                                <h6>Stok:150</h6>
                                <h6><a style="color:black; font:bold;" href="<%#Detail(Eval("AltKategoriId").ToString(),Eval("AltKategoriAdi").ToString()) %>"><%#Eval("AltKategoriAdi").ToString() %></a></h6>

                                <div class="product__item__price">
                                   <i class="fa fa-try" style="font-size:16pt; font:bold; color:black;"> <asp:Label ID="lblFavYeniFiyat" runat="server"  Text='<%#Eval("AltKategoriYFiyat") %>' CommandName="lblFavYeniFiyat" CommandArgument='<%#Eval("AltKategoriId") %>'></asp:Label></i>&nbsp;<del class="fa fa-try" style="font-size:12pt; font:bold; color:red;"><%#Eval("AltKategoriFiyat") %></del></div>
                            </div>

                            </asp:Panel>

                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                    
                   
        </div>

            </asp:Panel>

<!--------end fav ------------>








            </div>
    </section>
    <!-- Featured Section End -->





</asp:Content>

