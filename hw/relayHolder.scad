module relayHolderBody(){
	wallWidth = 8;
	translate([0,0,4]){
		cube([66, 58, 2]);

		translate([22, 4, 2]){
			cylinder(25.5, 5/2, 5/2);
		}

		translate([22+22, 4, 2]){
			cylinder(25.5, 5/2, 5/2);
		}


		difference(){
			translate([-wallWidth, 0, 0]){
				cube([66+2*wallWidth, 58+wallWidth, 25.5+2]);
			}
			cube([66, 58, 25.6+2]);
		}
	}
	translate([-wallWidth, 0, 0]){
		cube([66+2*wallWidth, 58+wallWidth, 4]);
	}
}

module relayHolderHoles(r, dep){
	translate([22, 4,0]){
		cylinder(dep, r+0.2, r+0.2);
	}	

	translate([44, 4,0]){
		cylinder(dep, r+0.2, r+0.2);
	}
	
	translate([70, 14,0]){
		cylinder(dep, r, r);
	}

	translate([-4, 14,0]){
		cylinder(dep, r, r);
	}

	translate([70, 62,0]){
		cylinder(dep, r, r);
	}

	translate([-4, 62,0]){
		cylinder(dep, r, r);
	}	
}

module relayHolder(){
    difference(){
        relayHolderBody($fn=20);
        relayHolderHoles(3/2, 70, $fn=20);	
        relayHolderHoles(7/2, 3);
        translate([-10, 25, 10]){
            cube([100, 25, 25]);
        }
    }
}

module relayHolderTopBase(){
	wallWidth = 8;
	translate([-wallWidth, 0, 0]){
		cube([66+2*wallWidth, 58+wallWidth, 4]);
	}
}


module relayHolderTop()
{
    difference(){
        relayHolderTopBase($fn=20);
        relayHolderHoles(3/2, 70, $fn=20);	
    }
}

module relayHolderAssembly()
{
    relayHolder();
    translate([0,0,31.5])
        relayHolderTop();
}

module relayHolderPrint(){
    relayHolder();
    translate([0,70,0])
        relayHolderTop();
}

//relayHolderPrint();

