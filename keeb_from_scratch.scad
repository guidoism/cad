include <BOSL/constants.scad>
use <BOSL/transforms.scad>

ymove(-15) grid2d(cols=24, rows=1, spacing=10, align=V_RIGHT) cube(size=[.2,5,1]);
ymove(-15) grid2d(cols=230, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);

t = 3.1; // Thickness of each layer
$fn = 50;

module keyholes() {
    grid2d(cols=12, rows=4, spacing=19, align=V_ALLPOS) cube([14, 14, 10]);
}


module rounded_rectangle(w, h, c) {
     move([c, c]) minkowski() {
          cube([w-2*c, h-2*c, t/2]);
          //cube([w, h, t/2]);
          cylinder(h=t/2, r=c);
     }
}

//rounded_rectangle(30, 10, 3);

module layer(n) {
     // offset -- move([0, 160*(n+1), -t*n]) {
     move([0, 0, -t*n]) {
          difference() {
               rounded_rectangle(232, 160, 4);
               children();
          }
     }
}

module one() {
     layer(0) {
          move([5, 5]) keyholes();
          move([12, 90]) rounded_rectangle(19*11, 60, 19/2);
     }
}

module two() {
     color("aqua") layer(1) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12+3, 90+3]) rounded_rectangle(19*11-3*2, 60-3*2, 19/2-3);
          move([232/2, 100]) cube(size=[30, 50, 10], center=true);
     }
}

module three() {
     layer(2) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12+3, 90+3]) rounded_rectangle(19*11-3*2, 60-3*2, 19/2-3);
          move([232/2, 100]) cube(size=[30, 50, 20], center=true);
          move([25, 140]) cube(size=[9, 50, 10]);
     }
}

module four() {
     color("purple") layer(3) {
          move([5, 5]) scale([1, 1.02, 1]) hull() { keyholes(); }
          move([12+3, 90+3]) rounded_rectangle(19*11-3*2, 60-3*2, 19/2-3);
          move([232/2, 100]) cube(size=[30, 50, 10], center=true);
          move([25-20.5/2+9/2, 140, t/2]) cube(size=[20.5, 50, 1.55]);
     }
}

// TODO: 2u spacebar

//projection()
one();
two();
three();
four();
//layer(4);



