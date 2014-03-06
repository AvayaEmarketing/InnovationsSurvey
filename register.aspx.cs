using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

public partial class register : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class Datos
    {

        public string email { get; set; }
        public string registerDate { get; set; }
        public string q1 { get; set; }
        public string q2 { get; set; }
        public string q3 { get; set; }
        public string q4 { get; set; }
        public string q5 { get; set; }
        public string q6 { get; set; }
        public string q7 { get; set; }
        public string q8 { get; set; }
        public string q9 { get; set; }
        public string q10 { get; set; }
        public string q11 { get; set; }
        public string q12 { get; set; }
        public string q13 { get; set; }
        public string q14 { get; set; }
        
    }

    public static string DataTableToJSON(DataTable table)
    {
        List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();

        foreach (DataRow row in table.Rows)
        {
            Dictionary<string, object> dict = new Dictionary<string, object>();

            foreach (DataColumn col in table.Columns)
            {
                dict[col.ColumnName] = row[col];
            }
            list.Add(dict);
        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(list);
    }

    [WebMethod]
    public static string getDatosReg()
    {
        string result;
        SqlDataReader datos;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();
        string strSQL = "SELECT email,registerDate,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14 FROM Cala_Web.innovationsSurvey";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        
        try
        {
            con.Open();
            datos = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(datos);
            result = DataTableToJSON(dt);
            //result = JsonConvert.SerializeObject(dt);
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            result = "";
        }
        finally
        {
            con.Close();
        }
        return result;

    }


                                                                                                                                                                                                             

    [WebMethod]
    public static string putData(string email, string q1, string q2, string q3, string q4, string q5, string q6, string q7, string q8, string q9, string q10, string q11, string q12, string q13, string q14)
    {
        string result = "";
        DateTime datt = DateTime.Now;
        string fecha = "";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();

        string strSQL = "SELECT CURRENT_TIMESTAMP AS registerDate";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        try
        {
            con.Open();
            datt = (DateTime)cmd.ExecuteScalar();
            fecha = String.Format("{0:MM/dd/yyyy HH:mm:ss}", datt);
            con.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }

        string stmt = "INSERT INTO Cala_Web.innovationsSurvey (email, registerDate ,q1, q2, q3, q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14) VALUES(@email, @registerDate, @q1, @q2, @q3, @q4, @q5, @q6, @q7, @q8, @q9, @q10,@q11,@q12,@q13,@q14)";

        SqlCommand cmd2 = new SqlCommand(stmt, con);
        
        cmd2.Parameters.Add("@email", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@registerDate", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q1", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q2", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q3", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q4", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q5", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q6", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q7", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q8", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q9", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q10", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q11", SqlDbType.VarChar, 500);
        cmd2.Parameters.Add("@q12", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q13", SqlDbType.VarChar, 100);
        cmd2.Parameters.Add("@q14", SqlDbType.VarChar, 500);

        cmd2.Parameters["@email"].Value = email;
        cmd2.Parameters["@registerDate"].Value = fecha;
        cmd2.Parameters["@q1"].Value = q1;
        cmd2.Parameters["@q2"].Value = q2;
        cmd2.Parameters["@q3"].Value = q3;
        cmd2.Parameters["@q4"].Value = q4;
        cmd2.Parameters["@q5"].Value = q5;
        cmd2.Parameters["@q6"].Value = q6;
        cmd2.Parameters["@q7"].Value = q7;
        cmd2.Parameters["@q8"].Value = q8;
        cmd2.Parameters["@q9"].Value = q9;
        cmd2.Parameters["@q10"].Value = q10;
        cmd2.Parameters["@q11"].Value = q11;
        cmd2.Parameters["@q12"].Value = q12;
        cmd2.Parameters["@q13"].Value = q13;
        cmd2.Parameters["@q14"].Value = q14;
        
        try
        {
            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();
            result = "ok";
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            result = "fail";
        }
        finally
        {
            con.Close();
        }

        return result;
    }

    [WebMethod]
    public static string Convertir(string format)
    {
        string resultado = "error0";
        try
        {
            string path = HttpContext.Current.Server.MapPath("~");
            //path = path + "\\mx\\events\\movieinv";
            if (format == "XLS")
            {
                resultado = toExcel(path);
            }
            
            HttpContext.Current.Response.SetCookie(new HttpCookie("fileDownload", "true") { Path = "/" });
        }
        catch (Exception e)
        {
            resultado = e.ToString();
        }
        return resultado;

    }

    public static string getContenido()
    {
        string result = "";
        string resultado = getDatosReg();
        string tabla = "";
        var serializer = new JavaScriptSerializer();

        List<Datos> values = serializer.Deserialize<List<Datos>>(resultado);

        foreach (var root in values)
        {
            tabla += "<tr>";
            tabla += "<td>" + root.email + "</td>";
            tabla += "<td>" + root.registerDate + "</td>";
            tabla += "<td>" + root.q1 + "</td>";
            tabla += "<td>" + root.q2 + "</td>";
            tabla += "<td>" + root.q3 + "</td>";
            tabla += "<td>" + root.q4 + "</td>";
            tabla += "<td>" + root.q5 + "</td>";
            tabla += "<td>" + root.q6 + "</td>";
            tabla += "<td>" + root.q7 + "</td>";
            tabla += "<td>" + root.q8 + "</td>";
            tabla += "<td>" + root.q9 + "</td>";
            tabla += "<td>" + root.q10 + "</td>";
            tabla += "<td>" + root.q11 + "</td>";
            tabla += "<td>" + root.q12 + "</td>";
            tabla += "<td>" + root.q13 + "</td>";
            tabla += "<td>" + root.q14 + "</td>";
            tabla += "</tr>";
        }



        result = tabla;
        return result;
    }

    [WebMethod(EnableSession = true)]
    public static string validaSession()
    {
        string result = "";
        var sessionUsuario = HttpContext.Current.Session;
        if (sessionUsuario["ID"] == null)
        {
            result = "fail";
        }
        else
        {
            result = sessionUsuario["ID"].ToString();
        }
        return result;
    }

    public static string toExcel(string path1)
    {
        string respuesta = "";
        string path = path1 + "\\ExcelFiles\\";
        if (!Directory.Exists(path))
            Directory.CreateDirectory(path);
        string nombre = DateTime.Now.ToString("yyyyMMddhhmmss") + "ExcelFiles.xls";
        string fullPath = path1 + "\\ExcelFiles\\" + nombre;
        string contenido = getContenido();

        string data = "<tr><th width=\"10%\">email</th><th width=\"10%\">Register Date</th><th width=\"10%\">Q1</th><th width=\"10%\">Q2</th><th width=\"10%\">Q3</th><th width=\"10%\">Q4</th><th width=\"10%\">Q5</th><th width=\"10%\">Q6</th><th width=\"10%\">Q7</th><th width=\"10%\">Q8</th><th width=\"10%\">Q9</th><th width=\"10%\">Q10</th><th width=\"10%\">Q11</th><th width=\"10%\">Q12</th><th width=\"10%\">Q13</th><th width=\"10%\">Q14</th></tr>";
        contenido = data + contenido;
        contenido = "<table border = '1' style=" + '"' + "font-family: Verdana,Arial,sans-serif; font-size: 12px;" + '"' + ">" + contenido + "</table></body></html>";

        try
        {
            FileStream fs = new FileStream(fullPath, FileMode.OpenOrCreate, FileAccess.Write);


            using (StreamWriter writer = new StreamWriter(fs, Encoding.UTF8))
            {
                writer.Write(contenido);
            }
        }
        catch
        {
            respuesta = "fail";
        }
        finally
        {
            respuesta = nombre;
        }
        return respuesta;
    }

    [WebMethod(EnableSession = true)]
    public static string validarIngresoAdmin(string name, string pass, string app)
    {

        string result = validarIngreso(name, pass, app);
        if (result == "ok")
        {
            var sessionUsuario = HttpContext.Current.Session;
            sessionUsuario["ID"] = name;
        }
        return result;
    }

    public static string validarIngreso(string name, string pass, string app)
    {

        string resultado = "";
        string usuario;
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();

        string strSQL = "SELECT distinct usuario from UserData where usuario = @name and password = @pass and application = @app";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.Add("@name", SqlDbType.VarChar, 100);
        cmd.Parameters.Add("@pass", SqlDbType.VarChar, 300);
        cmd.Parameters.Add("@app", SqlDbType.VarChar, 100);

        //cmd2.Parameters["@Id"].Value = 0;
        cmd.Parameters["@name"].Value = name;
        cmd.Parameters["@pass"].Value = pass;
        cmd.Parameters["@app"].Value = app;


        try
        {
            con.Open();
            usuario = (String)cmd.ExecuteScalar();
            con.Close();
            if (name == usuario)
            {
                resultado = "ok";
            }
            else
            {
                resultado = "fail";
            }
        }
        catch (Exception ex)
        {
            resultado = "fail";
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }

        return resultado;
    }
}

