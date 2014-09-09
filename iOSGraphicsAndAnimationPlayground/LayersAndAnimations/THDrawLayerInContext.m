//
//  THDrawLayerInContext.m
//  iOSGraphicsAndAnimationPlayground
//
//  Created by trvslhlt on 9/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THDrawLayerInContext.h"

@implementation THDrawLayerInContext

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
      label.text = @"never override drawLayer:inContext";
      [self addSubview:label];
    }
    return self;
}

//- (void)drawLayer:(CALayer *)theLayer inContext:(CGContextRef)theContext {
//  CGMutablePathRef thePath = CGPathCreateMutable();
//  
//  CGPathMoveToPoint(thePath,NULL,15.0f,15.f);
//  CGPathAddCurveToPoint(thePath,
//                        NULL,
//                        15.f,250.0f,
//                        295.0f,250.0f,
//                        295.0f,15.0f);
//  
//  CGContextBeginPath(theContext);
//  CGContextAddPath(theContext, thePath);
//  
//  CGContextSetLineWidth(theContext, 5);
//  CGContextStrokePath(theContext);
//  
//  // Release the path
//  CFRelease(thePath);
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
