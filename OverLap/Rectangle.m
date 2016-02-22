//
//  Rectangle.m
//  OverLap
//
//  Created by kiwi on 16/2/22.
//  Copyright © 2016年 parentheart. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (instancetype)init{
    self = [super init];
    if (self) {
        XYPoint *originPonit = [[XYPoint alloc] init];
        self.origin = originPonit;
    }
    
    return self;
}


-(instancetype)initWithOrigin:(XYPoint *)origin width:(int)width height:(int)height{
    self = [self init];
    
    self.origin = origin;
    self.width = width;
    self.height = height;
    
    return self;
}


-(BOOL)containsPonit:(XYPoint *)point{
    
    BOOL containPoint;
    
    if ((point.xValue <= self.origin.xValue+ self.width)&&(point.yValue <= self.origin.yValue+ self.height)) {
        containPoint = YES;
    }else {
        containPoint = NO;
    }
    
    return  containPoint;
}


-(XYPoint *)centerPoint{
    
    XYPoint *centerPoint = [[XYPoint alloc] init];
    
    centerPoint.xValue = self.origin.xValue + self.width/2;
    centerPoint.yValue = self.origin.yValue + self.height/2;
    
    return centerPoint;
}

-(id)getOverlapRec:(Rectangle *)Rec{
    
    Rectangle *overLapRec = [[Rectangle alloc] init];
    
    overLapRec.origin.xValue = self.origin.xValue > Rec.origin.xValue ? self.origin.xValue : Rec.origin.xValue;
    overLapRec.origin.yValue = self.origin.yValue > Rec.origin.yValue ? self.origin.yValue : Rec.origin.yValue;
    //重叠举行的origin的x，y应该是A和B中的较大值
    
    XYPoint* diagonalPoint = [[XYPoint alloc] init];
    diagonalPoint.xValue = (self.origin.xValue+self.width) < (Rec.origin.xValue+Rec.width) ? (self.origin.xValue+self.width) :(Rec.origin.xValue+Rec.width);
    diagonalPoint.yValue = (self.origin.yValue+self.height) < (Rec.origin.yValue+Rec.height) ? (self.origin.yValue+self.height) :(Rec.origin.yValue+Rec.height);
    //重叠矩形origin对角线上的顶点
    
    overLapRec.width = diagonalPoint.xValue - overLapRec.origin.xValue;
    overLapRec.height = diagonalPoint.yValue - overLapRec.origin.yValue;
    //求出重叠矩形的宽和高
    
    return overLapRec;
    
}

@end
