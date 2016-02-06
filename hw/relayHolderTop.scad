use <relayHolder.scad>
module holder(){
	wallWidth = 8;
/*	translate([0,0,4]){
		cube([66, 58, 2]);

		translate([22, 4, 2]){
			cylinder(25, 5/2, 5/2);
		}

		translate([22+22, 4, 2]){
			cylinder(25.5, 5/2, 5/2);
		}


		difference(){
			translate([-wallWidth, 0, 0]){
				cube([66+2*wallWidth, 58+wallWidth, 25.5]);
			}
			cube([66, 58, 25.6]);
		}
	}*/
	translate([-wallWidth, 0, 0]){
		cube([66+2*wallWidth, 58+wallWidth, 4]);
	}
}

/*module drillHoles(r, dep){
	translate([22, 4,0]){
		cylinder(dep, r, r);
	}	

	translate([44, 4,0]){
		cylinder(dep, r, r);
	}
	
	translate([70, 4,0]){
		cylinder(dep, r, r);
	}

	translate([-4, 4,0]){
		cylinder(dep, r, r);
	}

	translate([70, 62,0]){
		cylinder(dep, r, r);
	}

	translate([-4, 62,0]){
		cylinder(dep, r, r);
	}	
}*/

difference(){
	holder($fn=20);
	drillHoles(3/2, 70, $fn=20);	
	//drillHoles(7/2, 3);
}



