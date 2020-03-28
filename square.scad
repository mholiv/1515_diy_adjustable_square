/**
Copyright Caitlin Campbell 2020.
This documentation describes Open Hardware and is licensed under the
CERN OHL-S v2.
You may redistribute and modify this documentation under the terms of the
CERN OHL-S v2. (http://ohwr.org/cernohl). This documentation is distributed
WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF
MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A
PARTICULAR PURPOSE. Please see the CERN OHL-S v.2 for applicable
conditions.
**/


// The height,width, and length of the in rail shim
holder_h = 2.85;
holder_w = 9.00;
holder_l = 10;


// Corner piece
translate([0,15,0])
corner();

// Corner piece
translate([0,35,0])
corner();

translate([45,10,0])
holder();
translate([45,25,0])
holder();
translate([55,10,0])
holder();
translate([55,25,0])
holder();



// The corner piece itself
module corner() {
	rotate([90,0,0])
    difference() {
        linear_extrude(15)
        polygon([[0,0],[0,15],[40,0]]);
        
        translate([1.5,1.5,1.5])
        cube([40,40,12]);
        
        translate([10,1.5,7.5])
        rotate([90,0,0])
        cylinder(d=3, h=1.5, $fn=25);
        
        translate([30,1.5,7.5])
        rotate([90,0,0])
        cylinder(d=3, h=1.5, $fn=25);
        
        translate([0,7.5,7.5])
        rotate([0,90,0])
        cylinder(d=3, h=1.5, $fn=25);
    }
}

// Holder itself.
module holder() {
	rotate([90,0,0])
    difference() {
        linear_extrude(holder_l)
        polygon([[0,0],[holder_w,0],[holder_w-1.5,holder_h],[1.5,holder_h]]);

        translate([holder_w/2,2.85,holder_l/2])
        rotate([90,90,0])
        screw_hole();
    }
}



module screw_hole(){
	
	// This is where we define the nut so we can cut out with it later. Overall a bad idea how I did it. This is subject to change.
	cylinder($fn=6, d=6.35,h=2.45);
	cylinder($fn=25, d=3,h=18);

}