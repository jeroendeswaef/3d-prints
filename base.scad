//(-152.3987341772152, -147.2594936708861)
//'305.26618141514257

circle_radius = 305.27;
circle_center = [-152.4, -147.26, 0];

width = 30;

linear_extrude(3)
difference() {
    translate(circle_center)
    circle(circle_radius, $fn=180);
    
    // inner circle
    //(-242.92, -229.67)
    // 409.4
    translate([-277.92, -237.47])
    circle(441.27, $fn=180);
    
    // remove everything on the negative x-axis
    translate([-circle_radius * 2, -circle_radius * 2, 0])
    square([circle_radius * 2, circle_radius * 4]);
    
    // remove everything on the negative y-axis
    translate([0, -circle_radius * 2])
    square(circle_radius * 2);
    
    // slicing height
    translate([0, 38])
    square(circle_radius * 2);
    
    //square([110 - width, 38]);
}