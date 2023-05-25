<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="E_commmerce.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        td{
            display: flex;
    align-items: center;
    justify-content: center;
    
        }
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6 py-3">
                <div class="card mb-3 secondary">
                    <h3 class="card-title text-center py-3"> Your Cart</h3>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="card mb-3 p-2" style="width: 540px;">
                  <div class="row g-0">
                    <div class="col-md-4">
                      <img src="Admin/<%# Eval("Image") %>" class="img-fluid rounded-start" style="width:10rem;" alt="...">
                    </div>
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title"><%# Eval("Name") %></h5>
                        <p class="card-text">Price: <%# Eval("Price") %> 
                            <br />
                            Quantity :
                            <a href="updateCart.aspx?incre=false&quant=<%# Eval("Quantity") %>&id=<%# Eval("ProductId") %>" class="t-decor">
                                <i class="fa-solid fa-minus" style="color:#ff5a4c;"></i>
                            </a>
                            <input class="p-1 text-center" style="width:40px!important" type="number" aria-disabled="true" value="<%# Eval("Quantity") %>"/> 
                            <a href="updateCart.aspx?incre=true&id=<%# Eval("ProductId") %>" class="t-decor"><i class="fa-solid fa-plus" style="color:#ff5a4c;"></i></a></p>
                       
                      </div>
                    </div>
                  </div>
                </div>
               

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductId],[Name], [Quantity],[Price],[Image] FROM [cart] INNER JOIN Product ON cart.ProductId=Product.Id WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="user-id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <div class="row"> 
                        <div class="col-sm-6">
                             <h3 class="card-title text-center py-3"> Total Cart Value:</h3>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <h3 Id="totalsum" runat="server" class="card-title primary text-center py-3"> &#x20b9; 0</h3>
                        </div>
                    </div>
                    <div class="row"> 
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6 py-3">
                            <button class="btn primary px-3 py-3 w-100">
                                <b class="text-light"><a href="Invoice.aspx" class="t-decor" style="color:#fff">CheckOut The Cart </a><i class="fa-solid fa-cart-shopping fa-xl" style="color:#fff;""></i> </b>
                            </button>

                        </div>
                    </div>
                   
                    </div>
                </div>
        </div>
</div>
</asp:Content>
