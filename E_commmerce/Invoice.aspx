<%@ Page Title="" Language="C#"   MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="E_commmerce.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table{
            width:100%;
            padding:1rem;

        }
        th{
            color:#fff;
        }
        th,td{
            
            padding:1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Panel ID="Panel1" runat="server">
        <div  class="container-fluid" id="invoice" runat="server">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6 py-3">
                <div class="card mb-3 secondary">
                     <h3 class="card-title text-center py-3"> INVOICE</h3>
                    
                    <h4 class="text-light text-center p-3" style="background-color:#333333">Personal Information</h4>
                   
                            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333">
                                <AlternatingItemStyle BackColor="White" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <ItemTemplate>
                                    <div class="w-100">
                                    Name:
                                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Email:
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    Phone:
                                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                                    <br />
                                    <br />

                                    </div>

                                   
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Email], [Phone] FROM [registerUser] WHERE ([Id] = @Id)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Id" SessionField="user-id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        
                        
                        
                  
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                     </asp:GridView>

                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductId],[Name], [Quantity],[Price],[Image],(Quantity*Price) as SubTotal FROM [cart] INNER JOIN Product ON cart.ProductId=Product.Id WHERE ([UserID] = @UserID)">
                         <SelectParameters>
                             <asp:SessionParameter Name="UserID" SessionField="user-id" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                    <table>
                        <tr>
                            
                            <td>
                                
                            </td>
                            <td> </td>
                            <td> </td>
                            <td style="text-align:end;">
                                
                                <asp:Label ID="Label1" runat="server" Text="Total: ₹ 0" Padding="20px" ForeColor="#FF6600"></asp:Label>
                                
                            </td>
                        </tr>
                    </table>
                            
                   </div>
                </div>
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-5">
                    <asp:Button ID="Button2" class="btn primary" runat="server" Text="Download Invoice" OnClick="Button2_Click" /> &nbsp; &nbsp;<asp:Button ID="Button1" class="btn primary" runat="server" Text="place the Order" OnClick="Button1_Click" /></div>

            </div>
                
               
            
        </div>
     </div>

    </asp:Panel>
    
</asp:Content>
