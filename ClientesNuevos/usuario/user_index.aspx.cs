﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ClientesNuevos.App_Code;

using System.Web.Security;
using System.Net;
using System.Net.Mail;
using System.Resources;
using System.Web.UI.WebControls.WebParts;
using System.Security.Policy;

namespace ClientesNuevos.usuario
{
    public partial class Index : System.Web.UI.Page
    {
        DataTable dt;
        HttpCookie cook;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(User.IsInRole("3") || User.IsInRole("4"))
                {
                    //3=Cliente, 4=proveedor
                    //
                    getCompania();
                    if(dt.Rows.Count > 0)
                    {
                        try
                        {
                            //Creacion de cookie para poder onsultarlo; 
                            cook = new HttpCookie("id_comp", dt.Rows[0]["ID_compania"].ToString());
                            Response.Cookies.Add(cook);

                            //Muestro el nombre comercial de la compania
                            lblCompania.Text = dt.Rows[0]["Nombre_comercial"].ToString();

                            //Oculto campos
                            OcultarCampos(dt.Rows[0]["Tipo_persona"].ToString());

                            //Cargo documentos.
                            Documentos();

                        }
                        catch (Exception ex)
                        {

                            lblError.Text = "Ocurrio un error " + ex.Message;
                        }


                    }
                    else
                    {
                        //Si el no se encontro registro es redireccionado para los cirterios minimos
                        DataTable dtInfo = clsHerramientaBD.Existe("SELECT * FROM [Table_Documentos] WHERE Documento='F20' AND ID_compania='" + Request.Cookies.Get("id").Value + "'");

                        if(dtInfo.Rows.Count > 0)
                        {
                            Response.Redirect("~/f14/secciones/InformacionCompania.aspx");
                        }
                        Response.Redirect("../F20/CriteriosMinimos.aspx");

                    }
                }else if(User.IsInRole("1") || User.IsInRole("2"))
                {
                    lblCompania.Text = "Modo admin";
                }
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            dt = new DataTable();
            getCompania();
            //Guarda el documento
            string uploadFolder = Request.PhysicalApplicationPath + "archivos\\";
            // string getCompania_id
            string compania_id = dt.Rows[0]["ID_compania"].ToString();
            Directory.CreateDirectory(uploadFolder + "\\usuario");

            if (inputFile.HasFile)
            {
                string documento = inputFile.PostedFile.FileName;
                string extension = documento.Substring(documento.Length - 4, 4);

                if (extension == ".pdf")
                {

                    inputFile.SaveAs(uploadFolder + "\\usuario\\" + compania_id + "_" + documento);
                    lblError.Text = "Archivo guardado con exito" + uploadFolder;
                }
            }


        }

        protected void getCompania()
        {
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();
            dt = new DataTable();


            string id_user = GetID();
            dt = wsBaseDatos.getCompania(id_user);


        }

