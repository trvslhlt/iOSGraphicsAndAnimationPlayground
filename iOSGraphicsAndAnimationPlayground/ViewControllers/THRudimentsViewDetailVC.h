//
//  THCutomViewDetailVC.h
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THRudimentsViewDetailVC : UIViewController

- (id)initWithCustomViewClass:(NSString*)customViewClass;

@property (strong, nonatomic) NSString *customViewClass;

@end
