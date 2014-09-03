//
//  THContextDrawPath.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THContextDrawPath.h"

@implementation THContextDrawPath

- (void)drawRect:(CGRect)rect{
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGFloat colorComponents[] = {0.0,0.0,1.0,1.0};
  CGContextSetStrokeColor(context, colorComponents);
  CGContextSetLineWidth(context, 10);
  
  CGContextMoveToPoint(context, self.bounds.size.width, self.bounds.size.height/2.0);
  
  CGContextAddEllipseInRect(context, self.bounds);
  
  CGContextDrawPath(context, kCGPathFillStroke);
}///

@end
