<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="E_commmerce.WebForm3" %>
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
                <div class="card mb-3 pb-5 secondary">
                    <h3 class="card-title text-center py-3"> Your Cart</h3>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="card my-2" style="width:80%">
                  <div class="card-header">
                    orderId: <%# Eval("orderId") %>
                  </div>
                  <div class="card-body">
                      
                    <h5 class="card-title"><%# Eval("Total") %></h5>
                    
                    <a href="viewOrders.aspx?orderid=<%# Eval("orderId") %>" class="btn primary">View Order Details</a>
                  </div>
                </div>
                
                

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [orderId],[Total] FROM [orders] WHERE ([userId] = @userId)">
            <SelectParameters>
                <asp:SessionParameter Name="userId" SessionField="user-id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                    
                   
                   
                    </div>
                </div>
        </div>
</div>
</asp:Content>
