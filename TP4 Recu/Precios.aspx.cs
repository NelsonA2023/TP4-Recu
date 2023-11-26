using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4_Recu
{
    public partial class Precios : System.Web.UI.Page
    {
      

        protected void Button20_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == "")
            {
                SqlDataSource1.InsertParameters["monto"].DefaultValue = TextBox4.Text;
                SqlDataSource1.InsertParameters["idproducto"].DefaultValue = this.DropDownList1.SelectedValue;
                //SqlDataSource1.InsertParameters["fecha"].DefaultValue = this.Calendar1.SelectedDate.ToString;
                SqlDataSource1.Insert();
                Label3.Text = "se efectuó la carga";
                TextBox1.Text = "";
            }
            else
                Label3.Text = "complete los datos";
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBuscar.SelectParameters["id"].DefaultValue = this.TextBox1.Text;
            this.SqlDataSourceBuscar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceBuscar.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                //this.Label1.Text = "Descripcion:" + registros["descriarticulo"] + "<br>" + "Precio:" + registros["precio"] + "<br>" + "Rubro:" + registros["descrirubro"];
                TextBox4.Text = registros["monto"].ToString();
            }
            else
                this.Label3.Text = "No existe ";
        }

        protected void Button30_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBaja.DeleteParameters["id"].DefaultValue = this.TextBox1.Text;
            int cant;
            cant = this.SqlDataSourceBaja.Delete();
            if (cant == 1)
            {
                this.Label4.Text = "Se borró la categoria";
            }
            else
                this.Label4.Text = "No existe la categoria";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
            SqlDataSourceModificacion.UpdateParameters["idDenunciaCategoria"].DefaultValue = TextBox4.Text;
            int cant;
            cant = SqlDataSourceModificacion.Update();
            if (cant == 1)
            {
                Label3.Text = "Se modificaron los datos";
            }
            else
                Label3.Text = "No existe dicho codigo de usuario";
        }
    }
}