import java.io.*;
import java.util.ArrayList;
import java.util.List;
import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoListarOperaciones;


public aspect ListarOperaciones {
	
	pointcut listarOperacionesCajero() : call ( * ejemplo.cajero.Cajero.retornaComandoSeleccionado(..));
	
	List<String> listarComandos = new ArrayList<String>();
	ComandoListarOperaciones clo = new ComandoListarOperaciones();
	@SuppressWarnings("resource")
	BufferedWriter bw = null;
	
	after() : listarOperacionesCajero() {
		
		String optionSelected = thisJoinPoint.getArgs()[1].toString();//corresponde al valor digitado por el usuario
		@SuppressWarnings("unchecked")
		List<Comando> elComando = (List<Comando>) thisJoinPoint.getArgs()[0];//corresponde al menu.		
		if (bw == null)
			try {
				bw = new BufferedWriter(new FileWriter("src/operaciones.txt"));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		try {
			String metodo = elComando.get(Integer.parseInt(optionSelected)).getNombre();
			bw.write(metodo);
			bw.newLine();
			bw.flush();
			
		} catch (Exception e) {
			// si hay una excepción, muestra el mensaje
			System.err.println(e.getMessage());
		}
	}
}