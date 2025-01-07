// simple spacer

$fn = 100;
FUDGE = 0.001;

cd = 4.0;
ph = 8.0;
px = 78.0;
py = 80.0;
phd = 30.0;
rl = 13.0;
rr = 3.0;

difference() {
  // plate
  hull() {
    translate([-(px-cd)/2, -(py-cd)/2, 0])
      cylinder(h=ph, d=cd, center=true);
    translate([(px-cd)/2, -(py-cd)/2, 0])
      cylinder(h=ph, d=cd, center=true);
    translate([(px-cd)/2, (py-cd)/2, 0])
      cylinder(h=ph, d=cd, center=true);
    translate([-(px-cd)/2, (py-cd)/2, 0])
      cylinder(h=ph, d=cd, center=true);
  }
  // wiring hole to next box
  translate([-phd/1.5, phd/1.5, 0])
    cylinder(h=ph+FUDGE, d=phd, center=true);
  // indent for gang box ridge
  translate([0,-(py-rl)/2,ph/2])
    rotate([90,0,0])
      cylinder(h=rl+FUDGE, r=rr, center=true);
  // another, but a tent shape so we don't need overhangs
  translate([0,-(py-rl)/2,-ph/2])
    rotate([90,45,0])
      cube([rr*2,rr*2,rl+FUDGE], center=true);
}