<?php require_once "includes/admin_header.php";?>

<?php require_once("Modelos/Entradas.php");?> 
<?php require_once("Modelos/Comentarios.php");?>   
<?php require_once("Modelos/Usuarios.php");?> 
<?php require_once("Modelos/Categorias.php");?>  
 <?php

     $entrada= new Entradas();
     $comentario = new Comentarios();
     $usuarios = new Usuarios();
     $categoria = new Categorias();
  ?> 
   
   
    <div id="wrapper">


        <!-- Navigation -->
 
        <?php require_once "includes/admin_menu.php" ?>
        
   
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                      
                      <?php
                        
                         if(isset($_GET["m"])){
        
                            switch($_GET["m"]){

                                case "1":
                                ?>
                                 <h2 style="color:red">Fallo en la consulta en el listado de los registros de las entradas</h2>
                                <?php
                                break;
                                    
                                    
                                 case "2":
                                ?>
                                 <h2 style="color:red">Fallo en la consulta</h2>
                                <?php
                                break;
                            }

                        }
                        
                        
                       ?>
                       
                       
                        <h1 class="page-header">
                            
                            BACKEND - CMS
                            
                          <small><?php echo $_SESSION["nombre"];?></small>
                        </h1>

                    </div>
                </div>
       
                <!-- /.row -->
                
       
                <div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-file-text fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                      
                      
                         <div class="huge"><?php echo $entrada->get_numero_entradas();?></div>

                        <div>Entradas</div>
                    </div>
                </div>
            </div>
            <a href="entradas.php">
                <div class="panel-footer">
                    <span class="pull-left">Ver Detalles</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">

                                     
                                       <div class="huge"><?php echo $comentario->get_numero_comentarios();?></div>
           
                                      <div>Comentarios</div>
                                    </div>
                                </div>
                            </div>
                            <a href="comentarios.php">
                                <div class="panel-footer">
                                    <span class="pull-left">Ver Detalles</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">

                                        <div class="huge"><?php echo $usuarios->get_numero_usuarios();?></div>

                                       
                                        <div> Usuarios</div>
                                    </div>
                                </div>
                            </div>
                            <a href="usuarios.php">
                                <div class="panel-footer">
                                    <span class="pull-left">Ver Detalles</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-list fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">

                                     <div class="huge"><?php echo $categoria->get_numero_categorias();?></div>

                                   <div>Categor??as</div>
                                    </div>
                                </div>
                            </div>
                            <a href="categorias.php">
                                <div class="panel-footer">
                                    <span class="pull-left">Ver Detalles</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                                

            <div class="row">
                
                   
                  <script type="text/javascript">
                  google.charts.load('current', {'packages':['bar']});
                  google.charts.setOnLoadCallback(drawChart);

                  function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                     ['Data','Registros'],
                      <?php
                        
                        $element_text = ['Todas las entradas','Entradas publicadas','Entradas borrador','Comentarios','Comentarios pendiente','Usuarios','Suscriptores','Categorias'];
                        
                        $element_count = [$entrada->get_numero_entradas(),$entrada->get_numero_entradas_publicadas(),$entrada->get_numero_entradas_borrador(),$comentario->get_numero_comentarios(),$comentario->get_numero_comentarios_no_aprobado(),$usuarios->get_numero_usuarios(),$usuarios->get_numero_usuarios_suscriptor(),$categoria->get_numero_categorias()];
                        
                         
                           for($i=0;$i<8;$i++){
                               
                             echo "['$element_text[$i]'" . "," . "$element_count[$i]],";
                               
                           }
                        
                      ?>   
                      
                        
                    /*['Year', 'Sales'],
                      ['2014', 1000],*/
                      
                    ]);

                    var options = {
                      chart: {
                        title: '',
                        subtitle: '',
                      }
                    };

                    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                    chart.draw(data, google.charts.Bar.convertOptions(options));
                  }
                </script>
                   
                <div id="columnchart_material" style="width: auto; height: 500px;"></div>   
                  
            </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        
    
        <!-- /#page-wrapper -->
        
    <?php require_once "includes/admin_footer.php" ?>
