function desplegar(tabla_a_desplegar,estadoT, estadoTfila) 
{
  var tablA = document.getElementById(tabla_a_desplegar);
  var estadOt = document.getElementById(estadoT);
  var fila = document.getElementById(estadoTfila);
  switch(tablA.style.display) 
  {
	case "none":
	  tablA.style.display = "block";
	  estadOt.innerHTML = "Ocultar";
	  break;
	default:
	  tablA.style.display = "none";
	  estadOt.innerHTML = "Mostrar"
	  break;
  }
}
