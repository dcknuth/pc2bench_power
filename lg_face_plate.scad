// Custom faceplate
//34567891123456789212345678931234567894123456789512345678961234567897123456789

$fn = 100;

faceHeight = 96.5;
faceOpeningH = 72.0;
faceWidth = 57.0;
faceOpeningW = 52.5;
mountHoleBot = 5.4;
mountHoleDis = 80.0;
mountHoleD = 3.6;
mountHoleSlotW = 8.5;
mountHoleReliefR = 8.9;
thickness = 3.3;
faceThickness = 6.5;
coverHoleYOff = 4.4;
coverHoleYD = 3.0;

module FacePlate(ox, ix, oy, iy, lz, hz, r=2, mhr=1.8,
                mhrr=4.45, mhw=8.5, mhy=4.4) {
    // Outside and inside dimentions of the gang plate
    difference() {
        union() {
            hull() {
                translate([r,r,0])
                    cylinder(h=lz, r=r, center=false);
                translate([ox-r,r,0])
                    cylinder(h=lz, r=r, center=false);
                translate([ox-r,oy-r,0])
                    cylinder(h=lz, r=r, center=false);
                translate([r,oy-r,0])
                    cylinder(h=lz, r=r, center=false);
            }
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
                    translate([-(mhw/2-mhr),0,lz/2])
                        cylinder(h=lz+001, r=mhrr, center=true);
                    translate([mhw/2-mhr,0,lz/2])
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
                    translate([-(mhw/2-mhr),0,lz/2])
                        cylinder(h=lz+001, r=mhrr, center=true);
                    translate([mhw/2-mhr,0,lz/2])
                        cylinder(h=lz+001, r=mhrr, center=true);
                }
            }
    }
}

FacePlate(faceWidth, faceOpeningW,
    faceHeight, faceOpeningH, thickness, faceThickness);
