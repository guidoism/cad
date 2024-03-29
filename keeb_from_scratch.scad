include <BOSL/constants.scad>
use <BOSL/transforms.scad>

svg = true;

module tickmarks() {
     grid2d(cols=24, rows=1, spacing=10, align=V_RIGHT) cube(size=[.2,5,1]);
     //grid2d(cols=10, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);
     //xmove(100) grid2d(cols=10, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);
     xmove(230) {
          grid2d(cols=10, rows=1, spacing=1, align=V_RIGHT) cube(size=[.2,3,1]);
          //move([5.48, -5]) grid2d(cols=1, rows=7, spacing=1, align=V_RIGHT) cube(size=[.2,.2,1]);
     }
}

module ruler() {
     projection() tickmarks();
     move([-0.5, -3]) for (i = [1:23]) {
          xmove(i*10) text(str(i), 2);
     }
}

t = 3.1; // Thickness of each layer
$fn = 50;

module keyholes() {
    grid2d(cols=12, rows=4, spacing=19, align=V_ALLPOS) {
         if ($col == 6 && $row == 0) {
              // remove
         } else if ($col == 5 && $row == 0) {
              move([19/2, 0]) cube([14, 14, 10]);
         } else {
              cube([14, 14, 10]);
         }
    }
}

module rounded_rectangle(w, h, c) {
     move([c, c]) minkowski() {
          cube([w-2*c, h-2*c, t/2]);
          cylinder(h=t/2, r=c);
     }
}

module layer(n) {
     //offset = svg ? 170*n : 0;
     offset = 0;
     move([0, offset, -t*n]) {
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
          // The place for the USB-C breakout PCB is half-height, but that
          // doesn't project well into two dimensions.
          move([25-20.5/2+9/2, 140, svg ? 0 : t/2]) cube(size=[20.5, 50, svg ? t : t/2]);
     }
}

module five() {
     layer(4) {
          move([0, 81]) cube(size=[232, .1, t]);
     }
}

// TODO: holes for screws on bottom
// TODO: etch name in bottom
// TODO: programmatically export svg
// TODO: programmatically add real world units to svg
// TODO: close lid or bottom with magnets?
// TODO: Engrave as seperate svg at the same time

module alignment_marks(x, y) {
     th = .2;
     ymove(y) xmove(x) cube(size=[10, th, 1]);
     ymove(y) xmove(x) cube(size=[th, 10, 1]);
     ymove(y) xflip() cube(size=[10, th, 1]);
     ymove(y) xflip() cube(size=[th, 10, 1]);
     yflip() xmove(x) cube(size=[10, th, 1]);
     yflip() xmove(x) cube(size=[th, 10, 1]);
     yflip() xflip() cube(size=[10, th, 1]);
     yflip() xflip() cube(size=[th, 10, 1]);
}

if (svg) {
     // The actual keyboard I made was 1.5 mm bigger per 100 mm
     // Temporarily increase size to compensate for fuck-up
     scale(101.5/100) {
          //color("blue") ymove(166) ruler();
          projection() {
               one();
               //two();
               //three();
               //four();
               //five();
               color("green") alignment_marks(232, 160);
          }
     }
     // Export as 508 mm x 304.8 mm
     //projection() move([508, 304.8-10]) cube(size=[1, 1, 1]);
     color("purple") ymove(170) ruler();

} else {
     one();
     two();
     three();
     four();
     //five();
}





