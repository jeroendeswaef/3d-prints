// Returns the center and radius of the circle passing the given 3 points.
function define_circle(p1, p2, p3) = define_circle_helper(p1, p2, p3, get_bc(p1, get_temp(p2)), get_cd(p3, get_temp(p2)), get_det(p1, p2, p3));

function define_circle_helper(p1, p2, p3, bc, cd, det) = abs(get_det(p1, p2, p3)) < 1.0e-6 ? undef : [ [get_cx(p1, p2, p3, bc, cd, det), get_cy(p1, p2, p3, bc, cd, det)], sqrt((get_cx(p1, p2, p3, bc, cd, det) - p1[0])^2 + (get_cy(p1, p2, p3, bc, cd, det) - p1[1])^2)];

function get_temp(p2) = p2[0] * p2[0] + p2[1] * p2[1];
function get_bc(p1, temp) = (p1[0] * p1[0] + p1[1] * p1[1] - temp) / 2;
function get_cd(p3, temp) = (temp - p3[0] * p3[0] - p3[1] * p3[1]) / 2;
function get_det(p1, p2, p3) = (p1[0] - p2[0]) * (p2[1] - p3[1]) - (p2[0] - p3[0]) * (p1[1] - p2[1]);
function get_cx(p1, p2, p3, bc, cd, det) = (bc*(p2[1] - p3[1]) - cd*(p1[1] - p2[1])) / det;
function get_cy(p1, p2, p3, bc, cd, det) = ((p1[0] - p2[0]) * cd - (p2[0] - p3[0]) * bc) / det;

echo(define_circle([204 - 110, 0], [189 - 110, 22], [176 - 110, 39]));

tracing_points_outer = [ [225 - 110, 0], [188 - 110, 53], [138 - 110, 99] ];