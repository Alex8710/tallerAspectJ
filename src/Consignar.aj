import java.util.List;
import ejemplo.cajero.control.*;

/*
public aspect Consignar {
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..) );
	
	List<Comando> around() : opciones() {
		
		List<Comando> comandos = new ArrayList<>();
		
		comandos.add(new ComandoListarCuentas());
		comandos.add(new ComandoRetirar());
		comandos.add(new ComandoConsignar());
		if (PropertyManager.getProperty("Transferencias"))
			comandos.add(new ComandoTransferir());
		return comandos;
		
	}
	//for (int i=0; i < comandos.size(); i++) {
	//	System.out.println(i + ".-" + comandos.get(i).getNombre());
	//}
}
*/
public aspect Consignar { 	
	// TODO Auto-generated aspect 	
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning (List<Comando> comandos) :opciones(){
		
		comandos.add(new ComandoConsignar()); 		
		
		for (int i=0; i < comandos.size(); i++) { 			
			System.out.println(i + ".-" + comandos.get(i).getNombre());  	
		}
	}
}