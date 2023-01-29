
module curved_handle_layer(inner_circle_center, inner_circle_radius, outer_circle_center, outer_circle_radius, height, piece_height, z_offset = 0) {
    translate([0, 0, z_offset])
    linear_extrude(height)
    difference() {
        translate(outer_circle_center)
        circle(outer_circle_radius, $fn=180);
        
        translate(inner_circle_center)
        circle(inner_circle_radius, $fn=180);
        
        // remove everything on the negative x-axis
        translate([-outer_circle_radius * 2, -outer_circle_radius * 2, 0])
        square([outer_circle_radius * 2, outer_circle_radius * 4]);
        
        // remove everything on the negative y-axis
        translate([0, -outer_circle_radius * 2])
        square(outer_circle_radius * 2);
        
        // slicing height
        translate([0, piece_height])
        square(outer_circle_radius * 2);
    }
}

cockpit_outer_circle_center = [-152.4, -147.26];
cockpit_outer_circle_radius = 305.27;

cockpit_inner_circle_center = [-277.92, -237.47];
cockpit_inner_circle_radius = 441.27;

piece_height = 38;
ridge_width = 5;
ridge_height = 2;
plate_height = 3;

translate([0, -piece_height / 2, 0])
union() {
    curved_handle_layer(cockpit_inner_circle_center, cockpit_inner_circle_radius, cockpit_outer_circle_center, cockpit_outer_circle_radius + ridge_width, plate_height, piece_height);

    curved_handle_layer(cockpit_outer_circle_center, cockpit_outer_circle_radius, cockpit_outer_circle_center, cockpit_outer_circle_radius + ridge_width, ridge_height, piece_height, -ridge_height);

    curved_handle_layer(cockpit_inner_circle_center, cockpit_inner_circle_radius + 3, cockpit_outer_circle_center, cockpit_outer_circle_radius + ridge_width, plate_height, piece_height, -ridge_height - plate_height);
}