<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Precios.aspx.cs" Inherits="TP4_Recu.Precios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Id.Precio."></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Consulta" OnClick="Button1_Click" style="height: 26px" />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Precio"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
&nbsp;
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Producto"></asp:Label>
&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="descripcion" DataValueField="descripcion">
            </asp:DropDownList>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button20" runat="server" Text="Alta" OnClick="Button20_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button30" runat="server" Text="Baja" OnClick="Button30_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Modificacion" OnClick="Button4_Click" />
            &nbsp;
            <asp:Label ID="Label3" runat="server"></asp:Label>
            
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Productos.aspx">Productos</asp:HyperLink>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" InsertCommand="INSERT INTO precios(fecha, monto, idProducto) VALUES (@fecha, @monto, @idProducto)" SelectCommand="SELECT * FROM [precios]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="Calendar1" Name="fecha" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idProducto" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox4" Name="monto" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBaja" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" DeleteCommand="DELETE FROM precios WHERE (id = @id)" SelectCommand="SELECT * FROM [precios]">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceModificacion" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" SelectCommand="SELECT * FROM [precios]" UpdateCommand="UPDATE precios SET fecha = @fecha, monto = @monto, idProducto = @idProducto WHERE (id = @id)
">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="Calendar1" Name="fecha" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="TextBox3" Name="monto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idProducto" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBuscar" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" SelectCommand="SELECT * FROM [precios]where id = @id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TP4-RecuConnectionString %>" SelectCommand="SELECT [descripcion] FROM [productos]"></asp:SqlDataSource>
        </div>
    </form>
    
</body>
</html>
