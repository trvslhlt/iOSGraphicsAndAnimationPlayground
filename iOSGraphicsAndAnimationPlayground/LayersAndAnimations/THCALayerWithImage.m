//
//  THAnimationPlaygroundView.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 9/1/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THCALayerWithImage.h"

@implementation THCALayerWithImage

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self.layer addSublayer:self.imageLayer];
  }
  return self;
}

#pragma mark - Accessor
- (CALayer *)imageLayer{
  if (!_imageLayer) {
    _imageLayer = [CALayer layer];
    _imageLayer.cornerRadius = 5.0;
    _imageLayer.bounds = self.bounds;
    _imageLayer.contentsGravity = kCAGravityResizeAspect;
    _imageLayer.contents = (id)[UIImage imageNamed:@"grass_island.png"].CGImage;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    _imageLayer.bounds = CGRectMake(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
    [_imageLayer setPosition:CGPointMake([self bounds].size.width/2, [self bounds].size.height/2)];
    
    _imageLayer.backgroundColor = [[UIColor colorWithRed:0.23 green:0.1 blue:1.0 alpha:0.5] CGColor];
    _imageLayer.borderWidth = 5.0;
    _imageLayer.shadowOpacity = 0.6;

  }
  return _imageLayer;
}

@end
