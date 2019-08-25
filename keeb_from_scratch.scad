include <BOSL/constants.scad>
use <BOSL/transforms.scad>

ymove(-15) grid2d(cols=24, rows=1, spacing=10, align=V_RIGHT) cube(size=[.2,5,1]);
ymove(-15) grid2d(cols=230, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);

t = 3.1; // Thickness of each layer
$fn = 50;

module keyholes() {
    grid2d(cols=12, rows=4, spacing=19, align=V_ALLPOS) cube([14, 14, 5]);
}

module controller_hole() {
    hull() {
        cylinder(h=10, r=7);
        move([19*11, 0]) cylinder(h=10, r=7);
        move([0, 40]) cylinder(h=10, r=7);
        move([19*11, 40]) cylinder(h=10, r=7);
    }
}

module controller_hole_small() {
    hull() {
        move([2, 2]) cylinder(h=10, r=7);
        move([19*11-2, 2]) cylinder(h=10, r=7);
        move([2, 40-2]) cylinder(h=10, r=7);
        move([19*11-2, 40-2]) cylinder(h=10, r=7);
    }
}

module layer(n) {
     move([0, 0, -t*n]) {
          difference() {
               cube(size=[232, 160, t]);
               children();
          }
     }
}

module one() {
     layer(0) {
          move([5, 5]) keyholes();
          move([12, 100]) controller_hole();
     }
}

module two() {
     layer(1) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12, 100]) controller_hole_small();
          move([232/2, 100]) cube(size=[30, 50, 10], center=true);
     }
}

module three() {
     layer(2) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12, 100]) controller_hole_small();
          move([232/2, 100]) cube(size=[30, 50, 10 ], center=true);
          move([25, 140]) cube(size=[9, 50, 10]);
     }
}

module four() {
     layer(3) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12, 100]) controller_hole_small();
          move([232/2, 100]) cube(size=[30, 50, 10 ], center=true);
          move([25-20.5/2+9/2, 140, -t*2.5]) cube(size=[20.5, 50, 1.55]);
     }
}

// TODO: 2u spacebar

//projection()
one();
two();
three();
four();
//layer(4);



