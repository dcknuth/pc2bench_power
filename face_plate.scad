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


power12HoleD = 7.0; // big enough for 8 wires
ledDa = 5.2;
ledDb = 6.0;
ledYOff = 4.0;
fuseD = 12.3;
fuseDb = 15.6;

// default square plate minus custom openings
difference() {
    FacePlate(faceWidth, faceOpeningW,
        faceHeight, faceOpeningH, thickness, faceThickness);
    // LED holes
    translate([faceWidth/2-faceOpeningW/4,
            (faceHeight-faceOpeningH)/2+ledYOff+ledDa/2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=ledDa, center=true);
            translate([0,0,-thickness])
                cylinder(h=faceThickness, d=ledDb, center=true);
        }
    translate([faceWidth/2+faceOpeningW/4,
            (faceHeight-faceOpeningH)/2+ledYOff+ledDa/2,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=ledDa, center=true);
            translate([0,0,-thickness])
                cylinder(h=faceThickness, d=ledDb, center=true);
        }
    // 12v molex hole
    translate([faceWidth/2-faceOpeningW/5,
            (faceHeight-faceOpeningH)/2+power12HoleD*2.9,
            faceThickness/2])
        cylinder(h=faceThickness+FUDGE, d=power12HoleD, center=true);
    // fuse holes
    translate([faceWidth/2+faceOpeningW/5,
            faceHeight/2-fuseD*0.35,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=fuseD, center=true);
            translate([0,0,faceThickness/2.6])
                cylinder(h=faceThickness-thickness, d=fuseDb, center=true);
        }
    translate([faceWidth/2-faceOpeningW/5,
            faceHeight/2+fuseD*0.7,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=fuseD, center=true);
            translate([0,0,faceThickness/2.6])
                cylinder(h=faceThickness-thickness, d=fuseDb, center=true);
        }
    translate([faceWidth/2+faceOpeningW/5,
            faceHeight/2+fuseD*1.8,
            faceThickness/2])
        union() {
            cylinder(h=faceThickness+FUDGE, d=fuseD, center=true);
            translate([0,0,faceThickness/2.6])
                cylinder(h=faceThickness-thickness, d=fuseDb, center=true);
        }
}    