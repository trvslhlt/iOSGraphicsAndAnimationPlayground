//
//  THClippingPath.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THClippingPath.h"

@implementation THClippingPath

- (void)drawRect:(CGRect)rect{
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGFloat viewWidth = self.bounds.size.width;
  CGFloat viewHeight = self.bounds.size.height;
  
  CGContextBeginPath(context);
  CGContextAddArc(context, 50, 50, viewWidth/2.0, 0, M_PI *2, 0);
  CGContextClosePath(context);
  CGContextClip(context);
  
  CGContextSetFillColorWithColor(context, [[UIColor grayColor] CGColor]);
  CGContextFillRect(context, CGRectMake(0.1 * viewWidth, 0.1 * viewHeight, 0.8 * viewWidth, 0.8 * viewHeight));
  
  
}///

@end
