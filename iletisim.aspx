<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  


    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Telefon</h4>
                        <p >
                            <asp:Label ID="lblTel" style="color:black; font-size:12pt;" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Adres</h4>
                        <p>
                            <asp:Label ID="lblAdres" style="color:black; font-size:12pt;" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Açılış-Kapanış</h4>
                        <p>
                            <asp:Label ID="lblAcilis" runat="server" style="color:black; font-size:12pt;" Text=""></asp:Label></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>
                            <asp:Label ID="lblMail" style="color:black; font-size:12pt;" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
        <asp:Label ID="lblMaps" runat="server" Text=""></asp:Label>
        
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container ">
            <div class="checkout__form">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Mesaj Gönder</h2>
                    </div>
                </div>
            </div>
            
                <div class="row was-validated">
                    
                        <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <asp:TextBox ID="txtAdSoyad" CssClass="form-control" placeholder="Ad Soyad" runat="server" name="uname" required></asp:TextBox>
                    </div>
                        </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                           
                            <asp:TextBox ID="txtMail" class="form-control" placeholder="Mail" runat="server" TextMode="Email" required></asp:TextBox>
                   </div>
                             </div>

                    <div class="col-lg-12 text-center" style="padding-top:20px;" >
                        <div class="form-group">
                         <asp:TextBox ID="txtKonu" style="height:300px; resize:none;" TextMode="MultiLine" CssClass="form-control" placeholder="Konu" runat="server" required></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="btnGonder" style="margin-top:20px; color:white;" class="site-btn" runat="server" OnClick="btnGonder_Click">Gönder</asp:LinkButton>
                    </div>

                  
                </div>
            <br />
            <div class="row">
                    <div class="col-lg-12 text-center" >
                        <asp:Label ID="lblBlgi" Visible="false" CssClass="alert alert-success" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblBilgi1" Visible="false" CssClass=" alert alert-danger" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:RegularExpressionValidator  ID="MailKontrol"  runat="server" ErrorMessage="" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
            </div>
            </div>
        </div>
    </div>
    <!-- Contact Form End -->


</asp:Content>

