//
//  THQuadraticBezierCurve.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THQuadraticBezierCurve.h"

@implementation THQuadraticBezierCurve

- (void)drawRect:(CGRect)rect{
  
  CGPoint startPoint = CGPointMake(0, self.bounds.size.height/2.0);
  CGPoint controlPoint = CGPointMake(self.bounds.size.width, 0.0f);
  CGPoint endPoint = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height);
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
  CGContextMoveToPoint(context, startPoint.x, startPoint.y);
  CGContextAddLineToPoint(context, controlPoint.x, controlPoint.y);
  CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
  CGContextStrokePath(context);
  
  CGContextSetGrayStrokeColor(context, 1.0, 1.0);
  CGContextSetLineWidth(context, 10.0);
  
  CGContextMoveToPoint(context, startPoint.x, startPoint.y);
  CGContextAddQuadCurveToPoint(context, controlPoint.x, controlPoint.y, endPoint.x, endPoint.y);
  
  CGContextStrokePath(context);
  
  
}///


@end
