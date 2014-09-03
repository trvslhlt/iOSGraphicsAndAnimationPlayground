//
//  THMultiplyBlendMode.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THMultiplyBlendMode.h"

@implementation THMultiplyBlendMode

- (void)drawRect:(CGRect)rect{
  
  NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor whiteColor], [UIColor blueColor], [UIColor orangeColor], [UIColor lightGrayColor], [UIColor purpleColor], [UIColor blackColor], nil];
  
  CGFloat barThickness = 30.0f;
  CGFloat viewWidth = self.bounds.size.width;
  CGFloat viewHeight = self.bounds.size.height;
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  for (int i = 0; i < colors.count; i++) {
    CGRect rect = CGRectMake(i * barThickness, 0, barThickness, viewHeight);
    CGContextSetFillColorWithColor(context, [[colors objectAtIndex:i] CGColor]);
    CGContextFillRect(context, rect);
  }
  
  CGContextSetBlendMode(context, kCGBlendModeMultiply);
  
  for (int i = 0; i < colors.count; i++) {
    CGRect rect = CGRectMake(0, i * barThickness, viewWidth, barThickness);
    CGContextSetFillColorWithColor(context, [[colors objectAtIndex:i] CGColor]);
    CGContextFillRect(context, rect);
  }
  
}///

@end
