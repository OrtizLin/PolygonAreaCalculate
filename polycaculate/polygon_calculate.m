//
//  polygon_calculate.m
//  polycaculate
//
//  Created by Otis Lin on 2017/12/7.
//  Copyright © 2017年 Otis Lin. All rights reserved.
//

#import "polygon_calculate.h"

@implementation polygon_calculate

-(double)GetAreaOfPolygon:(NSArray*)pointArray{
    if(pointArray.count<3)
        return 0;
    double s = [pointArray[0]CGPointValue].y *([pointArray[pointArray.count-1]CGPointValue].x-[pointArray[1]CGPointValue].x);
    for(int i=1; i<pointArray.count; i++){
        s += [pointArray[i]CGPointValue].y *([pointArray[i-1]CGPointValue].x-[pointArray[(i+1)%pointArray.count]CGPointValue].x);
    }
    return fabs(s/2);
}
-(double)GetAreaOfCircle:(NSArray*)pointArray{
    double xr =[pointArray.lastObject CGPointValue].x-[pointArray.firstObject CGPointValue].x;
    double yr =[pointArray.lastObject CGPointValue].y-[pointArray.firstObject CGPointValue].y;
    const double PI = 3.14159; //π
    double area = xr * yr * (PI/4);
    return fabs(area);
}
-(double)GetDistanceOfTwoPoint:(NSArray*)pointArray{
    float x =[pointArray.firstObject CGPointValue].x-[pointArray.lastObject CGPointValue].x;
    float y =[pointArray.firstObject CGPointValue].y-[pointArray.lastObject CGPointValue].y;
    double distance = sqrt((double)(x*x)+(y*y));
    return fabs(distance);
}

@end
