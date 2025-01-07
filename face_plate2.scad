// Custom faceplate
//34567891123456789212345678931234567894123456789512345678961234567897123456789

use <lg_face_plate.scad>;

$fn = 100;
FUDGE = 0.001;

faceHeight = 96.0;
faceOpeningH = 72.0;
faceWidth = 56.5;
faceOpeningW = 52.5;
thickness = 3.3;
faceThickness = 6.5;

sensorX = 46.0;
sensorY = 27.8;
plugD = 8.0;
hexD = 13.2;

// default square plate minus custom openings
difference() {
    FacePlate(faceWidth, faceOpeningW,
        faceHeight, faceOpeningH, thickness, faceThickness);
    // sensor hole
    translate([faceWidth/2,
            faceHeight/2,
            faceThickness/2-FUDGE])
        cube([sensorX,sensorY,faceThickness], center=true);
    // banana plug holes
    translate([faceWidth/2-plugD*1.4,
            faceHeight/2-sensorY/2-plugD*1.2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=plugD, center=true);
            translate([0,0,faceThickness/2.9])
                cylinder($fn=6, h=faceThickness-thickness,
                    d=hexD, center=true);
        }
    translate([faceWidth/2+plugD*1.4,
            faceHeight/2-sensorY/2-plugD*1.2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=plugD, center=true);
            translate([0,0,faceThickness/2.9])
                cylinder($fn=6, h=faceThickness-thickness,
                    d=hexD, center=true);
        }
    translate([faceWidth/2,
            faceHeight/2+sensorY/2+plugD*1.2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=plugD, center=true);
            translate([0,0,faceThickness/2.9])
                cylinder($fn=6, h=faceThickness-thickness,
                    d=hexD, center=true);
        }
}    