        protected void Documentos()
        {
            string id = Request.Cookies.Get("id").Value;
            bool f5 = false, f14 = false;
            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos(HttpContext.Current.Request.Cookies.Get("id_comp").Value, id);

                for (int i = 0; i < Docs.Count; i++)
                {
                    //=================================== F14
                    if (Docs[i].Documento == "F14")
                    {
                        f14= true;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF14_estatus.Text = "completado";
                            lblF14_estatus.CssClass = "etiqueta";


                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblF14_estatus.Text = "en revision";
                            lblF14_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblF14_estatus.Text = "actualizar";
                            lblF14_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblF14_estatus.Text = "actualizado";
                            lblF14_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF14_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }

                        lblF14_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                    }
                    //================================ F43
                    if (Docs[i].Documento == "F43")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF43_estatus.Text = "completado";
                            lblF43_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblF43_estatus.Text = "en revision";
                            lblF43_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblF43_estatus.Text = "actualizar";
                            lblF43_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblF43_estatus.Text = "actualizado";
                            lblF43_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF43_estatus.Text = "Pendiente";
                        }
                        lblF43_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    //================================================= F5
                    if (Docs[i].Documento == "F5")
                    {
                        f5 = true;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF5_estatus.Text = "completado";
                            lblF5_estatus.CssClass = "etiqueta";
                            btnEvaluacion.Text = "Ver resultados";

                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblF5_estatus.Text = "en revision";
                            lblF5_estatus.CssClass = "etiqueta revision";
                            btnEvaluacion.Text = "Ver resultados";
                            


                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblF5_estatus.Text = "actualizar";
                            lblF5_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblF5_estatus.Text = "actualizado";
                            lblF5_estatus.CssClass = "etiqueta updated";
                            btnEvaluacion.Text = "Ver resultados";


                        }
                        else
                        {
                            lblF5_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblF5_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    //==================================================== F12
                    if (Docs[i].Documento == "F12")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF12_estatus.Text = "completado";
                            lblF12_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblF12_estatus.Text = "en revision";
                            lblF12_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblF12_estatus.Text = "actualizar";
                            lblF12_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblF12_estatus.Text = "actualizado";
                            lblF12_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF12_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblF12_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    //==================================================== RFC
                    if (Docs[i].Documento == "RFC")
                    {
                        txtRFC.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblRFC_estatus.Text = "completado";
                            lblRFC_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblRFC_estatus.Text = "en revision";
                            lblRFC_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblRFC_estatus.Text = "actualizar";
                            lblRFC_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblRFC_estatus.Text = "actualizado";
                            lblRFC_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblRFC_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblRFC_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                        RFC_ver.Enabled = true;
                        RFC_ver.CssClass = RFC_ver.CssClass.Replace("disabled", "");

                        RFC_borrar.Enabled = true;
                        RFC_borrar.CssClass = RFC_borrar.CssClass.Replace("disabled", "");
                    }
                    //=============================================== CURP                    
                    if (Docs[i].Documento == "CURP")
                    {
                        txtCURP.Text = Docs[i].Ruta;    
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCURP_estatus.Text = "completado";
                            lblCURP_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblCURP_estatus.Text = "en revision";
                            lblCURP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCURP_estatus.Text = "actualizar";
                            lblCURP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCURP_estatus.Text = "actualizar";
                            lblCURP_estatus.CssClass = "etiqueta actualizar";
                        } 
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblCURP_estatus.Text = "actualizado";
                            lblCURP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCURP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCURP_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                        CURP_ver.Enabled = true;
                        CURP_ver.CssClass = CURP_ver.CssClass.Replace("disabled", "");

                        CURP_borrar.Enabled = true;
                        CURP_borrar.CssClass = CURP_borrar.CssClass.Replace("disabled", "");
                    }
                    //============================== Carta de no antecedentes
                    if (Docs[i].Documento == "Carta de no antecedentes penales")
                    {
                        txtCNAP.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCNAP_estatus.Text = "completado";
                            lblCNAP_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblCNAP_estatus.Text = "en revision";
                            lblCNAP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCNAP_estatus.Text = "actualizar";
                            lblCNAP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblCNAP_estatus.Text = "actualizado";
                            lblCNAP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCNAP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCNAP_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        CNAP_borrar.Enabled = true;
                        CNAP_borrar.CssClass = CNAP_borrar.CssClass.Replace("disabled", "");

                        CNAP_ver.Enabled = true;
                        CNAP_ver.CssClass = CNAP_ver.CssClass.Replace("disabled", "");
                    }
                    //=========================== Comprobante de domicilio
                    if (Docs[i].Documento == "Comprobante de domicilio")
                    {
                        txtCompDom.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCompDom_estatus.Text = "completado";
                            lblCompDom_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblCompDom_estatus.Text = "en revision";
                            lblCompDom_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCompDom_estatus.Text = "actualizar";
                            lblCompDom_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblCompDom_estatus.Text = "actualizado";
                            lblCompDom_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCompDom_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCompDom_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        CompDom_borrar.Enabled = true;
                        CompDom_borrar.CssClass = CompDom_borrar.CssClass.Replace("disabled", "");

                        CompDom_ver.Enabled = true;
                        CompDom_ver.CssClass = CompDom_ver.CssClass.Replace("disabled", "");
                    }
                    //===================== Identificacion de representante legal
                    if (Docs[i].Documento == "Identificacion de representante legal")
                    {
                        txtIRL.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblIRL_estatus.Text = "completado";
                            lblIRL_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblIRL_estatus.Text = "en revision";
                            lblIRL_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblIRL_estatus.Text = "actualizar";
                            lblIRL_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblIRL_estatus.Text = "actualizado";
                            lblIRL_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblIRL_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblIRL_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        IRL_borrar.Enabled = true;
                        IRL_borrar.CssClass = RFC_borrar.CssClass.Replace("disabled", "");
                        IRL_ver.Enabled = true;
                        IRL_ver.CssClass = IRL_ver.CssClass.Replace("disabled", "");
                    }
                    //==================== Poder de representante legal
                    if (Docs[i].Documento == "Poder de representante legal")
                    {
                        txtPRL.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblPRL_estatus.Text = "completado";
                            lblPRL_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblPRL_estatus.Text = "en revision";
                            lblPRL_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblPRL_estatus.Text = "actualizar";
                            lblPRL_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblPRL_estatus.Text = "actualizado";
                            lblPRL_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblPRL_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblPRL_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        PRL_borrar.Enabled = true;
                        PRL_borrar.CssClass = PRL_borrar.CssClass.Replace("disabled", "");

                        PRL_ver.Enabled = true;
                        PRL_ver.CssClass = PRL_ver.CssClass.Replace("disabled", "");
                    }
                    //=============================== Opinion positiva
                    if (Docs[i].Documento == "Opinion positiva")
                    {
                        txtOP.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblOP_estatus.Text = "completado";
                            lblOP_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblOP_estatus.Text = "en revision";
                            lblOP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblOP_estatus.Text = "actualizar";
                            lblOP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblOP_estatus.Text = "actualizado";
                            lblOP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblOP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblOP_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                        OP_borrar.Enabled = true;
                        OP_borrar.CssClass = OP_borrar.CssClass.Replace("disabled", "");

                        OP_ver.Enabled = true;
                        OP_ver.CssClass = OP_ver.CssClass.Replace("disabled", "");
                    }
                    //============================== Certificacion CTPAT
                    if (Docs[i].Documento == "Certificación C-TPAT")
                    {
                        txtCTPAT.Text=Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCTPAT_estatus.Text = "completado";
                            lblCTPAT_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblCTPAT_estatus.Text = "en revision";
                            lblCTPAT_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCTPAT_estatus.Text = "actualizar";
                            lblCTPAT_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblCTPAT_estatus.Text = "actualizado";
                            lblCTPAT_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCTPAT_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCTPAT_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        CTPAT_borrar.Enabled = true;
                        CTPAT_borrar.CssClass = CTPAT_borrar.CssClass.Replace("disabled", "");

                        CTPAT_ver.Enabled = true;
                        CTPAT_ver.CssClass = CTPAT_ver.CssClass.Replace("disabled", "");
                    }
                    //=================================== Certificacion OEA
                    if (Docs[i].Documento == "Certificación OEA")
                    {
                        txtOEA.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblOEA_estatus.Text = "completado";
                            lblOEA_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblOEA_estatus.Text = "en revision";
                            lblOEA_estatus.CssClass = "etiqueta revision";

                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblOEA_estatus.Text = "actualizar";
                            lblOEA_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblOEA_estatus.Text = "actualizado";
                            lblOEA_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblOEA_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblOEA_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        OEA_borrar.Enabled = true;
                        OEA_borrar.CssClass = OEA_borrar.CssClass.Replace("disabled", "");

                        OEA_ver.Enabled = true;
                        OEA_ver.CssClass = OEA_ver.CssClass.Replace("disabled", "");
                    }
                    //=================================== W9
                    if (Docs[i].Documento == "W9")
                    {
                        txtW9.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblW9_estatus.Text = "completado";
                            lblW9_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblW9_estatus.Text = "en revision";
                            lblW9_estatus.CssClass = "etiqueta revision";

                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblW9_estatus.Text = "actualizar";
                            lblW9_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblW9_estatus.Text = "actualizado";
                            lblW9_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblW9_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblW9_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        W9_borrar.Enabled = true;
                        W9_borrar.CssClass = W9_borrar.CssClass.Replace("disabled", "");

                        W9_ver.Enabled = true;
                        W9_ver.CssClass = W9_ver.CssClass.Replace("disabled", "");

                    }
                    //=================================== Acta constitutiva
                    if (Docs[i].Documento == "Acta constitutiva")
                    {
                        txtAC.Text = Docs[i].Ruta;
                        if (Docs[i].Estatus == "100%")
                        {
                            lblAC_estatus.Text = "completado";
                            lblAC_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblAC_estatus.Text = "en revision";
                            lblAC_estatus.CssClass = "etiqueta revision";

                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblAC_estatus.Text = "actualizar";
                            lblAC_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblAC_estatus.Text = "actualizado";
                            lblAC_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblAC_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblAC_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                        AC_borrar.Enabled = true;
                        AC_borrar.CssClass = AC_borrar.CssClass.Replace("disabled", "");

                        AC_ver.Enabled = true;
                        AC_ver.CssClass = AC_ver.CssClass.Replace("disabled", "");
                    }
                    //=================================== Certificacion F20
                    if (Docs[i].Documento == "F20" && Docs[i].ID_compania == id)
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF20_estatus.Text = "completado";
                            lblF20_estatus.CssClass = "etiqueta";
                        }
                        else if (Docs[i].Estatus == "revision")
                        {
                            lblF20_estatus.Text = "en revision";
                            lblF20_estatus.CssClass = "etiqueta revision";

                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblF20_estatus.Text = "actualizar";
                            lblF20_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (Docs[i].Estatus == "updated")
                        {
                            lblF20_estatus.Text = "actualizado";
                            lblF20_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF20_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblF20_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                }

                if(f5==true && f14 == true)
                {
                    btnCartaCompromiso.Enabled = true;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            string estatus_f14 = Obtener_estatus_f14();
            if (estatus_f14 == "20%")
            {
                Response.Redirect("~/F14/secciones/agentesaduanales.aspx");

            }
            else if (estatus_f14 == "40%")
            {
                Response.Redirect("~/F14/secciones/companiafilial.aspx");

            }
            else if (estatus_f14 == "60%")
            {
                Response.Redirect("~/F14/secciones/tiposervicioproductos.aspx");

            }
            else if (estatus_f14 == "80%")
            {
                Response.Redirect("~/F14/secciones/informacioncadenasuministro.aspx");

            }
            else
            {
                Response.Redirect("~/F14/secciones/informacioncompania.aspx");
            }
        }

        protected void btnMapeo_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("../F43/mapeoflujo.aspx");

        }

