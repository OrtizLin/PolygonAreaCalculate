//
//  polygon_calculate.h
//  polycaculate
//
//  Created by Otis Lin on 2017/12/7.
//  Copyright © 2017年 Otis Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class polygon_calculate;

@protocol OA_polygonDelegate<NSObject>
@end

@interface polygon_calculate : NSObject
@property(nonatomic) id<OA_polygonDelegate>delegate;
-(double)GetAreaOfPolygon:(NSArray*)pointArray;
-(double)GetAreaOfCircle:(NSArray*)pointArray;
-(double)GetDistanceOfTwoPoint:(NSArray*)pointArray;
@end
