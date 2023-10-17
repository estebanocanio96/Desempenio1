<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionCuentas.aspx.cs" Inherits="Desempenio1.AltaCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MovimientosCuentas.aspx">Volver</asp:HyperLink>
            <br />
            <br />
            Cuentas Contables<br />
            <br />
            Fecha:&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Monto:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="lista" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            Modificar Cuenta:
            <br />
            <asp:SqlDataSource ID="lista" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023 %>" DeleteCommand="DELETE FROM [CuentasContables] WHERE [id] = @id" InsertCommand="INSERT INTO [CuentasContables] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [CuentasContables]" UpdateCommand="UPDATE [CuentasContables] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Actualizar" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023 %>" SelectCommand="SELECT * FROM [CuentasContables]"></asp:SqlDataSource>
            <br />
            FILTRO<br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id" Height="16px" Width="177px">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Filtrar" />
&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Desfiltrar" />
            <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Caption="Datos Cuentas" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="idCuentaContable" HeaderText="IdCuenta" SortExpression="idCuentaContable" />
                    <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="fecha" SortExpression="fecha" />
                    <asp:BoundField DataField="monto" DataFormatString="{0:c}" HeaderText="monto" SortExpression="monto" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString1 %>" DeleteCommand="DELETE FROM [MovimientosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [MovimientosContables] ([idCuentaContable], [fecha], [monto]) VALUES (@idCuentaContable, @fecha, @monto)" ProviderName="<%$ ConnectionStrings:IssdTP42023ConnectionString1.ProviderName %>" SelectCommand="SELECT MovimientosContables.id, MovimientosContables.idCuentaContable, MovimientosContables.fecha, MovimientosContables.monto, CuentasContables.nombre FROM MovimientosContables INNER JOIN CuentasContables ON MovimientosContables.idCuentaContable = CuentasContables.id" UpdateCommand="UPDATE [MovimientosContables] SET [idCuentaContable] = @idCuentaContable, [fecha] = @fecha, [monto] = @monto WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCuentaContable" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="fecha" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="monto" PropertyName="Text" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuentaContable" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox4" DbType="Date" Name="fecha" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox5" Name="monto" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="modificar" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023 %>" SelectCommand="SELECT * FROM [CuentasContables]"></asp:SqlDataSource>
            Datos Cuenta:<br />
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="GuardarDatos" />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
