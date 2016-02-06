use <relayHolder.scad>

module hollowHalfCube(x, y, z, t){
	difference(){
	cube([x, y, z]);
	translate([t, t, t])
		cube([x-2*t, y-2*t, z-t]);
	}
}

module hollowHalfCubeOpenSides(x, y, z, t, xCornerWall, yCornerWall,zCornerWall){
	difference(){
		hollowHalfCube(x, y, z, t);
		translate([xCornerWall, 0, t+zCornerWall]){
			cube([x-2*xCornerWall, y, z]);
		}

		translate([0, yCornerWall, t+zCornerWall]){
			cube([x, y-2*yCornerWall, z]);
		}
	}
}

module holeKnob(height){
	hull(){
		cylinder(height, 5, 5);
		translate([0, 15, 0]){
			cylinder(height, 5,5);
		}
	}

}

module holeKnobHoles(height, rad){
	cylinder(height, rad, rad);
	translate([0, 15, 0]){
		cylinder(height, rad,rad);
	}
}

module knob(height, rad){
	difference(){
		holeKnob(height);
		holeKnobHoles(height,rad);
	}
}

module holderBody(){
	dirCoupL = 142;
	dirCoupW = 100.5;
	t = 3;
	clearance = 10;
	difference(){
		union(){
			hollowHalfCubeOpenSides(dirCoupW+2*t,dirCoupL+2*t, 42/2+t,t, 15, 25, 6);


			translate([t+clearance, t+clearance,t]){
				cube([dirCoupW-2*clearance, dirCoupL-2*clearance, 2]);
			}
	
			/*cylinder(21+t, 4,4);
			translate([0,dirCoupL+2*t, 0]){
				cylinder(21+t, 4,4);
			}
			
			translate([dirCoupW+2*t,0 , 0]){
				cylinder(21+t, 4,4);
				translate([0,dirCoupL+2*t, 0]){
					cylinder(21+t, 4,4);
				}
			}*/


			translate([-3, 5, 0]){
				knob(21+t, 3/2);
			}

			translate([0,dirCoupL+2*t, 0]){
				translate([-3, -15-5, 0])
					knob(21+t, 3/2);
				//cylinder(21+t, 4,4);
			}
			
			translate([dirCoupW+2*t,0 , 0]){
				translate([3, 5, 0])
				knob(21+t, 3/2);
				//cylinder(21+t, 4,4);
				translate([0,dirCoupL+2*t, 0]){
					translate([3, -15-5, 0])
					knob(21+t, 3/2);
					//cylinder(21+t, 4,4);
				}
			}
	
		}
		/*cylinder(21+t, 3/2,3/2);
			translate([0,dirCoupL+2*t, 0]){
				cylinder(21+t, 3/2,3/2);
			}
			
			translate([dirCoupW+2*t,0 , 0]){
				cylinder(21+t, 3/2,3/2);
				translate([0,dirCoupL+2*t, 0]){
					cylinder(21+t, 3/2,3/2);
				}
			}*/
		
	}

}

module holes(){
	translate([50.25-33+3, 2, 3]){
        relayHolderHoles(7/2, 3);
	}
	translate([50.25-33+3, 2, 0]){
        relayHolderHoles(3/2, 30);
	}
}


module couplerHolderBottomHalf()
{
    difference(){
        holderBody($fn=20);
        holes($fn=20);	
        translate([0, 142+6, 0]){
            mirror([0, 1, 0]){
                holes($fn=20);
            }
        }
        
    }
}

module couplerHolderTopHalf()
{
    mirror([0, 0, 1])
        couplerHolderBottomHalf();
}

module couplerHolderAssembly()
{
    couplerHolderBottomHalf();
    translate([0, 0, 24*2])
        couplerHolderTopHalf();
}

couplerHolderAssembly();

/*translate([-3, 5, 0]){
	difference(){
		holeKnob(24);
		holeKnobHoles(24,3/2);
	}
}*/