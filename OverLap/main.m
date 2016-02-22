//
//  main.m
//  OverLap
//
//  Created by kiwi on 16/2/22.
//  Copyright © 2016年 parentheart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        XYPoint *originA = [[XYPoint alloc] init];
        originA.xValue = 1;
        originA.yValue = 1;
        
        XYPoint *originB = [[XYPoint alloc] init];
        originB.xValue = 5;
        originB.yValue = 5;
        
        
        Rectangle *recA = [[Rectangle alloc] initWithOrigin:originA width:20 height:30];
        Rectangle *recB = [[Rectangle alloc] initWithOrigin:originB width:30 height:40];
        //创建两个矩形A和B
        
        
        
        XYPoint *centerPointA = [recA centerPoint];
        XYPoint *centerPointB = [recB centerPoint];
        //取A和B的中心点, centerPoint函数在Rectangle类中有定义
        
        
        
        BOOL condition1 = abs(centerPointA.xValue - centerPointB.xValue) < (recA.width/2+recB.width/2);
        BOOL condition2 = abs(centerPointA.yValue - centerPointB.yValue) < (recA.height/2+recB.height/2);
        //取中心点距离
        //abc() 函数用来取绝对值

        if (condition1 && condition2) {
            //判断是否重叠
            NSLog(@"these two rectangle overlaps!");
            
           Rectangle *overlapRec = [recA getOverlapRec:recB];
            //如果重叠了，求出重叠的矩形， getOverLapRec 函数在Rectangle类中定义
            
            NSLog(@"new rec's origin is (%d,%d),width is %d,height is %d", overlapRec.origin.xValue, overlapRec.origin.yValue, overlapRec.width, overlapRec.height);
            
            
        }else {
            NSLog(@"these two are not overlap");
        }
        
    }
    return 0;
}

