//
//  THBasicLayerFilters.m
//  iOSGraphicsAndAnimationPlayground
//
//  Created by trvslhlt on 9/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THBasicLayerFilters.h"

@interface THBasicLayerFilters()

@property (strong, nonatomic) CALayer *filterLayer;

@end

@implementation THBasicLayerFilters

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      [self.layer addSublayer:self.filterLayer];
    }
    return self;
}

- (CALayer *)filterLayer{
  if (!_filterLayer) {
    _filterLayer = [CALayer layer];
    CGRect bounds = self.bounds;
    _filterLayer.frame = CGRectMake(bounds.size.width * 0.25,
                                     bounds.size.height * 0.25,
                                     bounds.size.width * 0.5,
                                     bounds.size.height * 0.5);
    _filterLayer.contentsGravity = kCAGravityResizeAspect;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"grass_island" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    CIImage *beginImage = [CIImage imageWithContentsOfURL:fileNameAndPath];
    
    // 3
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    _filterLayer.contents = (__bridge id)(cgimg);
    
  }
  return _filterLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
