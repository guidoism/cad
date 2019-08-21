
module la_paz() {
translate([0, 0, -40])
  difference() {
    import("/Users/guido/Downloads/stls 2/rawmodel-34823.stl");
    translate([-1, -1, -10]) cube(50);
  }
}

// linear_extrude(center = true, height = 0.5) projection(cut = false) la_paz();
//	% la_paz();

la_paz();

