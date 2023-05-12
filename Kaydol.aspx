<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSite.master" AutoEventWireup="true" CodeFile="Kaydol.aspx.cs" Inherits="Kaydol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
 <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="checkout__form">
                <h4 style="text-align:center;">Üye Kayıt Formu</h4>
           
                    <div class="row was-validated">
                        <div class="col-lg-12 col-md-6">
                            <div class="form-group">
                                <label for="uname">Ad Soyad:</label>
                                <asp:TextBox ID="txtAdSoyad" class="form-control" placeholder="Ad Soyad"  runat="server" required></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label for="uname">Adres:</label>
                                <asp:TextBox ID="txtAdres" class="form-control" placeholder="Adres"  runat="server" required></asp:TextBox>
                            </div>



                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="uname">Telefon:</label>
                                        <asp:TextBox ID="txtTel" class="form-control" placeholder="Telefon Numarası"  runat="server" TextMode="Phone" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="uname">E-Mail: <asp:RegularExpressionValidator style="color:#f53f3f;" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mail Adresi Doğu Biçimde Değil " ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></label>
                                        <asp:TextBox ID="txtMail" class="form-control" placeholder="EMail"  runat="server" TextMode="Email" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    
                                    <div class="form-group">
                                        <label for="uname">Şifre:</label>
                                        <asp:TextBox ID="txtSifre" class="form-control" placeholder="Şifre"  runat="server" TextMode="Password" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="uname">Şifre Tekrar:</label>
                                        <asp:TextBox ID="txtTSifre" class="form-control" placeholder="Şifre Tekrar"  runat="server" TextMode="Password" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12" style="text-align:center;" >
                                <asp:Label ID="lblBilgi" style="text-align:center; color:#f53f3f; font-size:15pt;" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="col-lg-2" style="float: right;">
                                <asp:LinkButton ID="btnGiris" runat="server" class="site-btn" style="color:white;" Text="Kaydol" OnClick="btnGiris_Click">Kaydol</asp:LinkButton>
                                
                            </div>
                            

                        </div>
                        
                    </div>
                
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </section>
    <!-- Checkout Section End -->


</asp:Content>

