﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImformacionCompania.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.ImformacionCompania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../JsClienteNuevo.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <div class="col">
                <div class="col-auto">
                    <label for="cbTipoDeRegistro" name="cbTipoDeRegistro" class="form-label"> Tipo de registro</label>
                </div>
                <div class="col-3">
                    <select id="cbTipoDeRegistro" class="form-select">
                        <option value="0">Cliente</option>
                        <option value="1">Proveedor</option>
                    </select>
                </div>
            </div>
        </div>
        
        <br />
        <!-- Informacion de compañia-->
        <fieldset>

            <legend style="font-size:25px;">Información de la compañia</legend>

            <div class="container" id="contenedorComp">
                <div class="row">
                    <div class="col">                       
                        <label for="txtNombreCompania" style="margin-bottom: 9px;">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompania" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtNombrCom" class="form-label">Nombre comercial:</label>
                        <input type="text" name="name" value="" id="txtNombrCom" class="form-control" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col" style="margin-top: -8px;">
                        <label for="cbTipoDePersona" name="cbTipoDePersona" class="form-label"> Tipo de persona</label>
                        <select id="cbTipoDePersona" class="form-select">
                            <option value="">...</option>
                            <option value="0" >Moral</option>
                            <option value="1" >Fisica</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="txtRfc">RFC:</label>
                        <input type="text" name="name" value="" id="txtRfc" class="form-control " style="font-size:16px;" />
                    </div>
                    <div class="col">
                        <label for="txtAnosNegocio">CURP:</label>
                        <input type="number" name="txtCURP" value="" id="txtCURP" class="form-control" style="font-size:16px;" />
                    </div>
                    <div class="col">
                        <label for="txtAnosNegocio">Años de negocio:</label>
                        <input type="number" name="txtAnosNegocio" value="" id="txtAnosNegocio" class="form-control"  />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-8">
                        <label for="txtDirecFiscal">Dirección fiscal:</label>
                        <input type="text" name="txtDirecFiscal" value="" class="form-control"  />
                    </div>
                    <div class="col-4">
                        <label for="txtCP">CP:</label>
                        <input type="text" name="name" value="" id="txtCP" class="form-control" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col">
                        <label for="cbPais">Pais:</label>
                        <select id="cbPais" class="form-select">
                            <option value="...">...</option>
                        </select>
                        
                    </div>
                    <div class="col">
                        <label for="cboEstado">Estado:</label>
                        <select id="cboEstado" class="form-select">
                            <option value="value">...</option>
                        </select>
                        
                    </div>
                    <div class="col">
                        <label for="cbCiudad">Ciudad:</label>
                        <select id="cbCiudad" class="form-select">
                            <option value="value">...</option>
                        </select>
                    </div>

                </div>
                <br />
            </div>
            <hr />
            <!--Contactos-->
            <div class="row">                
                <!--Datos de facturacion-->
                <div class="col">
                    <div class="card border-warning">
                        <div class="card-header cabezal">
                            <div class="col">
                                <h6 style="font-weight:bold;">Datos de facturacion</h6>

                                <div class="form-check ">
                                    <input class="form-check-input" type="checkbox" value="" id="chkDireccionIgual">
                                    <label class="form-check-label" for="chkDireccionIgual" style="font-size:13px;">
                                        Direccion de facturacion es igual a direccion fiscal
                                    </label>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="txtDirecFacturacion">Dirección facturación:</label>
                                    <textarea id="txtDirecFacturacion" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="cbPaisFact">Pais:</label>
                                    <select id="cbPaisFact" class="form-select">
                                        <option value="value">...</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="cbEstadoFact">Estado:</label>
                                    <select id="cbEstadoFact" class="form-select">
                                        <option value="value">...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="cbCiudadFact">Ciudad:</label>
                                    <select id="cbCiudadFact" class="form-select">
                                        <option value="value">...</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="txtCPFacturacion">CP:</label>
                                    <input type="text" name="name" value="" id="txtCPFacturacion" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
                <!--Datos bancarios-->
                <div class="col">
                    <div class="card border-warning">
                            <h6 class="card-header cabezal"> Datos bancarios </h6>                          
                        <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <label for="cbMetodoPago">Metodo de pago</label>
                                        <select id="cbMetodoPago" class="form-select">
                                            <option value="">...</option>
                                            <option value="PUE">PUE - Pago en una sola exhibición</option>
                                            <option value="PPD">PPD - Pago Diferido</option>

                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="cbFormaPago">Forma de pago</label>
                                        <select id="cbFormaPago" class="form-select">
                                            <option value="">...</option>

                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="cbMoneda">Moneda</label>
                                        <select id="cbMoneda" class="form-select">
                                            <option value="MXN">MXN</option>
                                            <option value="USD">USD</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="cbUsoCFDI">Uso de CFDI</label>
                                        <select id="cbUsoCFDI" class="form-select">
                                            <option value="">...</option>
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtBanco">Nombre del banco</label>
                                        <input type="text" name="txtBanco" value="" id="txtBanco" class="form-control" />
                                    </div>
                                    <div class="col">
                                        <label for="txtBanco">RFC del banco</label>
                                        <input type="text" name="txtBancoRFC" value="" id="txtBanco" class="form-control" />
                                    </div>
                                </div>
                                <div class="row" style="padding-bottom: 1.3rem;">
                                    <div class="col">
                                        <label for="txtNoCuenta">Numero de cuenta</label>
                                        <input type="text" name="txtNoCuenta" value="" id="txtNoCuenta" class="form-control" />
                                    </div>
                                    <div class="col">
                                        <label for="txtClaveBancaria">Clave bancaria</label>
                                        <input type="text" name="txtClaveBancaria" value="" id="txtClaveBancaria" class="form-control" maxlength="18" />
                                    </div>
                                </div>
                        </div>
                    </div>

                </div>
                
            </div>
            <br /><br />
                  <div class="row">
                      <!--Datos de contacto-->
                      <div class="col">                         
                              <div id="contactoCompania" class="card border-warning">
                                  <h6 class="card-header cabezal">Datos de contacto</h6>
                                  <div class="card-body">

                                      <div class="row">
                                          <div class="col">
                                              <label for="txtNombrCont">Nombre:</label>
                                              <input type="text" name="name" value="" id="txtNombrCont" class="form-control" style="font-size:16px;"required />
                                          </div>
                                          <div class="col">
                                              <label for="txtpustoCont">Puesto:</label>
                                              <input type="text" name="name" value="" id="txtpuestoCont" class="form-control" style="font-size:16px;"required />
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col">
                                              <label for="txtCorreoCont">Correo:&nbsp;</label>
                                              <input type="email" name="name" value="" id="txtCorreoCont" class="form-control" style="font-size:16px;" required/>
                                          </div>

                                      </div>

                                      <div class="row">
                                          <div class="col-5">
                                              <label for="txtTelCont">Telefono:</label>
                                              <input type="tel" name="name" value="" id="txtTelCont" class="form-control" style="font-size:16px;" required/>
                                          </div>
                                          <div class="col-3">
                                              <label for="txtFaxCont">Extensión:</label>
                                              <input type="number" name="name" value="" id="txtExtCont" class="form-control" style="font-size:16px;"required />
                                          </div>

                                          <div class="col-4">
                                              <label for="txtCelCont">Celular:</label>
                                              <input type="tel" name="name" value="" id="txtCelCont" class="form-control" style="font-size:16px;" required />
                                          </div>
                                      </div><br />
                                  </div>
                                  <div class="card-footer">
                                      <div class="row">
                                          <div class="col-3">
                                              <input type="submit"  class="btn btn-warning btn-sm" id="btnContactoCompañia" name="btnContactoCompañia" value="Agregar contacto" />

                                          </div>
                                      </div>
                                  </div>
                              </div>
                      </div>
                      <div class="col">
                          <table class="table " id="tContactoCom">
                              <caption>Contactos registrados</caption>
                              <thead class="cabezal">
                                  <tr>
                                      <th>Nombre</th>
                                      <th>Puesto</th>
                                      <th>Correo</th>                                      
                                      <th>Telefono</th>
                                      <th>Ext</th>
                                      <th>Celular</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                  </tr>
                              </tbody>
                              <tfoot></tfoot>

                          </table>
                      </div>
                  </div>
            <hr />
        </fieldset>

        <!--Facturacion-->
        <fieldset>
            <div class="row">
                <div class="col">
                    <div class="card border-warning">

                        <h6 class="card-header cabezal"> Datos de contacto de facturacion </h6>


                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <label for="txtNombrContFacturacion">Nombre:</label>
                                    <input type="text" name="name" value="" id="txtNombrContFacturacion" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="txtCorreoContFacturacion">Correo:</label>
                                    <input type="email" name="name" value="" id="txtCorreoContFacturacion" class="form-control" />
                                </div>
                                
                            </div>

                            <div class="row">
                                <div class="col-5">
                                    <label for="txtTelContFacturacion">Telefono:</label>
                                    <input type="tel" name="name" value="" id="txtTelContFacturacion" class="form-control" />
                                </div>
                                <div class="col-3">
                                    <label for="txtFaxContFacturacion">Extension:</label>
                                    <input type="number" name="name" value="" id="txtFaxContFacturacion" class="form-control" />
                                </div>
                                <div class="col-4">
                                    <label for="txtCelContFacturacion">Celular:</label>
                                    <input type="tel" name="name" value="" id="txtCelContFacturacion" class="form-control" />
                                </div>
                            </div>
                        </div><br />
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-3">
                                    <input type="submit" class="btn btn-warning btn-sm" id="btnContactoFact" name="btnContactoFact" value="Agregar contacto" />

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col">
                    <table class="table " id="tContactoComFact">
                        <caption>Contactos registrados</caption>
                        <thead class="cabezal">
                            <tr>
                                <th>Nombre</th>
                                <th>Puesto</th>
                                <th>Telefono</th>
                                <th>Ext</th>
                                <th>Celular</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>

                    </table>
                </div>
            </div>

        </fieldset>
        <br />
    </div>
   
    <script type="text/javascript">
        fillComboPais($("#cbPais"));
        fillComboPais($("#cbPaisFact"));
        fillFP();
    </script>

</asp:Content>
