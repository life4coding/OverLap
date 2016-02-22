//
//  Rectangle.h
//  OverLap
//
//  Created by kiwi on 16/2/22.
//  Copyright © 2016年 parentheart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"
@interface Rectangle : NSObject

@property (nonatomic, strong) XYPoint *origin;
@property int width, height;

-(XYPoint *)centerPoint;
//求出中心点

-(instancetype)initWithOrigin:(XYPoint *)origin width:(int)width height:(int)height;
//自定义的初始化函数，避免在main文件一个一个赋值，让代码更简洁易懂

-(id)getOverlapRec:(Rectangle *)Rec;
// 计算重叠矩形的函数
@end
