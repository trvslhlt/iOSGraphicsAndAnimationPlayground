//
//  THContextEOFillPath.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THContextEOFillPath.h"

@implementation THContextEOFillPath

- (void)drawRect:(CGRect)rect{
  
  CGPoint center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
  CGFloat radius = (center.x > center.y) ? center.y : center.x;
  CGFloat radiusDecrement = 10;
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  while (radius > radiusDecrement) {
    CGContextMoveToPoint(context, center.x + radius, center.y);
    CGContextAddArc(context, center.x, center.y, radius, 0, 2 * M_PI, 0);
    radius -= radiusDecrement;
  }
  
  CGContextEOFillPath(context);
  
}///

@end
