<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="E_commmerce.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-4">
        <div class="card mb-3 secondary" style="width:100%">
            <div class="row g-0">
                
                <div class="col-md-12 p-3">
                    <div class="card-body">
                        <h5 class="card-title">Add Product</h5>
                        <form >
                            <br />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label1" runat="server" Font-Size="18px" Text="Product Name:" ></asp:Label>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="Prod_name" class="form-control" type="text" runat="server" required="true"></asp:TextBox>
                                             
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Label ID="Label2" runat="server" Font-Size="18px" Text="Product Category:"></asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="Prod_cat" class="form-control" runat="server"  required="true">
                                                    <asp:ListItem>Mobile</asp:ListItem>
                                                    <asp:ListItem>Laptop</asp:ListItem>
                                                    <asp:ListItem>Smart Watches</asp:ListItem>
                                                     <asp:ListItem>Earpods</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                             
                                            </div>
                                        </div>

                                    </div>
                            </div>
                            <br />
                              <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label3" runat="server" Font-Size="18px" Text="Product Price:" ></asp:Label>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="prod_price" class="form-control" type="number" runat="server" required="true"></asp:TextBox>
                                             
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Label ID="Label4" runat="server" Font-Size="18px" Text="Product In Stock:"></asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="prod_stock" class="form-control" type="number" runat="server" required="true"></asp:TextBox>
                                             
                                            </div>
                                        </div>

                                    </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label5" runat="server" Font-Size="18px" Text="Product Description:"></asp:Label>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="Prod_desc" class="form-control" runat="server" TextMode="MultiLine" Height="100" required="true"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Label ID="Label6" runat="server" Font-Size="18px" Text="Product Image:"></asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                <asp:FileUpload   class="form-control" ID="FileUpload1" runat="server" required="true" />
                                            </div>
                                        </div>

                                    </div>
                            </div>
                            <br />
                            <asp:Button type="submit" ID="Button1" class="btn primary px-3 py-2 " runat="server" Text="Add Product" OnClick="Button1_Click" />
                          
                          
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>



    </div>
</asp:Content>
