use <dirCoupHolder.scad>
use <relayHolder.scad>
module enclosureBottom(){
        cube([200, 200, 10]);
}

enclosureBottom();

couplerHolderAssembly();
relayHolderAssembly();