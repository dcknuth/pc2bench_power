// Custom faceplate
//34567891123456789212345678931234567894123456789512345678961234567897123456789

use <blank_face_plate.scad>;

$fn = 100;
FUDGE = 0.001;

faceHeight = 105.5;
faceOpeningH = 68.0;
faceWidth = 35.8;
faceOpeningW = 34.5;
thickness = 3.3;
faceThickness = 6.5;

switchX = 20.15;
switchY = 12.55;
switchYOff = 4.0;
fuseD = 12.3;
fuseDb = 15.6;
plugD = 8.0;
hexD = 13.2;

// default square plate minus custom openings
difference() {
    FacePlate(faceWidth, faceOpeningW,
        faceHeight, faceOpeningH, thickness, faceThickness);
    // on/off switch
    translate([faceWidth/2,
            (faceHeight-faceOpeningH)/2+switchYOff+switchY/2,
            faceThickness/2])
        difference() {
            cube([switchX,switchY,faceThickness+FUDGE], center=true);
            translate([-switchX/2,0,faceThickness/3.6])
                rotate([90,0,0])
                    cylinder(h=switchY/2, d=0.8, center=true);
            translate([switchX/2,0,faceThickness/3.6])
                rotate([90,0,0])
                    cylinder(h=switchY/2, d=0.8, center=true);
        }
    // fuse hole
    translate([faceWidth/2,
            faceHeight/2+fuseD*1.8,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=fuseD, center=true);
            translate([0,0,faceThickness/2.6])
                cylinder(h=faceThickness-thickness, d=fuseDb, center=true);
        }
    // banana plug hole
    translate([faceWidth/2,
            faceHeight/2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=plugD, center=true);
            translate([0,0,faceThickness/2.9])
                cylinder($fn=6, h=faceThickness-thickness,
                    d=hexD, center=true);
        }
}    