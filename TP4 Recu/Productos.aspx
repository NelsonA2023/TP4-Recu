<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TP4_Recu.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Id.Producto."></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server">   </asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Descripciom"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Alta" />
            &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Baja" />
            &nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Modificacion" />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server"></asp:Label>
            
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Precios.aspx">Precios</asp:HyperLink>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" InsertCommand="INSERT INTO productos (descripcion) VALUES (@descripcion)" SelectCommand="SELECT * FROM [productos]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="descripcion" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBaja" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" DeleteCommand="DELETE FROM productos where id = @id" SelectCommand="SELECT * FROM [productos]">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceModificacion" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" SelectCommand="SELECT * FROM [productos]" UpdateCommand="UPDATE productos SET descripcion = @descripcion  WHERE (id = @id)
">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="descripcion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBuscar" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" SelectCommand="SELECT descripcion FROM productos WHERE (id = @id)">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
