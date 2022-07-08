﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TipoServicioProductos.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.TipoServicioProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <link href="../../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>

    <script src="../JsClienteNuevo.js"></script>
    <script src="../JS/tiposervicioJS.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <div class="row" id="ServicioRqurido">
            <h3>Tipo de servicio requerido</h3>

            <section id="Almacenaje">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkAlmacenaje">
                            <label class="form-check-label" for="chkAlmacenaje">
                                Almacenaje
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row" id="opcionesAlmacenaje" style="padding-left:40px; display:none;">
                    <ul style="list-style:none">
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkADAlmacenaje">
                                <label class="form-check-label" for="chkADAlmacenaje">
                                    Almacen de deposito
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkIBAlmacenaje">
                                <label class="form-check-label" for="chkIBAlmacenaje">
                                    In-bonds
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkMPAlmacenaje">
                                <label class="form-check-label" for="chkMPAlmacenaje">
                                    Material peligroso
                                </label>
                            </div>
                            <div>
                                <ul style="list-style:none; display:none;" id="MPAlmacenaje">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosAlmacenaje">
                                            <label class="form-check-label" for="chkMPQuimicosExpo">
                                                Quimicos
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonAlmacenaje">
                                            <label class="form-check-label" for="chkMPCarbonExpo">
                                                Carbon
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkTransbordoAlmacenaje">
                                <label class="form-check-label" for="chkTransbordoAlmacenaje">
                                    Transbordo
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

            <section id="Exportacion">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkExportacion">
                            <label class="form-check-label" for="chkExportacion">
                                Exportación
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-4" id="opcionesExpo" style="padding-left:40px; display:none;">
                    <ul style="list-style:none">
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkExpoCS">
                                <label class="form-check-label" for="chkExpoCS">
                                    Carga seca
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkFrrExpo">
                                <label class="form-check-label" for="chkFrrExpo">
                                    Ferrocarril
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkIBExpo">
                                <label class="form-check-label" for="chkIBExpo">
                                    In-bonds
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkMPExpo">
                                <label class="form-check-label" for="chkMPExpo">
                                    Material peligroso
                                </label>
                            </div>
                            <div>
                                <ul style="list-style:none; display:none;" id="MPExpo">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosExpo">
                                            <label class="form-check-label" for="chkMPQuimicosExpo">
                                                Quimicos
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonExpo">
                                            <label class="form-check-label" for="chkMPCarbonExpo">
                                                Carbon
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>
            </section>

            <section id="Importacion">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkImportacion">
                            <label class="form-check-label" for="chkImportacion">
                                Importación
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row row-cols-4" id="opcionesImpo" style="padding-left:40px; display:none;">
                    <ul style="list-style:none">
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkImpoCS">
                                <label class="form-check-label" for="chkImpoCS">
                                    Carga seca
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkFrrImpo">
                                <label class="form-check-label" for="chkFrrImpo">
                                    Ferrocarril
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkIBImpo">
                                <label class="form-check-label" for="chkIBImpo">
                                    In-bonds
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkMPImpo">
                                <label class="form-check-label" for="chkMPImpo">
                                    Material peligroso
                                </label>
                            </div>
                            <div>
                                <ul style="list-style:none; display:none" id="MPImpo">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosImpo">
                                            <label class="form-check-label" for="chkMPQuimicosImpo">
                                                Quimicos
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonImpo">
                                            <label class="form-check-label" for="chkMPCarbonImpo">
                                                Carbon
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>

            </section>

            <section id="RentaEquipo">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkRE">
                            <label class="form-check-label" for="chkRE">
                                Renta de equipo
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row" id="opcionesRenta" style="padding-left:40px; display:none;">
                    <ul style="list-style:none">
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkRntaCajas">
                                <label class="form-check-label" for="chkExpoCS">
                                    Cajas
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkRentaSD">
                                <label class="form-check-label" for="chkExpoCS">
                                    Servicio dedicado
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

            <section id="Transportacion">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkTransportacion">
                            <label class="form-check-label" for="chkTransportacion">
                                Transportación
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row " id="opcionesTransport" style="padding-left:40px; display:none;">
                    <ul style="list-style:none">
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkTransportCS">
                                <label class="form-check-label" for="chkTransportCS">
                                    Carga seca
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkIBTransport">
                                <label class="form-check-label" for="chkIBTransport">
                                    In-bonds
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="chkMPTransport">
                                <label class="form-check-label" for="chkMPTransport">
                                    Material peligroso
                                </label>
                            </div>
                            <div>
                                <ul style="list-style:none; display:none;" id="MPTransport">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosTransport">
                                            <label class="form-check-label" for="chkMPQuimicosTransport">
                                                Quimicos
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonTransport">
                                            <label class="form-check-label" for="chkMPCarbonTransport">
                                                Carbon
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    </ul>
                </div>
            </section>

            <section id="AgnciaAduanalMexicana">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkAgnciaAduanalMexicana">
                            <label class="form-check-label" for="chkAgnciaAduanalMexicana">
                                Agencia aduanal mexicana
                            </label>
                        </div>
                    </div>
                </div>
            </section>

            <section id="Logistica">
                <div class="row">
                    <div class="col">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="chkLogistica">
                            <label class="form-check-label" for="chkLogistica">
                                Logistica
                            </label>
                        </div>
                    </div>
                </div>
            </section>
            <section id="Otro">
                <div class="row">
                    <div class="col">
                        <input class="form-check-input" type="checkbox" value="" id="chkOtro">
                        <label class="form-check-label" for="chkOtro">
                            Otro
                        </label>
                    </div>

                </div>
                <div class="row " id="textoOtro" style="padding-left:40px; display:none;">
                    <label class="form-check-label" for="chkOtro">¿Cúal?</label>
                    <div class="col-3">
                        <input type="text" name="txtOtro" id="txtOtro" value="" class="form-control" />
                    </div>
                </div>
            </section>
        </div>
        <hr />
        <div class="row" id="InfoProd">
            <fieldset>
                <legend style="font-size:25px;">Información de productos</legend>

                <table class="table table-responsive table-hover">
                    <thead>
                        <tr>
                            <th>Descripción de mercancia</th>
                            <th>Comentarios</th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody id="tbodyProductos">
                    </tbody>
                    <tfoot>
                        <tr>
                        </tr>

                    </tfoot>
                </table>
            </fieldset>
        </div>
    </div>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
    <script type="text/javascript">

    </script>
</body>

</asp:Content>
