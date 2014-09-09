//
//  THCubicBezierCurve.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THCubicBezierCurve.h"

@implementation THCubicBezierCurve

- (void)drawRect:(CGRect)rect{
  
  CGPoint startPoint = CGPointMake(0, self.bounds.size.height/2.0);
  CGPoint controlPoint1 = CGPointMake(self.bounds.size.width, 0.0f);
  CGPoint controlPoint2 = CGPointMake(0.0f, self.bounds.size.height);
  CGPoint endPoint = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height);
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
  CGContextMoveToPoint(context, startPoint.x, startPoint.y);
  CGContextAddLineToPoint(context, controlPoint1.x, controlPoint1.y);
  CGContextAddLineToPoint(context, controlPoint2.x, controlPoint2.y);
  CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
  CGContextStrokePath(context);
  
  CGContextSetGrayStrokeColor(context, 1.0, 1.0);
  CGContextSetLineWidth(context, 10.0);
  
  CGContextMoveToPoint(context, startPoint.x, startPoint.y);
  CGContextAddCurveToPoint(context, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
  
  CGContextStrokePath(context);
  
}///

@end
