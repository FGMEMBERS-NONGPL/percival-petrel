# Boffowerx - Reverse Thrust (2 turbofan) - 
# 
# 		revision September 29, 2009 12:58:23 AM 
#
togglereverser = func {
	# Variáveis FDM
	FDMMotor1 = "/fdm/jsbsim/propulsion/engine";
	FDMMotor2 = "/fdm/jsbsim/propulsion/engine[1]";


	# Variáveis controle
	ControleMotor1 = "/controls/engines/engine"; 
	ControleMotor2 = "/controls/engines/engine[1]"; 
	 

	# Interface SIM	
	EntradaSIM = "/sim/input/selected";
	
	# Device reversor do motor
	ReversorMotor1 = "/engines/engine/reverser-pos-norm"; 
	ReversorMotor2 = "/engines/engine[1]/reverser-pos-norm"; 
	 

	# Captura situação do motor 1
	val = getprop(ReversorMotor1);
	
	# Se o motor 1 está com reversor desativado, caso de val == 0,
	#		1) então avanço nos reversores, 
	#		2) ajusta o ângulo do jato para contrário,
	#		3) acerta o controle para ligar esses dispositivos,
	#		4) ajusta o motor para ligado com reversor a 180 graus (2),
	#		   contrário do que deveria ser o gradiente do empuxo.
	if (val == 0 or val == nil) {
		interpolate(ReversorMotor1, 1.0, 1.4); 
		interpolate(ReversorMotor2, 1.0, 1.4);  
		
		
		setprop(FDMMotor1,"reverser-angle-rad","180");
		setprop(FDMMotor2,"reverser-angle-rad","180");
		
		setprop(ControleMotor1,"reverser", "true");
		setprop(ControleMotor2,"reverser", "true");
		
		setprop(EntradaSIM,"engine", "true");
		setprop(EntradaSIM,"engine[1]", "true");
	} else {
		if (val == 1.0){
			
		
			interpolate(ReversorMotor1, 0.0, 1.4);
			interpolate(ReversorMotor2, 0.0, 1.4);   
			
			setprop(FDMMotor1,"reverser-angle-rad",0);
			setprop(FDMMotor2,"reverser-angle-rad",0);
			
			setprop(ControleMotor1,"reverser",0);
			setprop(ControleMotor2,"reverser",0);
			
			setprop(EntradaSIM,"engine", "true");
			setprop(EntradaSIM,"engine[1]", "true");

		  }
	 }
}

