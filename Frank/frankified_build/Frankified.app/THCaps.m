//
//  THCaps.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THCaps.h"

@implementation THCaps

- (void)drawRect:(CGRect)rect{
  int numberOfLines = 3;
  CGFloat spacingBetweenLines = self.bounds.size.height / (numberOfLines + 1);
  CGFloat viewWidth = self.bounds.size.width;
  
  CGPoint pt11 = CGPointMake(kAppGridWidth, spacingBetweenLines);
  CGPoint pt12 = CGPointMake(viewWidth - kAppGridWidth, spacingBetweenLines);
  
  CGPoint pt21 = CGPointMake(kAppGridWidth, spacingBetweenLines * 2);
  CGPoint pt22 = CGPointMake(viewWidth - kAppGridWidth, spacingBetweenLines * 2);
  
  CGPoint pt31 = CGPointMake(kAppGridWidth, spacingBetweenLines * 3);
  CGPoint pt32 = CGPointMake(viewWidth - kAppGridWidth, spacingBetweenLines * 3);

  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetLineWidth(context, 20);
  
  CGContextSetLineCap(context, kCGLineCapButt);
  CGContextMoveToPoint(context, pt11.x, pt11.y);
  CGContextAddLineToPoint(context, pt12.x, pt12.y);
  CGContextStrokePath(context);
  
  CGContextSetLineCap(context, kCGLineCapRound);
  CGContextMoveToPoint(context, pt21.x, pt21.y);
  CGContextAddLineToPoint(context, pt22.x, pt22.y);
  CGContextStrokePath(context);
  
  CGContextSetLineCap(context, kCGLineCapSquare);
  CGContextMoveToPoint(context, pt31.x, pt31.y);
  CGContextAddLineToPoint(context, pt32.x, pt32.y);
  CGContextStrokePath(context);
  
}///

@end
