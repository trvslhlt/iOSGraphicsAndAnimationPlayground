//
//  THJoins.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THJoins.h"

@implementation THJoins

- (void)drawRect:(CGRect)rect{
  
  CGPoint tlCorner = CGPointMake(self.bounds.size.width * 0.25, self.bounds.size.height * 0.25);
  CGPoint trCorner = CGPointMake(self.bounds.size.width * 0.75, self.bounds.size.height * 0.25);
  CGPoint brCorner = CGPointMake(self.bounds.size.width * 0.75, self.bounds.size.height * 0.75);
  CGPoint blCorner = CGPointMake(self.bounds.size.width * 0.25, self.bounds.size.height * 0.75);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetLineWidth(context, 20);
  
  CGContextSetLineJoin(context, kCGLineJoinBevel);
  CGContextMoveToPoint(context, tlCorner.x, tlCorner.y);
  CGContextAddLineToPoint(context, trCorner.x, trCorner.y);
  CGContextAddLineToPoint(context, brCorner.x, brCorner.y);
  CGContextStrokePath(context);
  
  CGContextSetLineJoin(context, kCGLineJoinMiter);
  CGContextMoveToPoint(context, brCorner.x, brCorner.y);
  CGContextAddLineToPoint(context, blCorner.x, blCorner.y);
  CGContextAddLineToPoint(context, tlCorner.x, tlCorner.y);
  CGContextStrokePath(context);
  
}///

@end
