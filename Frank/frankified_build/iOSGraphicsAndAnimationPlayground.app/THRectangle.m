//
//  THRectangle.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THRectangle.h"

@implementation THRectangle

- (void)drawRect:(CGRect)rect{
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetGrayStrokeColor(context, 1.0, 1.0);
  CGContextSetLineWidth(context, 10.0);
  
  CGRect rectRect = CGRectMake(0, 0, self.bounds.size.width/2.0, self.bounds.size.height/2.0);
  CGContextStrokeRect(context, rectRect);
}///

@end
