<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="E_commmerce.Admin.ManageProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table{
            margin-top:2rem;
        }
table, td, th {
    border: 1px solid #ff5a4c!important;
  
}
td,th{
   font-size:16px!important;
   padding:1rem;
   text-align:center;
}

table {
  width: 100%!important;
  border-collapse: collapse!important;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h5 class="pt-3 px-2">Manage Products</h5>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="#f9e7d3" />
        <Columns>
           
           
           
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CommandField HeaderText="Action" SortExpression="Action" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#ff5a4c" />
        <HeaderStyle BackColor="#ff5a4c" Font-Bold="True" />
        <PagerStyle BackColor="#f9e7d3" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Product] ([Name], [Category], [Price], [Stock], [Description]) VALUES (@Name, @Category, @Price, @Stock, @Description)" SelectCommand="SELECT [Id], [Name], [Category], [Price], [Stock], [Description] FROM [Product]" UpdateCommand="UPDATE [Product] SET [Name] = @Name, [Category] = @Category, [Price] = @Price, [Stock] = @Stock, [Description] = @Description WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name], [Category], [Price], [Stock], [Description] FROM [Product]" DeleteCommand="DELETE FROM [Product] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Product] ([Name], [Category], [Price], [Stock], [Description]) VALUES (@Name, @Category, @Price, @Stock, @Description)" UpdateCommand="UPDATE [Product] SET [Name] = @Name, [Category] = @Category, [Price] = @Price, [Stock] = @Stock, [Description] = @Description WHERE [Id] = @Id" OnSelecting="SqlDataSource1_Selecting1">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="Stock" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
