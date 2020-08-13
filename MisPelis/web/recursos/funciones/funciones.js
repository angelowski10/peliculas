/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
       
function imgInfo(fic) {
                        var input = document.getElementById("imagen");
                        var div = document.getElementById("nImg");
                        fic = fic.split('\\');

                        div.style="display: initial";
                        document.getElementById("imagenSelect").innerHTML = fic[fic.length-1];

                        var TmpPath = URL.createObjectURL(input.files[0]);
                        document.getElementById("nImgPreview").src = TmpPath;
                    }




