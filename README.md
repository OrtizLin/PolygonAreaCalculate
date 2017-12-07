# PolygonAreaCalculate

Simple code to calculate polygon area.


Give more then three point to create a polygon and get area.
```javascript
-(double)GetAreaOfPolygon:(NSArray*)pointArray{
    if(pointArray.count<3)
        return 0;
    double s = [pointArray[0]CGPointValue].y *([pointArray[pointArray.count-1]CGPointValue].x-[pointArray[1]CGPointValue].x);
    for(int i=1; i<pointArray.count; i++){
        s += [pointArray[i]CGPointValue].y *([pointArray[i-1]CGPointValue].x-[pointArray[(i+1)%pointArray.count]CGPointValue].x);
    }
    return fabs(s/2);
}
```


Give two point(left_upper & right_down) to create a circle and get area.
```javascript
-(double)GetAreaOfCircle:(NSArray*)pointArray{
    double xr =[pointArray.lastObject CGPointValue].x-[pointArray.firstObject CGPointValue].x;
    double yr =[pointArray.lastObject CGPointValue].y-[pointArray.firstObject CGPointValue].y;
    const double PI = 3.14159; //π
    double area = xr * yr * (PI/4);
    return fabs(area);
}
```


Calculate the distance of two point.
```javascript
-(double)GetDistanceOfTwoPoint:(NSArray*)pointArray{
    float x =[pointArray.firstObject CGPointValue].x-[pointArray.lastObject CGPointValue].x;
    float y =[pointArray.firstObject CGPointValue].y-[pointArray.lastObject CGPointValue].y;
    double distance = sqrt((double)(x*x)+(y*y));
    return fabs(distance);
}
```
