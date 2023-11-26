using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4_Recu
{
    public partial class Productos : System.Web.UI.Page
    {


        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != "")
            {
                SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
                SqlDataSourceModificacion.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
                int cant;
                cant = SqlDataSourceModificacion.Update();
                Label3.Text = "Llego hasta aca";
                if (cant == 1)
                    Label3.Text = "Se modificaron los datos";
                else
                    Label3.Text = "No existe dicho codigo de usuario";
            }
            else
                Label3.Text = "Debe ingresar descripcion";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                this.SqlDataSourceBaja.DeleteParameters["id"].DefaultValue = this.TextBox1.Text;
                int cant;
                cant = this.SqlDataSourceBaja.Delete();
                if (cant == 1)
                    this.Label3.Text = "Se borró el producto";
                else
                    this.Label3.Text = "No existe el producto";
            }
            else
                this.Label3.Text = "Debe ingresar un codigo";
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBuscar.SelectParameters["id"].DefaultValue = this.TextBox1.Text;
            this.SqlDataSourceBuscar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceBuscar.Select(DataSourceSelectArguments.Empty);

                        if (registros.Read())
                        {
                            TextBox2.Text = registros["descripcion"].ToString();

                        }
                        else
                            this.Label3.Text = "No existe esa categoria";
                  
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(TextBox2.Text))
            {
               SqlDataSource1.InsertParameters["descripcion"].DefaultValue = TextBox2.Text;
               SqlDataSource1.InsertParameters["descripcion"].DefaultValue = TextBox2.Text;
               SqlDataSource1.Insert();
               Label3.Text = "se efectuó la carga";
               TextBox1.Text = "";
               TextBox2.Text = "";
            }

            else
           
                this.Label3.Text = "Debe ingresar una descripcion";
            
        }
    }
}