//
//  THCircleWithoutAntialiasing.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THCircleWithoutAntialiasing.h"

@implementation THCircleWithoutAntialiasing

- (void)drawRect:(CGRect)rect{
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextBeginPath(context);
  CGContextSetAllowsAntialiasing(context, NO);
  CGContextSetRGBFillColor(context, 0.0,0.0,0.0,1.0);
  CGContextMoveToPoint(context, self.bounds.size.width/2.0, self.bounds.size.width/2.0);
  CGContextAddArc(context, self.bounds.size.width/2.0, self.bounds.size.width/2.0, self.bounds.size.width/2.0, 0, 2*M_PI, 0);
  
  CGContextClosePath(context);
  CGContextFillPath(context);
  
}///

@end
