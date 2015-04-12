$fn = 45;

xDistance = 11.43;
yDistance = 21.59;
    
module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        translate([rdim,rdim,0]){cylinder(h=zdim,r=rdim);}
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
    }
}


//Z of snap circuits piece 2.25

module snap(){
    color("Grey")
    cylinder(r=6, h=4.5);
}

module snap_hole(x,y,z){
    translate([x,y,z]){
        difference(){
            cylinder(r=8, h=2);
            cylinder(r=7, h=3.1);
        }
    }
}

module trinket(xPos, yPos, zPos){
    color("Blue")
    translate([xPos, yPos, zPos]){
        cube([15, 31, 5]);
    }
}

module trinket_hole(xPos, yPos, zPos){
    translate([xPos, yPos, zPos]){
        difference(){
            cube([18.5, 33, 2]);
            translate([.75,1,0])cube([17, 31, 2.1]);
            
            
            translate([-1,3.5,0])cube([20, 26, 2.1]);
            translate([3,-1,0])cube([12, 40, 2.1]);
        }
    }
}

module wire_holes(){
    xDistance = 50;
    
    translate([12,9, 2]) cube([4, 7, 2.1]);
    translate([12,26, 2]) cube([4, 7, 2.1]);
    translate([12,43, 2]) cube([4, 7, 2.1]);
    
    translate([12-xDistance,9, 2]) cube([4, 7, 2.1]);
    translate([12-xDistance,26, 2]) cube([4, 7, 2.1]);
    translate([12-xDistance,43, 2]) cube([4, 7, 2.1]);
    
}

module mounting_holes(){

    
    
    translate([-13.75,19.5,-1])cylinder(r=1.5, h = 10);
    translate([-13.75+xDistance,19.5,-1])cylinder(r=1.5, h = 10);
    
    translate([-13.75,19.5+yDistance,-1])cylinder(r=1.5, h = 10);
    translate([-13.75+xDistance,19.5+yDistance,-1])cylinder(r=1.5, h = 10);
}


module plate(){
    translate([12,0,0]){
        roundedcube(-45,60,2,10.5);
    }
    snap_hole(20,12,2);
    snap_hole(20,30,2);
    snap_hole(20,48,2);
    
    snap_hole(-42,12,2);
    snap_hole(-42,30,2);
    snap_hole(-42,48,2);
    
    //trinket_hole(-17,15,2);
}

module mounting_cutout(){
    xDistance = 11.43;
    yDistance = 21.59;
    translate([-16.25,17,-.1])cube([5,5,1]);
    translate([-16.25,17+yDistance,-.1])cube([5,5,1]);
    translate([-16.25+xDistance,17,-.1])cube([5,5,1]);
    translate([-16.25+xDistance,17+yDistance,-.1])cube([5,5,1]);
}

module mount_spacers(){
    translate([-13.75,19.5,2])cylinder(r=2.5, h = 2);
    translate([-13.75+xDistance,19.5,2])cylinder(r=2.5, h = 2);
    
    translate([-13.75,19.5+yDistance,2])cylinder(r=2.5, h = 2);
    translate([-13.75+xDistance,19.5+yDistance,2])cylinder(r=2.5, h = 2);
}

module build(){
    //trinket(-15.25,16.5,3);
    difference(){
        union(){
            plate();
            mount_spacers();
        }
        mounting_holes();
        wire_holes();
        //mounting_cutout();
    }
}

build();


