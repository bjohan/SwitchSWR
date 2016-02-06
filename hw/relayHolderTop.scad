use <relayHolder.scad>
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
        drillHoles(3/2, 70, $fn=20);	
    }
}

//relayHolderTop();



