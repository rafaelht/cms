<?php

 
   /*validacion de cambio de status de la entrada con el checkbox*/

    if(isset($_POST["checkBoxArray"])){
        
        foreach($_POST["checkBoxArray"] as $checkBoxArray){
          
           $bulk_opciones = $_POST["bulk_opciones"];
            
            switch($bulk_opciones){
               
                case "publicado":
                    
                 $entrada->editar_status($checkBoxArray,$bulk_opciones);
                    
                break;
                    
                case "borrador":
                    $entrada->editar_status($checkBoxArray,$bulk_opciones);
                break;
                    
                case "eliminar":
                    
                    $entrada->eliminar_entrada($checkBoxArray);
                    
                break;
                    
                case "clonar":
                
                    /*seleccionamos los registros de acuerdo a los ids seleccionados en el checkbox luego lo recorremos en el ciclo for y luego insertamos los registros de acuerdo a los ids seleccionados*/
                    $datos=$entrada->get_entrada_por_id($checkBoxArray);
                    
                      for($i=0;$i<count($datos);$i++){
                          
                        $entrada->clonar_entrada($datos[$i]["id_categoria_entrada"],$datos[$i]["entrada_titulo"],$datos[$i][ "entrada_autor"],$datos[$i]["entrada_fecha"],$datos[$i]["entrada_imagen"],$datos[$i][ "entrada_contenido"],$datos[$i]["entrada_etiquetas"],$datos[$i]["entrada_comment_count"],$datos[$i]["entrada_status"],$datos[$i]["entrada_views_count"]);
                      }
                    
                break;
                    
            }
            
        }
        
    } 


/*****************************************/
   if(isset($_GET["eliminar"])){
       
       $id_entrada=$_GET["eliminar"];
       
       $entrada->eliminar_entrada($id_entrada);
   }
/*************************************************/

 /*Resetear el numero de vistas*/

     if(isset($_GET["resetear"])){
       
       $id_entrada=$_GET["resetear"];
       
       $entrada->resetear_vistas_entrada($id_entrada);
   }
    
?>
<h1 class="text-primary">Entradas</h1>

<form id="form" action="" method='post'>

<table class="table table-bordered table-hover">
              

        <div id="contenedor_opciones" class="col-xs-4">

        <select class="form-control" name="bulk_opciones" id="">
        <option value="">Seleccione Opciones</option>
        <option value="publicado">Publicar</option>
        <option value="borrador">Borrar</option>
        <option value="eliminar">Eliminar</option>
         <option value="clonar">Clonar</option>
        </select>

        </div> 

            
<div class="col-xs-4">

<input type="submit" name="submit" class="btn btn-success" value="Aplicar">

<a class="btn btn-primary" href="entradas.php?accion=add_entrada">A??adir Nuevo</a>

 </div>
         
   

                <thead>
                    <tr>
                <th><input id="selecciona_todo" type="checkbox"></th>
                        <th>Id</th>
                        <th>Usuarios</th>
                        <th>Titulo</th>
                        <th>Categor??a</th>
                        <th>Status</th>
                        <th>Imagen</th>
                        <th>Etiquetas</th>
                        <th>Comentarios</th>
                        <th>Fecha</th>
                        <th>Vista de Entrada</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                        <th>Vistas</th>
                    </tr>
                </thead>
                
                <tbody>
                      
               <?php for($i=0;$i<count($datos);$i++){?>
  
                    <tr>
                       <td><input class='checkBoxes' type='checkbox' name='checkBoxArray[]' value='<?php echo $datos[$i]["id_entrada"];?>'></td>
                       <td><?php echo $datos[$i]["id_entrada"];?></td>
                       <td><?php echo $datos[$i]["entrada_autor"];?></td>
                       <td><?php echo $datos[$i]["entrada_titulo"];?></td>
                       
                       
                         <?php
                             
                            $categoria->get_categoria_por_id_entrada($datos[$i]["id_categoria_entrada"]);
                          ?>
                       
                       
                       <td><?php echo $datos[$i]["entrada_status"];?></td>
                       <td><img width='100' src="../images/<?php echo $datos[$i]["entrada_imagen"];?>" alt=""></td>
                       <td><?php echo $datos[$i]["entrada_etiquetas"];?></td>
                        
                        <!--<td><span class="badge badge-danger"><?php //echo $datos[$i]["entrada_comment_count"];?></span></td>-->
                        
                       
                        
                        <td><a href="entrada_comentarios.php?id_entrada=<?php echo $datos[$i]["id_entrada"]?>"><?php echo $comentario->get_numero_comentarios_por_id_entrada($datos[$i]["id_entrada"]);?></a></td>
                       
                       <td><?php echo date("d-m-Y",strtotime($datos[$i]["entrada_fecha"]));?></td>
                       
                      <td><a class='btn btn-primary' href='../entrada.php?id_entrada=<?php echo $datos[$i]["id_entrada"]?>'><i class="fa fa-eye"></i> Ver Entrada</a></td>
                      
                      <td><a class='btn btn-success' href='entradas.php?accion=edit_entrada&id_entrada=<?php echo $datos[$i]["id_entrada"];?>'><i class="fa fa-pencil"></i>  Editar</a></td>

                        <td> <a onClick="javascript:return confirm('Estas seguro que lo quieres eliminar?');" class='btn btn-danger' href='entradas.php?eliminar=<?php echo $datos[$i]["id_entrada"];?>'><i class="fa fa-trash"></i>  Eliminar</a>  </td>
                        
                       
                        <td><a onClick="javascript:return confirm('Estas seguro que lo quieres resetear?');"  href='entradas.php?resetear=<?php echo $datos[$i]["id_entrada"];?>'><?php echo $datos[$i]["entrada_views_count"];?></a></td>
                        
                        
                        
                   </tr>
                   
             <?php }?>

    
            </tbody>
            </table>
            
            </form>
    

            

            
            
            
            
            
      