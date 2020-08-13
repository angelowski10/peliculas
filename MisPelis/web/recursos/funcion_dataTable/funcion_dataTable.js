/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  var table;
      $(document).ready(function() {
   table= $('#example').DataTable({ 
        "language":idioma
          });
    obtener_data_editar("#example tbody",table);
} );



var idioma= {
    "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix":    "",
    "sSearch":         "Buscar:",
    "sUrl":            "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad"
    }
};

var obtener_data_editar=function(tbody,table){
    
    $(tbody).on("click","a.editar", function(){
       var data=table.row($(this).parents("tr") ).data();
       console.log(data);
     $("#idusuario").val(data[0]);
     $("#name_usuario").val(data[1]);
     $("#nombres").val(data[2]);
     $("#apellidos").val(data[3]);
     $("#correo").val(data[4]);
      
    });
    
};


 
   