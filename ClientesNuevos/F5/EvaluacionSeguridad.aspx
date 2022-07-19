﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluacionSeguridad.aspx.cs" Inherits="ClientesNuevos.cliente.F5.EvaluacionSeguridadRiesgoBussinessPartner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="container" class="container" style="width: 100%">
        

        <div class="row">
            <div class="col">
            <div id="formulario" class="card">
                <h6 style="text-align:center;" class="card-header cabezal">Cuestionario C-TPAT para SOCIO COMERCIAL </h6>

                <div class="card-body">
                <section id="portada">

                    <form action="/" method="post">
                        <div class="row ">
                            <div class="col-auto backgroudtag">
                                1.0.0
                            </div>

                            <div class="col-auto">
                                <h6 style="padding-top:10px;">Nuestra compañia <strong>ya esta certificada</strong>  en C-TPAT y nuestro numero SVI es:</h6>

                            </div>
                            <div class="col-4">
                                <input type="text" class="form-control " id="txt100" />
                            </div>

                        </div>
                        <hr />
                        <!-- 2 -->
                        <div class=" row">
                            <div class="col-auto backgroudtag">
                                1.2.0
                            </div>


                            <div class="col">
                                <h6>Nuestra Compañía <strong>ES</strong> elegible para ser miembro C-TPAT</h6>
                                <div class="row">

                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="si120" value="" name="radioElgible" />
                                        <label class="form-check-label" for="si120">SI</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NO120" value="" name="radioElgible" />
                                        <label class="form-check-label" for="NO120">NO</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NA120" value="" name="radioElgible" />
                                        <label class="form-check-label" for="NA120">N/A</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class=" row">
                            <div class="col-auto backgroudtag">
                                1.3.0
                            </div>
                            <div class="col">
                                <div class="row">
                                    <h6>Es miembro o está en proceso de ser Miembro C-TPAT</h6>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="si130" value="si" name="radioMiembro" />
                                        <label class="form-check-label" for="si130">SI</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NO130" value="no" name="radioMiembro" />
                                        <label class="form-check-label" for="NO130">NO</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NA130" value="N/A" name="radioMiembro" />
                                        <label class="form-check-label" for="NA130">N/A</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <section id="seccionSI" style="display: none; background-color:#EEE8E7;">
                            <div class="row">
                                <div class="col-auto backgroudtag">
                                    1.3.1&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col">
                                    <h6>Si la respuesta a la pregunta 1.3.0 es <strong>SI</strong> :</h6>
                                </div>
                            </div>
                            <hr style="width: 70%;">
                            <div class="row">
                                <div class="col-auto backgroudtag">
                                    1.3.1.1
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col-auto">
                                            <h6>Número de Cuenta C-TPAT:</h6>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" class="form-control" id="txt1311" />
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <hr style="width: 70%;">
                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    1.3.1.2
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col-auto">
                                            <h6>Status de Cuenta:</h6>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" class="form-control" id="txt1312" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <hr style="width: 70%;">
                            <div class="row">
                                <div class="col-auto backgroudtag">
                                    1.3.1.3
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col-auto">
                                            <h6>Estatus de revisión de su perfil de seguridad:</h6>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" class="form-control" id="txt1313" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />

                        </section>

                        <section id="seccionNO" style="display: none; background-color:#EEE8E7;">
                            <div class="row">
                                <div class="col-auto backgroudtag">
                                    1.3.2&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="col">
                                    <h6>Si la respuesta a la pregunta 1.3.0 es <strong>NO o N/A</strong> :</h6>
                                </div>
                            </div>
                            <hr style="width: 50%;">

                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    1.3.2.1
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="row">
                                            <div class="col">
                                                <h6>No esta interesada en aplicar por el momento</h6>
                                            </div>
                                        </div>
                                        <div class="row row-cols-auto">
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="si1321" value="" name="radio1321" />
                                                <label class="form-check-label" for="si1321">SI</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NO1321" value="" name="radio1321" />
                                                <label class="form-check-label" for="NO1321">NO</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NA1321" value="" name="radio1321" />
                                                <label class="form-check-label" for="NA1321">N/A</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr style="width: 50%;"/>

                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    1.3.2.2
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <h6>Esta interesada y desea recibir más información</h6>
                                        <div class="row row-cols-auto">

                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="si1322" value="" name="radio1322" />
                                                <label class="form-check-label" for="si1322">SI</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NO1322" value="" name="radio1322" />
                                                <label class="form-check-label" for="NO1322">NO</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NA1322" value="" name="radio1322" />
                                                <label class="form-check-label" for="NA1322">N/A</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <hr />
                        </section>

                        <div class=" row">
                            <div class="col-auto backgroudtag">
                                1.4.0
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="row">
                                        <div class="col">
                                            <h6>Nuestra compañía comprende las normas mínimas de Seguridad C-TPAT y certifica que sus operaciones están acordes con dichas normas.</h6>
                                        </div>
                                    </div>
                                    <div class="row row-cols-auto">
                                        <div class="col">
                                            <input type="radio" class="form-check-input" id="si140" value="" name="radio140" />
                                            <label class="form-check-label" for="si130">SI</label>
                                        </div>
                                        <div class="col">
                                            <input type="radio" class="form-check-input" id="NO140" value="" name="radio140" />
                                            <label class="form-check-label" for="NO130">NO</label>
                                        </div>
                                        <div class="col">
                                            <input type="radio" class="form-check-input" id="NA140" value="" name="radio140" />
                                            <label class="form-check-label" for="NA130">N/A</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-auto backgroudtag">
                                1.5.0
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <h6>Nuestra compañía <strong>NO ES ELEGIBLE PARA SER MIEMBRO C_TPAT </strong>pero está de acuerdo en cumplir con los lineamientos de seguridad</h6>
                                    </div>

                                </div>
                                    <div class="row">
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="si150" value="" name="radio150" />
                                        <label class="form-check-label" for="si150">SI</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NO150" value="" name="radio150" />
                                        <label class="form-check-label" for="NO150">NO</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NA150" value="" name="radio150" />
                                        <label class="form-check-label" for="NA150">N/A</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr />

                        <div class=" row">
                            <div class="col-auto backgroudtag">
                                1.6.0
                            </div>
                            <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <h6>¿Esta usted respondiendo por todas las nnidades de negocio de su compañía?</h6>
                                        </div>
                                    </div>                                        
                                    
                                    <div class="row">
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="si160" value="" name="radio160" />
                                        <label class="form-check-label" for="si130">SI</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NO160" value="" name="radio160" />
                                        <label class="form-check-label" for="NO130">NO</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="radio" class="form-check-input" id="NA160" value="" name="radio160" />
                                        <label class="form-check-label" for="NA130">N/A</label>
                                    </div>
                                    </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-10"></div>
                            <div class="col-2">
                                <a href="Autoevaluacion/autoevaluacion.aspx" class="btn  btn-success">Continuar</a>
                               <%-- <input type="button" name="btnContinuar" value="Continuar" class="miBoton" id="btnContinuar" />--%>
                            </div>
                        </div>
                    </form>
                </section>

                </div>
            </div>
            </div>
        </div>
 

                
   </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $('#btnContinuar').click(function () {

                

            });

        });
        

        $('input[type=radio][name=radioMiembro]').change(function () {
            if (this.value == 'si') {
                $('#seccionSI').show();
                $('#seccionNO').hide();
            }
            else if (this.value == 'no' || this.value == 'N/A') {
                $('#seccionNO').show();
                $('#seccionSI').hide();
                
            }
        });

    </script>

</asp:Content>
