//
//  THLabeledView.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THLabeledView.h"

@implementation THLabeledView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self addSubview:self.label];
    self.backgroundColor = [UIColor lightGrayColor];
  }
  return self;
}

#pragma mark - Accessors

- (UILabel *)label{
  
  if (!_label) {
    _label = [[UILabel alloc] initWithFrame:self.bounds];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = NSStringFromClass([self class]);
    _label.textColor = kMainTextColor;
  }
  return _label;
}

@end
