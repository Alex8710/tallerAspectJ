import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import ejemplo.cajero.control.Comando;

public aspect Auditoria {
	
	pointcut auditoriaCajero() : call ( * ejemplo.cajero.Cajero.retornaComandoSeleccionado(..));
	
	List<String> listarComandos = new ArrayList<String>();
	BufferedWriter bw = null;
	
	after() : auditoriaCajero() {
		
		String optionSelected = thisJoinPoint.getArgs()[1].toString();//corresponde al valor digitado por el usuario
		@SuppressWarnings("unchecked")
		LocalDateTime ahora = LocalDateTime.now();
		@SuppressWarnings("unchecked")
		List<Comando> elComando = (List<Comando>) thisJoinPoint.getArgs()[0];//corresponde al menu con todos los comandos.		
		if (bw == null)
			try {
				bw = new BufferedWriter(new FileWriter("src/auditoria.txt"));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		
		try {
			String metodo = elComando.get(Integer.parseInt(optionSelected)).getNombre();
			bw.write("Hora de operacion: "+ahora+" Operacion ejecutada: "+metodo);
			bw.newLine();
			bw.flush();
			
		} catch (Exception e) {
			// si hay una excepción, muestra el mensaje
			System.err.println(e.getMessage());
		}
	}
}