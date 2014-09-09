//
//  THImplicitAnimations.m
//  iOSGraphicsAndAnimationPlayground
//
//  Created by trvslhlt on 9/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THImplicitAnimations.h"

@implementation THImplicitAnimations

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      [self.layer addSublayer:self.myLayer];
      [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animate:)]];
    }
    return self;
}

- (CALayer *)myLayer{
  if (!_myLayer) {
    _myLayer = [[CALayer alloc] init];
    _myLayer.frame = CGRectInset(self.bounds, 100, 200);
    _myLayer.backgroundColor = [[UIColor blueColor] CGColor];
  }
  return _myLayer;
}


- (IBAction)animate:(id)sender{
  self.isInDefaultState = !self.isInDefaultState;
  if (self.isInDefaultState) {
    self.myLayer.borderWidth = 0.0;
    self.myLayer.shadowOpacity = 1.0;
  } else {
    self.myLayer.borderWidth = 2.0;
    self.myLayer.shadowOpacity = 0.0;

  }
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
