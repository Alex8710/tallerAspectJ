import java.util.List;
import ejemplo.cajero.control.*;

/*
public aspect Transferencias {
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..) );
	
	List<Comando> around() : opciones() {
		
		List<Comando> comandos = new ArrayList<>();
		
		comandos.add(new ComandoListarCuentas());
		comandos.add(new ComandoRetirar());
		if (PropertyManager.getProperty("Consignar"))
			comandos.add(new ComandoConsignar());
		comandos.add(new ComandoTransferir());
		return comandos;
	}
}
*/

public aspect Transferencias { 	
	// TODO Auto-generated aspect 	
	pointcut opciones() : call ( * ejemplo.cajero.Cajero.cargaComandos(..));
	
	after() returning (List<Comando> comandos) :opciones(){
		
		comandos.add(new ComandoTransferir()); 		
		
		for (int i=0; i < comandos.size(); i++) { 			
			System.out.println(i + ".-" + comandos.get(i).getNombre());  	
		}
	}
}