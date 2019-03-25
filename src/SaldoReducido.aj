import ejemplo.cajero.modelo.Cuenta;

public aspect SaldoReducido { 	
	// TODO Auto-generated aspect 	
	pointcut metodoRetirar() : call ( * ejemplo.cajero.modelo.Cuenta.retirar(..));
	
	void around() throws Exception: metodoRetirar(){
		
		Cuenta cuenta = (Cuenta) thisJoinPoint.getTarget();
		
		long saldo = cuenta.getSaldo();		
		long valor = (long) thisJoinPoint.getArgs()[0];
		
		if (valor < 0) {
			throw new Exception("No se puede retirar un valor negativo");
		} else if (valor > saldo) {
			throw new Exception("No se puede retirar un valor mayor al saldo");
		} else if (saldo > 200000){
			System.out.println("Nuevo saldo: " + (saldo - valor)  );
			cuenta.setSaldo(saldo - valor);
		} else
			throw new Exception("Ud tiene un saldo inferior a 200000");
	}
}