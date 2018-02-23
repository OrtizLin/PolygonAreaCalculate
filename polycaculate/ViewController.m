//
//  ViewController.m
//  polycaculate
//
//  Created by Otis Lin on 2017/12/7.
//  Copyright © 2017年 Otis Lin. All rights reserved.
//
#import "ViewController.h"
#import "polygon_calculate.h"
#import "Config.h"
#import <RSDFDatePickerView.h>
@interface ViewController ()<OA_polygonDelegate,RSDFDatePickerViewDelegate,RSDFDatePickerViewDataSource>{
    RSDFDatePickerView*datePickerView;
}

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
    // [self calculate];
    datePickerView = [[RSDFDatePickerView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20)];
    datePickerView.delegate =self;
    datePickerView.dataSource=self;
    [self.view addSubview:datePickerView];
    selectedArray = [[NSMutableArray alloc]init];
}
// Returns YES if the date should be highlighted or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldHighlightDate:(NSDate *)date
{
    return YES;
}

// Returns YES if the date should be selected or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldSelectDate:(NSDate *)date
{
    return YES;
}

// Prints out the selected date.
- (void)datePickerView:(RSDFDatePickerView *)view didSelectDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    NSLog(@"%@",strDate);
    if([selectedArray containsObject:date])
    [selectedArray removeObject:date];
    else
    [selectedArray addObject:date];
    [datePickerView reloadData];
    
    
}
#pragma mark - datasource
// Returns YES if the date should be marked or NO if it should not.
- (BOOL)datePickerView:(RSDFDatePickerView *)view shouldMarkDate:(NSDate *)date
{
    // The date is an `NSDate` object without time components.
    // So, we need to use dates without time components.
    
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
//    NSDateComponents *todayComponents = [calendar components:unitFlags fromDate:[NSDate date]];
//    NSDate *today = [calendar dateFromComponents:todayComponents];
//
//    return [date isEqual:today];
 if([selectedArray containsObject:date])
    return YES;
    else
    return NO;
}

// Returns the color of the default mark image for the specified date.
- (UIColor *)datePickerView:(RSDFDatePickerView *)view markImageColorForDate:(NSDate *)date
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    NSLog(@"%@",strDate);
    if ([strDate containsString:@"10"]) {
        return [UIColor blackColor];
    } else {
        return [UIColor redColor];
    }
}

-(void)calculate{
    /*Calculate polygon*/
    NSMutableArray*arr=[[NSMutableArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(100, 50)],[NSValue valueWithCGPoint:CGPointMake(120, 70)],[NSValue valueWithCGPoint:CGPointMake(150, 90)],[NSValue valueWithCGPoint:CGPointMake(110, 20)],[NSValue valueWithCGPoint:CGPointMake(90, 60)], nil];
    NSMutableArray*arrtwo =[[NSMutableArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(100, 50)],[NSValue valueWithCGPoint:CGPointMake(120, 70)],nil];
    
    NSLog(@"Get area from five point : %f",[self.OA_polygon GetAreaOfPolygon:arr]);
    NSLog(@"Get circle area from two point :%f", [self.OA_polygon GetAreaOfCircle:arrtwo]);
    NSLog(@"Get distance from two point :%f",[self.OA_polygon GetDistanceOfTwoPoint:arrtwo]);
    NSLog(@"WHAT CONFIG: %@",kHost);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
