<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="displayReports.aspx.cs" Inherits="EDC2015_Trabalho1.Personal.displayReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <asp:Label runat="server">As Minhas Vendas</asp:Label>

    </h1>
    <p>
       <asp:GridView runat="server" AutoGenerateRows="False" CssClass="table table-striped table-hover" GridLines="None" DataSourceID="SqlDataSource1">
           <Columns>
               <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
               <asp:BoundField DataField="ord_num" HeaderText="ord_num" SortExpression="ord_num" />
               <asp:BoundField DataField="stor_id" HeaderText="stor_id" SortExpression="stor_id" />
               <asp:BoundField DataField="ord_date" HeaderText="ord_date" SortExpression="ord_date" />
               <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
               <asp:BoundField DataField="payterms" HeaderText="payterms" SortExpression="payterms" />
           </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>" SelectCommand="getMySales" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>


</asp:Content>
