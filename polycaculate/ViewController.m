//
//  ViewController.m
//  polycaculate
//
//  Created by Otis Lin on 2017/12/7.
//  Copyright © 2017年 Otis Lin. All rights reserved.
//
#import "ViewController.h"
#import "polygon_calculate.h"
@interface ViewController ()<OA_polygonDelegate>

@end

@implementation ViewController
-(polygon_calculate*)OA_polygon
{
    polygon_calculate*api=[[polygon_calculate alloc]init];
    api.delegate=self;
    return api;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray*arr=[[NSMutableArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(100, 50)],[NSValue valueWithCGPoint:CGPointMake(120, 70)],[NSValue valueWithCGPoint:CGPointMake(150, 90)],[NSValue valueWithCGPoint:CGPointMake(110, 20)],[NSValue valueWithCGPoint:CGPointMake(90, 60)], nil];
    NSMutableArray*circleArr =[[NSMutableArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(100, 50)],[NSValue valueWithCGPoint:CGPointMake(120, 70)],nil];
    
   NSLog(@"%f",[self.OA_polygon GetAreaOfPolygon:arr]);
   NSLog(@"%f", [self.OA_polygon GetAreaOfCircle:circleArr]);
   NSLog(@"%f",[self.OA_polygon GetDistanceOfTwoPoint:circleArr]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
