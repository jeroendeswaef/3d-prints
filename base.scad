
module curved_handle_layer(inner_circle_center, inner_circle_radius, outer_circle_center, outer_circle_radius, height, z_offset = 0) {
    translate([0, 0, z_offset])
    linear_extrude(height)
    difference() {
        translate(outer_circle_center)
        circle(outer_circle_radius, $fn=180);
        
        translate(inner_circle_center)
        translate([0, 0, z_offset])
        circle(inner_circle_radius, $fn=180);
        
        // remove everything on the negative x-axis
        translate([-outer_circle_radius * 2, -outer_circle_radius * 2, 0])
        square([outer_circle_radius * 2, outer_circle_radius * 4]);
        
        // remove everything on the negative y-axis
        translate([0, -outer_circle_radius * 2])
        square(outer_circle_radius * 2);
        
        // slicing height
        translate([0, 38])
        square(outer_circle_radius * 2);
        
    }
}

cockpit_outer_circle_center = [-152.4, -147.26];
cockpit_outer_circle_radius = 305.27;

cockpit_inner_circle_center = [-277.92, -237.47];
cockpit_inner_circle_radius = 441.27;

curved_handle_layer(cockpit_inner_circle_center, cockpit_inner_circle_radius, cockpit_outer_circle_center, cockpit_outer_circle_radius + 3, 3);

curved_handle_layer(cockpit_outer_circle_center, cockpit_outer_circle_radius, cockpit_outer_circle_center, cockpit_outer_circle_radius + 3, 5, -5);

curved_handle_layer(cockpit_outer_circle_center, cockpit_outer_circle_radius -10, cockpit_outer_circle_center, cockpit_outer_circle_radius + 3, 3, -8);