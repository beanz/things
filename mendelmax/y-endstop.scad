/*
 * Simple endstop switch holder for Trinity Labs PTFE Linear slide Y axis
 *
 * Copyright (c) 2012 Mark Hindess
 *
 * Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License:
 *
 *   http://creativecommons.org/licenses/by-nc-sa/3.0/
 */

thickness = 4;
extrusion_width = 20;
fixing_width = extrusion_width;
extrusion_ridge_width = 5.9;
extrusion_ridge_depth = 1.5;
extrusion_screw_diameter = 5;
$fn = 12;
holder_width = fixing_width;

// holder length as measured from edge of extrusion so total length of
// holder part is holder_length plus extrusion width
holder_length = 45;
holder_thickness = thickness;
switch_hole_diameter = 2.5;
holder_slot_length = holder_length;

module extrusion_fixing() {
    difference() {
        union() {
            // base of fixing
            cube([fixing_width, extrusion_width, thickness], center = true);

            // ridge that descends into extrusion
            translate([-fixing_width/2,0,thickness/2])
                rotate([0,90,0])
                linear_extrude(height = fixing_width)
                polygon([[-0.01,-extrusion_ridge_width/2],
                     [-extrusion_ridge_depth,-extrusion_ridge_width/2+.8],
                     [-extrusion_ridge_depth,extrusion_ridge_width/2-.8],
                     [-0.01,extrusion_ridge_width/2]]);
        }

        // screw hole
        cylinder(r = extrusion_screw_diameter/2,
                 h = thickness*3, center = true);
    }
}

module endstop_holder() {
    difference() {
        translate([-extrusion_width/2,-extrusion_width/2, -holder_thickness/2])
          cube([holder_width, holder_length+extrusion_width, holder_thickness]);

        // switch screw holes
        for (x=[-9.5/2, 9.5/2]) {
            translate([x,holder_length+extrusion_width/2-5,0])
            cylinder(r=switch_hole_diameter/2, h=holder_thickness*3,
                     center=true);
        }

        // slot to allow movement of switch holder
        translate([0, holder_slot_length/2-extrusion_screw_diameter/2, 0]) {
            cube([extrusion_screw_diameter,
                  holder_slot_length - extrusion_screw_diameter,
                  holder_thickness*3], center = true);
           // holes to form rounded ends of the slot
           for (y=[-holder_slot_length/2+extrusion_screw_diameter/2,
                   +holder_slot_length/2-extrusion_screw_diameter/2])
               translate([0,y,0])
               cylinder(r = extrusion_screw_diameter/2,
                        h = holder_thickness*3, center = true);
        }
    }
}

extrusion_fixing();
translate([25,0,0]) endstop_holder();
