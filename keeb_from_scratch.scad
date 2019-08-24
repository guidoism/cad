include <BOSL/constants.scad>
use <BOSL/transforms.scad>
//use <BOSL/shapes.scad>

ymove(-15) grid2d(cols=10, rows=1, spacing=10, align=V_RIGHT) cube(size=[.2,5,1]);
ymove(-15) grid2d(cols=100, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);

$fn=50;

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

difference() {
    cube(size=[232, 160, 3.1]);
    move([5, 5]) keyholes();
    move([12, 100]) controller_hole();
}

difference() {
    move([0, 0, -3.1]) cube(size=[232, 160, 3.1]);
    move([5, 5, -3.1]) hull() { keyholes(); }
    move([12, 100, -3.1]) controller_hole_small();
    move([232/2, 100, -3.1]) cube(size=[30, 50, 10], center=true);
}

difference() {
    move([0, 0, -3.1*2]) cube(size=[232, 160, 3.1]);
    move([5, 5, -3.1*2]) hull() { keyholes(); }
    move([12, 100, -3.1*2]) controller_hole_small();
    move([232/2, 100, -3.1*2]) cube(size=[30, 50, 10 ], center=true);
}

difference() {
    move([0, 0, -3.1*3]) cube(size=[232, 160, 3.1]);
    move([5, 5, -3.1*3]) hull() { keyholes(); }
    move([12, 100, -3.1*3]) controller_hole_small();
    move([232/2, 100, -3.1*3]) cube(size=[30, 50, 10 ], center=true);
}