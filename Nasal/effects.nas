# ===============
# Effects Control
# ===============

print("Ativando controle de efeitos...");

device = "/sim/effects/engines/smoke";
props.Node.new(device);
setprop(device, "false");

device = "/sim/effects/gear/tiresmoke";
props.Node.new(device);
setprop(device, "false");

###################################################3

shaderdevice = "/sim/effects/shaders";
props.Node.new(shaderdevice);
setprop(shaderdevice, "true");

shaderonoff = func {
    shaderdevice = "/sim/effects/shaders";
    valueshader = getprop(shaderdevice);
    
    if(valueshader == 0 or valueshader == nil) {
    	setprop(shaderdevice, "true" );
    } else {
    	setprop(shaderdevice, "false" );
	}
}

contrailsdevice = "/sim/effects/contrails";
props.Node.new(contrailsdevice);
setprop(contrailsdevice, "true");

contrailsonoff = func {
    contrailsdevice = "/sim/effects/contrails";
    valuecontrails = getprop(contrailsdevice);
    
    if(valuecontrails == 0 or valuecontrails == nil) {
    	setprop(contrailsdevice, "true" );
    } else {
    	setprop(contrailsdevice, "false" );
	}
}

smokedevice = "/sim/effects/engines/smoke";
props.Node.new(smokedevice);
setprop(smokedevice, "true");

smokeonoff = func {
    smokedevice = "/sim/effects/engines/smoke";
    valuesmoke = getprop(smokedevice);
    
    if(valuesmoke == 0 or valuesmoke == nil) {
    	setprop(smokedevice, "true" );
    } else {
    	setprop(smokedevice, "false" );
	}
}

tiresmokedevice = "/sim/effects/gear/tiresmoke";
props.Node.new(tiresmokedevice);
setprop(tiresmokedevice, "true");

tiresmokeonoff = func {
    tiresmokedevice = "/sim/effects/gear/tiresmoke";
    valuetiresmoke = getprop(tiresmokedevice);
    
    if(valuetiresmoke == 0 or valuetiresmoke == nil) {
    	setprop(tiresmokedevice, "true" );
    } else {
    	setprop(tiresmokedevice, "false" );
	}
}

