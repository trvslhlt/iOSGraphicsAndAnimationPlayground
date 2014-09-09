//
//  THLineDashPatterns.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THLineDashPatterns.h"

@implementation THLineDashPatterns

- (void)drawRect:(CGRect)rect{
  
  CGPoint center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
  CGFloat radius = self.bounds.size.width/2.0;
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 10.0f);

  CGFloat dash1[] = {10,20,5,20,1,20};
  CGContextSetLineDash(context, 0, dash1, 6);
  CGContextMoveToPoint(context, center.x + radius, center.y);
  CGContextAddArc(context, center.x, center.y, radius, 0, 2*M_PI, YES);
  CGContextStrokePath(context);

  radius *= 0.8;
  CGFloat dash2[] = {5,5};
  CGContextSetLineDash(context, 0, dash2, 2);
  CGContextMoveToPoint(context, center.x + radius, center.y);
  CGContextAddArc(context, center.x, center.y, radius, 0, 2*M_PI, YES);
  CGContextStrokePath(context);
}///

@end
