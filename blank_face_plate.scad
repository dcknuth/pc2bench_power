// Custom faceplate
//34567891123456789212345678931234567894123456789512345678961234567897123456789

$fn = 100;

faceHeight = 105.5;
faceOpeningH = 66.5;
faceWidth = 35.8;
faceOpeningW = 33;
mountHoleBot = 9.4;
mountHoleDis = 80.0;
mountHoleD = 3.6;
mountHoleSlotW = 8.5;
mountHoleReliefR = 8.9;
thickness = 3.3;
faceThickness = 6.5;
coverHoleYOff = 2.7;
coverHoleYD = 3.0;

module FacePlate(ox, ix, oy, iy, lz, hz, r=2, cr=1.65, chy=2.7,
                mhr=1.8, mhrr=4.45, mhw=8.5, mhy=9.4) {
    // Outside and inside dimentions of the gang plate
    difference() {
        union() {
            cube([ox,oy,lz]);
            hull() {
                // top square
                translate([(ox-ix)/2+r,(oy-iy)/2+r,hz-r])
                    sphere(radius=r);
                translate([((ox-ix)/2+r)+(ix-2*r),(oy-iy)/2+r,hz-r])
                    sphere(radius=r);
                translate([((ox-ix)/2+r)+(ix-2*r),((oy-iy)/2+r)+(iy-2*r),hz-r])
                    sphere(radius=r);
                translate([(ox-ix)/2+r,((oy-iy)/2+r)+(iy-2*r),hz-r])
                    sphere(radius=r);
                // bottom square
                translate([(ox-ix)/2+r,(oy-iy)/2+r,lz-r])
                    sphere(radius=r);
                translate([((ox-ix)/2+r)+(ix-2*r),(oy-iy)/2+r,lz-r])
                    sphere(radius=r);
                translate([((ox-ix)/2+r)+(ix-2*r),((oy-iy)/2+r)+(iy-2*r),lz-r])
                    sphere(radius=r);
                translate([(ox-ix)/2+r,((oy-iy)/2+r)+(iy-2*r),lz-r])
                    sphere(radius=r);
            }
        }
        // indents on the corners
        hull() {
            translate([0,ix*0.35,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
            translate([0,-r,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
        }
        hull() {
            translate([ox,ix*0.35,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
            translate([ox,-r,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
        }
        hull() {
            translate([0,oy-ix*0.35,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
            translate([0,oy+r,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
        }
        hull() {
            translate([ox,oy-ix*0.35,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
            translate([ox,oy+r,lz/2])
                cylinder(h=lz+0.001, r=r, center=true);
        }
        // cover mount holes
        translate([ox/2,chy+cr,lz/2])
            cylinder(h=lz+0.001, r=cr, center=true);
        translate([ox/2,oy-(chy+cr),lz/2])
            cylinder(h=lz+0.001, r=cr, center=true);
        // face plate mount slots
        translate([ox/2,mhy+mhr,lz/2])
            union() {
                hull() {
                    translate([-(mhw/2-mhr),0,0])
                        cylinder(h=lz+001, r=mhr, center=true);
                    translate([mhw/2-mhr,0,0])
                        cylinder(h=lz+001, r=mhr, center=true);
                }
                hull() {
                    translate([-(mhw/2-mhr),0,lz/1.8])
                        cylinder(h=lz+001, r=mhrr, center=true);
                    translate([mhw/2-mhr,0,lz/1.8])
                        cylinder(h=lz+001, r=mhrr, center=true);
                }
            }
        translate([ox/2,oy-(mhy+mhr),lz/2])
            union() {
                hull() {
                    translate([-(mhw/2-mhr),0,0])
                        cylinder(h=lz+001, r=mhr, center=true);
                    translate([mhw/2-mhr,0,0])
                        cylinder(h=lz+001, r=mhr, center=true);
                }
                hull() {
                    translate([-(mhw/2-mhr),0,lz/1.8])
                        cylinder(h=lz+001, r=mhrr, center=true);
                    translate([mhw/2-mhr,0,lz/1.8])
                        cylinder(h=lz+001, r=mhrr, center=true);
                }
            }
    }
}

FacePlate(faceWidth, faceOpeningW,
    faceHeight, faceOpeningH, thickness, faceThickness);
