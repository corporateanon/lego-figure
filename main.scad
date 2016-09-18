module Head() {
  $fn=20;
  
  difference() {
    union() {
      minkowski() {
        cylinder(d=5, h=5);
        sphere(d=2);
      }
      translate([0,0,5.5])
        difference() {
          cylinder(d=3, h=1);
          translate([0,0,0.5]) cylinder(d=2, h=1);
        }
      translate([0, 0, -2]) {
        difference() {
          cylinder(d=5, h=2);
          translate([0, 0, -0.5]) cylinder(d=4, h=2);
        }
      }
    }
    
    translate([0, 0, -2])
      cylinder(d=4, h=6);
  }
}

module Body() {
  translate([0, 0, 12])
    cylinder(d=3, h=5, $fn=10);

  translate([6, 2.5, 0])
    rotate([0, -90, 0])
      difference() {
        rotate([90, 0, 0])
          linear_extrude(height=5)
            polygon([
              [0, 0.2],
              [2, 0.2],
              [2, 0],
              [12, 2],
              [12, 10],
              [2, 12],
              [2, 11.8],
              [0, 11.8],
              [0, 0],
            ]);
        translate([0, -2.5, 0])
          cylinder(d=4.5, h=12, $fn=12);
      }
}

module Leg() {
  translate([2.5, 0, 0])
    rotate([0, -90, 0])
      linear_extrude(height=5)
        union() {
          circle(d=4.5, $fn=10);
          translate([-7, -2.25])
            polygon([
              [0,0],
              [7,0],
              [7,3.5],
              [2,3.5],
              [2,5],
              [0,5],
              [0,0],
            ]);
        }
}

module Arm() {
  mirror([0, 1, 0]) translate([6.1, -2.3, 1.7]) 
    rotate([78.5, 0, 90])
      rotate([0, 0, 37.1])
        difference() {
          linear_extrude(height=3)
            polygon([
              [0, 0],
              [5, 0],
              [9, 5],
              [8.5, 6.2],
              [7.4, 6.9],
              [6, 7],
              [3, 3],
              [0, 3],
              [0, 0],
            ]);
          
            translate([6, 0, 3])
              rotate([0, 20, 45])
                cube([10, 5, 5]);
        }
}

module ArmLeft() {
  Arm();
}
module ArmRight() {
  mirror([1, 0, 0]) Arm();
}

module LegRight() {
  translate([-3, 0, 0]) Leg();
}
module LegLeft() {
  translate([3, 0, 0]) Leg();
}

translate([0, 0, 14]) color("orange") Head();
color([0.5, 0.5, 0.5]) Body();

rotate([50, 0, 0])
  color("red") LegRight();
rotate([-50, 0, 0])
  color("red") LegLeft();

color("green") ArmLeft();
color("green") ArmRight();
