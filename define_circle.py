import numpy as np

def define_circle(p1, p2, p3):
    """
    Returns the center and radius of the circle passing the given 3 points.
    In case the 3 points form a line, returns (None, infinity).
    """
    temp = p2[0] * p2[0] + p2[1] * p2[1]
    bc = (p1[0] * p1[0] + p1[1] * p1[1] - temp) / 2
    cd = (temp - p3[0] * p3[0] - p3[1] * p3[1]) / 2
    det = (p1[0] - p2[0]) * (p2[1] - p3[1]) - (p2[0] - p3[0]) * (p1[1] - p2[1])
    
    if abs(det) < 1.0e-6:
        return (None, np.inf)
    
    # Center of circle
    cx = (bc*(p2[1] - p3[1]) - cd*(p1[1] - p2[1])) / det
    cy = ((p1[0] - p2[0]) * cd - (p2[0] - p3[0]) * bc) / det
    
    radius = np.sqrt((cx - p1[0])**2 + (cy - p1[1])**2)
    return ((round(cx, 2), round(cy, 2)), round(radius, 2))

#outer
#center, radius = define_circle([225 - 110, 0], [188 - 110, 53], [138 - 110, 99])

#inner
#center, radius = define_circle([206 - 110, 0], [190 - 110, 22], [176 - 110, 39])
center, radius = define_circle([204 - 110, 0], [189 - 110, 22], [176 - 110, 39])
if center is not None:
    print(center)
    print(radius)
else:
    print("no center found")
