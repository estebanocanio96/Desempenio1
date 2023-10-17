using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desempenio1
{
    public partial class AltaCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                string cuenta = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text;
                string fecha = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
                string monto = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

                Label2.Text = "Cuenta: " + cuenta + "<br/>" + "fecha: " + fecha + "<br/>" + "Monto: " + monto;
                TextBox4.Text = GridView1.SelectedRow.Cells[5].Text;
                TextBox5.Text = GridView1.SelectedRow.Cells[3].Text;
            }
            else
            {
                Label2.Text = "No se ha seleccionado ninguna cuenta.";
            }
                
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string idCuentaContable = DropDownList1.SelectedValue;
            string fechaTexto = TextBox2.Text;
            string montoTexto = TextBox3.Text;
            
            if (string.IsNullOrWhiteSpace(idCuentaContable) || string.IsNullOrWhiteSpace(fechaTexto) || string.IsNullOrWhiteSpace(montoTexto))
            {
                Label1.Text = "Los campos no pueden estar vacios, por favor completarlos.";
                return; 
            }
            
            DateTime fechaIngresada;
            if (DateTime.TryParseExact(fechaTexto, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out fechaIngresada))
            {
                
                string fechaFormateada = fechaIngresada.ToString("yyyy-MM-dd");
               
                SqlDataSource1.InsertParameters["idCuentaContable"].DefaultValue = idCuentaContable;
                SqlDataSource1.InsertParameters["fecha"].DefaultValue = fechaFormateada;
                SqlDataSource1.InsertParameters["monto"].DefaultValue = montoTexto;
                SqlDataSource1.Insert();

                Label1.Text = "Se efectuó la carga de la cuenta";
                TextBox2.Text = "";
                TextBox3.Text = "";
            }
            else
            {
                Label1.Text = "La fecha ingresada no es válida. Utiliza el formato dd/MM/yyyy.";
            }
        }       
        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
             protected void Button2_Click(object sender, EventArgs e)
         {
             SqlDataSource1.Update();
         }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "idCuentaContable = " + DropDownList2.SelectedValue;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = string.Empty;
            SqlDataSource1.FilterParameters.Clear();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string rutaCompleta = @"C:\Users\Panchito\Desktop\Parcial1 LP3\datosGuardados.txt";

            try
            {                
                string contenidoExistente = File.Exists(rutaCompleta) ? File.ReadAllText(rutaCompleta) : "";
                
                string nuevoContenido = contenidoExistente + Label2.Text + Environment.NewLine;
               
                File.WriteAllText(rutaCompleta, nuevoContenido);

                Label3.Text = "Datos guardados correctamente";
            }
            catch (Exception ex)
            {
                
                Label3.Text = "Error al guardar datos: " + ex.Message;
            }
        }


    }
}