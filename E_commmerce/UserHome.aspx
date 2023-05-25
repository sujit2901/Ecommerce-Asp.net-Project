<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="E_commmerce.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        tbody{
                --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(var(--bs-gutter-y) * -1);
    margin-right: calc(var(--bs-gutter-x) * -.5);
    margin-left: calc(var(--bs-gutter-x) * -.5);
        }
        .col-sm-3{
            padding:1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="conatiner">
    <div class="row">

<h5 class="p-4">View All Products</h5> 


    
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
        
        <ItemTemplate>
            

          
            <div class="col-sm-3"><div class="card product-card" style="width:16rem">
              <img src="Admin/<%# Eval("Image") %>" class="card-img-top" alt="...">
              <div class="card-body productcard-body">
                <h5 class="card-title"><%# Eval("Name") %></h5>
                <h5 class="card-title">Price: <span style="color:#ff5a4c"> &#8377; <%# Eval("Price") %></span></h5>
                <p class="card-text"><%# Eval("Description") %></p>
                <a href="AddCart.aspx?product_id=<%# Eval("Id") %>" class="btn btn-primary primary">Add To Cart <i class="fa-solid fa-cart-shopping" style="color:#fff"></i></a>
              </div>
            </div>

          
           
        </ItemTemplate>
          
    </asp:DataList>
        
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name], [Category], [Price], [Stock], [Description], [Image] FROM [Product]"></asp:SqlDataSource>
</div>

</div>
</asp:Content>
