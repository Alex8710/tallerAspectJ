package ejemplo.cajero.control;

import java.io.*;
import ejemplo.cajero.modelo.Banco;

/**
 * Comando usado para transferir dinero entre cuentas
 */
public class ComandoListarOperaciones implements Comando {
	
	//List<String> listarComandos = new ArrayList<String>();
	//boolean flag = false;

	@Override
	public String getNombre() {
		return "Listar Operaciones";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto) throws Exception {
		/*flag = true;
		listadoOperaciones("Listar Operaciones");*/
		
		BufferedReader br=new BufferedReader(new FileReader("src/operaciones.txt"));
		String linea=br.readLine();
		while(linea!=null){
            System.out.println(linea);
            linea=br.readLine();
        }
	}
}