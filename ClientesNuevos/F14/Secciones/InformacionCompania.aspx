﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCompania.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.ImformacionCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Información</title>


    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">

            <div class="col">
                <div class="col-auto">
                    <asp:Label ID="lblRegistro" runat="server" Text="Tipo de registro" CssClass="form-label"></asp:Label>
                </div>
                <div class="col-3">
                    <select id="cbTipoDeRegistro" class="form-select" hidden>
                        <option value="" selected disabled>...</option>
                        <option value="cliente">Cliente</option>
                        <option value="proveedor">Proveedor</option>
                    </select>

                    <asp:DropDownList ID="cbTipoRegistro" runat="server" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="cbTipoRegistro_SelectedIndexChanged">
                        <asp:ListItem Text="Cliente" Value="cliente" ID="cbClient" />
                        <asp:ListItem Text="proveedor" Value="proveedor" ID="cbProv" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col">
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 0%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <div id="wizard" class="form_wizard wizard_horizontal">
                    <ul class="wizard_steps">
                        <li>
                            <asp:HyperLink ID="step1" runat="server">
                                <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc1" runat="server" Text="Paso 1"></asp:Label>
                                <br />
                                <asp:Label ID="lblsub1" runat="server" Text="Información de la compañia" Font-Size="Smaller"></asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step2" runat="server" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                                <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc2" runat="server" Text="Paso 2"></asp:Label>
                                <br />
                                <asp:Label ID="lblsub2" runat="server" Text="Información de agentes aduanales" Font-Size="Smaller"></asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx">
                                <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc3" runat="server" Text="Paso 3"></asp:Label>
                                <br />
                                <asp:Label ID="lblsub3" runat="server" Text="Informacion de compañia filial" Font-Size="Smaller"></asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
                                <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                                <asp:Label ID="lblDesc4" runat="server" Text="Paso 4"></asp:Label>
                                <br />
                                <asp:Label ID="lblsub4" runat="server" Text="Tipo de servicio requerido" Font-Size="Smaller"></asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
                                <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc5" runat="server" Text="Paso 5"></asp:Label>
                                <br />
                                <asp:Label ID="lblsub5" runat="server" Text="Acreditación en programa de seguridad" Font-Size="Smaller"></asp:Label>
                            </asp:HyperLink>
                        </li>
                    </ul>
                </div>
                <div id="wizard2" class="form_wizard wizard_horizontal" hidden>
                    <ul class="wizard_steps">
                        <li>
                            <a href="#" class="selected">
                                <span class="step_no">1</span>
                                <span class="step_descr">Paso 1<br />
                                    <small>Información de la compañia</small>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="InformacionCadenaSuministro.aspx" class="">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

        <br />
        <!------------------------------------------------- Informacion de compañia------------------------------->
        <fieldset>
            <div class="card border-primary">
                <div class="card-header cabezal">
                    <asp:Label ID="lblTitulo_infoCom" runat="server" Text="Información de la compañia"></asp:Label>
                </div>
                <div class="card-body">
                    <div id="contenedorComp">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblNombreCompania" runat="server" Text="Nombre de la compañia:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombreCompania" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtNombreCompania"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblNombreComercial" runat="server" Text="Nombre comercial:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombrCom" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtNombrCom"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <br />
                        <div class="row">

                            <div class="col">
                                <asp:Label ID="lblTipoPersona" runat="server" Text="Tipo de persona:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddTipoDePersona" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddTipoDePersona_SelectedIndexChanged">
                                    <asp:ListItem Text="Extranjero" Value="2" />
                                    <asp:ListItem Text="Moral" Value="0" />
                                    <asp:ListItem Text="Fisica" Value="1" />
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblRFC" runat="server" Text="RFC:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtRfc"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblCURP" runat="server" Text="CURP" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="col">
                                <asp:Label ID="lblAnosNegocio" runat="server" Text="Años de negocio:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtAnosNegocio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtAnosNegocio"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-8">
                                <asp:Label ID="lblDirecFiscal" runat="server" Text="Dirección fiscal:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtDirecFiscal" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtDirecFiscal"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-4">
                                <asp:Label ID="lblCP" runat="server" Text="CP:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtCP"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblPais" runat="server" Text="Pais:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddPais" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPais_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblEstado" runat="server" Text="Estado:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddEstado" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged">
                                    <asp:ListItem Text="..." Value="0" Enabled="false" />
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblCiudad" runat="server" Text="Ciudad:" CssClass="form-label"></asp:Label>

                                <asp:DropDownList ID="ddCiudad" runat="server" AutoPostBack="True" CssClass="form-select" OnSelectedIndexChanged="ddCiudad_SelectedIndexChanged"></asp:DropDownList>

                                <asp:Button ID="btnPrueba" runat="server" Text="prueba" OnClick="btnPrueba_Click" Visible="false" />
                                <asp:Label ID="lblresultado" runat="server" Text="Label" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <hr />

            <div class="row">
                <!--------------------------------------------Datos de facturacion--------------------------------------------------------->
                <div class="col">
                    <div class="card border-primary">
                        <div class="card-header cabezal">
                            <div class="col">
                                <h6 style="font-weight: bold;">
                                    <asp:Label ID="lblTitulo_DatosFra" runat="server" Text="Datos de facturacion"></asp:Label>
                                </h6>

                                <div class="form-check ">
                                    <asp:CheckBox ID="chkDireccionIgual" runat="server" OnCheckedChanged="chkDireccionIgual_CheckedChanged" AutoPostBack="True" />
                                    <asp:Label ID="lblDireccionIgual" runat="server" Text="Direccion de facturacion es diferente a direccion fiscal" Font-Size="13px" CssClass="form-check-label"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pFra" Enabled="False" BackColor="#E9ECEF">
                            <div class="card-body" id="DirFra">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblDirecFacturacion" runat="server" Text="Dirección facturación:" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtDirecFacturacion" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblPaisFact" runat="server" Text="Pais:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddPaisFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddPaisFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblEstadoFra" runat="server" Text="Estado:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddEstadoFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblCiudadFact" runat="server" Text="Ciudad:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddCiudadFra" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblCPFact" runat="server" Text="CP:" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtCPFra" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <br />
                                </div>

                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <!-- ============================Datos bancarios======================================= -->
                <div class="col">
                    <div class="card border-primary">
                        <h6 class="card-header cabezal">
                            <asp:Label ID="lblTitulo_DatosBancarios" runat="server" Text="Datos bancarios"></asp:Label>
                        </h6>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-5">
                                    <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de pago:" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddMetodoPago" runat="server" CssClass="form-select" AutoPostBack="False">
                                        <asp:ListItem Text="..." Value="0" Selected="False" />
                                        <asp:ListItem Text="PUE-Pago en Una sola Exhibición" Value="PUE" Selected="False" />
                                        <asp:ListItem Text="PPD-Pago en Parcialidades o Diferido" Value="PPD" Selected="False" />
                                    </asp:DropDownList>

                                </div>
                                <div class="col-4">
                                    <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago:" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddFormaPago" runat="server" CssClass="form-select">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-3">
                                    <asp:Label ID="lblMoneda" runat="server" Text="Moneda"></asp:Label>
                                    <asp:DropDownList ID="ddMoneda" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="..." Value="x" />
                                        <asp:ListItem Text="MXN" Value="MXN" />
                                        <asp:ListItem Text="USD" Value="USD" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblUsoCFDI" runat="server" Text="Uso de CFDI:" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddUsoCFDI" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Seleccione el regimen al que pertenece" Value="" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblBanco" runat="server" Text="Nombre del banco:"></asp:Label>
                                    <asp:TextBox ID="txtBanco" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtBanco"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblRFCBanco" runat="server" Text="RFC del banco:"></asp:Label>
                                    <asp:TextBox ID="txtBancoRFC" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtBancoRFC"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 1.3rem;">
                                <div class="col">
                                    <asp:Label ID="lblNoCuenta" runat="server" Text="Numero de cuenta:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtNoCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtNoCuenta"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblClaveBancaria" runat="server" Text="Clabe bancaria:"></asp:Label>
                                    <asp:TextBox ID="txtClaveBancaria" runat="server" CssClass="form-control" MaxLength="18"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtClaveBancaria"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                    <asp:Button Text="pruebaBanco" runat="server" ID="btnBanco" OnClick="btnBanco_Click" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <!-- ==============================================Datos de contacto=========================================================== -->
                <div class="col-6">
                    <div id="contactoCompania" class="card border-primary">
                        <h6 class="card-header cabezal">
                            <asp:Label ID="lblTitulo_DatosContacto" runat="server" Text="Datos de contacto"></asp:Label>

                            <asp:Label ID="pInfo_es" runat="server" Text="">
                                 <span><i class="bi bi-question-circle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom"
                                    title="Llene los campos necesarios y haga clic en el boton 'Registrar contacto' "></i></span>
                            </asp:Label>
                            
                            <asp:Label ID="pInfo_en" runat="server" Visible="false">
                                <span><i class="bi bi-question-circle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom"
                                    title="Fill the requested fields and then click on the button 'Add contact' "></i></span>
                            </asp:Label>
                        </h6>
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblNombreCont" runat="server" Text="Nombre:"></asp:Label>
                                    <input type="text" value="" id="txtNombrCont" class="form-control" />
                                    <span id="sNombre" style="color: red;"></span>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblpuestoCont" runat="server" Text="Puesto:"></asp:Label>
                                    <input type="text" value="" id="txtpuestoCont" class="form-control" />
                                    <span id="sPuesto" style="color: red;"></span>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblCorreoCont" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
                                    <input type="email" value="" id="txtCorreoCont" class="form-control" />
                                    <span id="sCorreo" style="color: red;"></span>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="cbContactoFactura">
                                        <asp:Label ID="lblFactura" runat="server" Text="Enviar factura" CssClass="form-check-label"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-5">
                                    <asp:Label ID="lblTelCont" runat="server" Text="Telefono:" CssClass="form-label"></asp:Label>
                                    <input type="tel" value="" id="txtTelCont" class="form-control" />
                                    <span id="sTelefono" style="color: red;"></span>


                                </div>
                                <div class="col-3">
                                    <asp:Label ID="lblExtension" runat="server" Text="Extensión:"></asp:Label>
                                    <input type="number" value="" id="txtExtCont" class="form-control" />

                                </div>

                                <div class="col-4">
                                    <asp:Label ID="lblCelCont" runat="server" Text="Celular:"></asp:Label>
                                    <input type="tel" name="name" value="" id="txtCelCont" class="form-control" />
                                    <span id="sCelular" style="color: red;"></span>

                                </div>
                            </div>
                            <br />
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col"></div>
                                <div class="col">
                                    <asp:Button ID="btnContact" runat="server" Text="Registrar contacto" CssClass="btn btn-primary" OnClientClick="return false;" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table  table-sm" id="tContactoCom">
                                <caption>
                                    <asp:Label ID="lbl_tCaption" runat="server" Text="Contactos registrados"></asp:Label>
                                </caption>
                                <thead class="cabezal">
                                    <tr>
                                        <th hidden></th>
                                        <th>
                                            <asp:Label ID="lbl_tNombre" runat="server" Text="Nombre"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lbl_tPuesto" runat="server" Text="Puesto"></asp:Label>

                                        </th>
                                        <th>
                                            <asp:Label ID="lbl_tCorreo" runat="server" Text="Correo"></asp:Label>
                                        </th>
                                        <th>
                                            <asp:Label ID="lbl_tTel" runat="server" Text="Telefono"></asp:Label>

                                        </th>
                                        <th>Ext</th>
                                        <th>
                                            <asp:Label ID="lbl_tCel" runat="server" Text="Celular"></asp:Label>

                                        </th>
                                        <th>
                                            <asp:Label ID="lbl_tFra" runat="server" Text="Fra."></asp:Label>
                                        </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="table-bordered border-primary">
                                </tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>


        <br />
        <hr />
        <div class="row">
            <br />
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUserControl" runat="server">

                    <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalOpciones">
                    ojo
                </button>--%>
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary" OnClick="btnHome_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <%--<button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>--%>
                    <%--<asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-success" OnClick="btnNext_Click" UseSubmitBehavior="False" />--%>

                    <asp:LinkButton ID="bntNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-primary">
                        <asp:Label ID="lbl_btnNext" runat="server" Text="Siguiente"></asp:Label><i class="bi bi-chevron-right"></i> </asp:LinkButton>

                </asp:Panel>

                <asp:Panel ID="pAdminControl" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminBack_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminH_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <asp:LinkButton ID="btnAdinSave" runat="server" OnClick="btnAdinSave_Click" CssClass="btn btn-success">Editar<i class="bi bi-chevron-right"></i> </asp:LinkButton>

                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminBack_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Atras"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>&nbsp;&nbsp;
                </asp:Panel>
            </div>
            <br />
        </div>


        <!--=========Modal=============================================================================================================================
        <div class="modal fade" tabindex="-1" id="modalOpciones" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="bi bi-info-circle"></i> Esta por terminar la primer parte del registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>¿Desea continuar con el registro?</p>
                        <p>Si selecciona "Guardar y contnuar" podrá seguir con el registro</p>
                        <p>Si selecciona "Guardar y salir" será enviado al inicio</p>
                        
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSiguiente" runat="server" Text="Guardar y continuar" CssClass="btn btn-primary" />
                        <asp:Button ID="btnSalir" runat="server" Text="Guardar y salir" CssClass="btn btn-primary" />

                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>

                    </div>
                </div>
            </div>
        </div>
        <!--=========Modal============================================================================================================================= -->

    </div>



    <script type="text/javascript">

        $(document).ready(() => {
            if (sessionStorage.getItem('ctipo') == 'proveedor') {
                $('#wizard2').prop('hidden', false);
            } else if (sessionStorage.getItem('ctipo') == 'cliente') {
                $('#wizard').prop('hidden', false);
            }


            CargarContactos();
        });

        fillComboPais($("#cbPais"));
        fillComboPais($("#cbPaisFact"));
        fillFP();


        $('#btnContinuar').click(function () {
            switch (sessionStorage.getItem('ctipo')) {
                case 'cliente':
                    window.location.href = 'AgentesAduanales.aspx';
                    break;
                case 'proveedor':
                    window.location.href = 'InformacionCadenaSuministro.aspx';

                    break;
                default:
                    alert('selecciona un tipo de registro');
                    break;
            }
        });

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