        protected string Obtener_estatus_f14()
        {
            string res = "";
            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos(HttpContext.Current.Request.Cookies.Get("id_comp").Value);

                for (int i = 0; i < Docs.Count; i++)
                {
                    if (Docs[i].Documento == "F14")
                    {
                        res = Docs[i].Estatus;

                        break;
                    }
                }
            }
            catch (Exception ex)
            {

                res = ex.Message;
            }

            return res;
        }

        protected string Obtener_estatus_f5()
        {
            string res = "";

            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos(HttpContext.Current.Request.Cookies.Get("id_comp").Value);

                for (int i = 0; i < Docs.Count; i++)
                {
                    if (Docs[i].Documento == "F5")
                    {
                        res = Docs[i].Estatus;

                        break;
                    }
                }
            }
            catch (Exception)
            {

                res = "";
            }

            return res;
        }

        protected void btnCartaCompromiso_Click(object sender, EventArgs e)
        {
            Response.Redirect("../F12/politicaseguridad.aspx");
        }

        protected void btnEvaluacion_Click(object sender, EventArgs e)
        {
            string estatus = Obtener_estatus_f5();
            if (estatus == "50%")
            {
                Response.Redirect("../F5/Autoevaluacion/autoevaluacion.aspx");
            }
            else if (estatus == "100%" || estatus == "revision" || estatus == "updated")
            {
                Response.Redirect("../F5/Autoevaluacion/Resultados.aspx");
            }
            else
            {
                Response.Redirect("../F5/evaluacionseguridad.aspx");
            }
        }

        private void OcultarCampos(string tipo)
        {
            switch (tipo)
            {                
                case "0": //Moral
                    row_CNAP.Visible = false;
                    row_W9.Visible = false;
                    row_CURP.Visible = false;
                    break;
                case "1": //fisico
                    row_W9.Visible = false;
                    row_AC.Visible = false;
                    break;
                case "2": //extranjero
                    row_CNAP.Visible = false;
                    row_RFC.Visible = false;
                    row_CURP.Visible = false;
                    row_IRL.Visible = false;
                    row_PRL.Visible = false;
                    row_OP.Visible = false;
                    row_AC.Visible = false;
                    break;

                default:
                    break;
            }
        }

        protected void btnCriteriosMinimos_Click(object sender, EventArgs e)
        {
            Response.Redirect("../F20/CriteriosMinimos.aspx");
        }

        protected void Ver_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            string url = "";
            switch (buttonId)
            {
                case "W9_ver":
                    url = txtW9.Text;
                    break;
                case "AC_ver":
                    url = txtAC.Text;
                    break;
                case "RFC_ver":
                    url = txtRFC.Text;
                    break;
                case "CURP_ver":
                    url = txtCURP.Text;
                    break;
                case "CNAP_ver":
                    url = txtCNAP.Text;
                    break;
                case "CompDom_ver":
                    url = txtCompDom.Text;
                    break;
                case "IRL_ver":
                    url = txtIRL.Text;
                    break;
                case "PRL_ver":
                    url = txtPRL.Text;
                    break;
                case "OP_ver":
                    url = txtOP.Text;
                    break;
                case "CTPAT_ver":
                    url = txtCTPAT.Text;
                    break;
                case "OEA_ver":
                    url = txtOEA.Text;
                    break;
                default:
                    break;
            }
            if (url != "")
            {
                AbrirArchivo(url);
            }
            else
            {
                lblError.Text = "No se encontró el archivo";
            }
             
            
        }

        protected void AbrirArchivo(string flocation)
        {
            string FilePath = Server.MapPath(flocation);
            WebClient wClient = new WebClient();

            try
            {
                Byte[] FileBuffer = wClient.DownloadData(FilePath);

                if (FileBuffer != null)
                {
                    //Response.ContentType = "application/pdf";
                    //Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    //Response.BinaryWrite(FileBuffer);
                    Session["buffer"] = FileBuffer;
                    Response.Redirect("~/Viewer.aspx");
                    //Response.Write("<script>window.open ('../Viewer.aspx','_blank');</script>");
                    

                }
            }
            catch (Exception ex)
            {

                lblError.Text = ex.Message+"\n"+"No se encontro el archivo";
            }

        }

        protected void BorrarDoc(string doc, string path)
        {
            string accion = "";
            string compania_id = Request.Cookies.Get("id_comp").Value;                       
            var file = Server.MapPath(path);
            try
            {
                if (System.IO.File.Exists(file))
                {
                    //Eliminar de carpeta
                    accion = clsHerramientaBD.ExecuteSql("DELETE FROM Table_Documentos WHERE Documento='" + doc + "' AND ID_compania='" + compania_id + "'");
                    //ELiminar de la base de datos
                    System.IO.File.Delete(file);

                    Response.Redirect(Request.RawUrl, true);

                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
            //Reload
        }

        protected void Borrar_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;

            string path = "", doc = "";
            switch (buttonId)
            {
                case "W9_borrar":
                    path = txtW9.Text;
                    doc = "W9";
                    break;
                case "AC_borrar":
                   path = txtAC.Text;
                    doc = "Acta constitutiva";

                    break;
                case "RFC_borrar":
                    path = txtRFC.Text;
                    doc = "RFC";

                    break;
                case "CURP_borrar":
                    path = txtCURP.Text;
                    doc = "CURP";

                    break;
                case "CNAP_borrar":
                    path = txtCNAP.Text;
                    doc = "Carta de no antecedentes penales";

                    break;
                case "CompDom_borrar":
                    path = txtCompDom.Text;
                    doc = "Comprobante de domicilio";
                    break;
                case "IRL_borrar":
                    path = txtIRL.Text;
                    doc = "Identificacion de representante legal";
                    break;
                case "PRL_borrar":
                    path = txtPRL.Text;
                    doc = "Poder de representante legal";
                    break;
                case "OP_borrar":
                    path = txtOP.Text;
                    doc = "Opinion positiva";
                    break;
                case "CTPAT_borrar":
                    path = txtCTPAT.Text;
                    doc = "Certificación C-TPAT";
                    break;
                case "OEA_borrar":
                    path = txtOEA.Text;
                    doc = "Certificación OEA";
                    break;
                default:
                    break;
            }

            if(path!= "" && doc != "")
            {
                BorrarDoc(doc, path);
            }
            else
            {
                lblError.Text = "No se encontró el archivo";
            }

        }

        protected void AC_borrar_Click(object sender, EventArgs e)
        {
            Response.Write("No hace anda ");
        }


        protected string GetID()
        {
            FormsIdentity ident = User.Identity as FormsIdentity;
            FormsAuthenticationTicket authTicket = ident.Ticket;

            string userInfo = authTicket.UserData;
            string[] info = userInfo.Split(';');
            string id = info[1];

            return id;
        }

    }
}