//
//  THViewController.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THRudimentsGalleryVC.h"
#import "THRudimentsViewDetailVC.h"

#import "THDrawRectImplementationScraper.h"

@interface THRudimentsGalleryVC ()

//model
@property (strong, nonatomic) NSArray *customViewClasses;

//views
@property (strong, nonatomic) UIScrollView *scrollView;

//configuration //!!!!!THESE SHOULD BE CONSTANTS
@property (nonatomic) CGFloat heightOfViews;
@property (nonatomic) CGFloat widthOfViews;

@end

@implementation THRudimentsGalleryVC

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self setup];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Accessors
- (NSString *)title{
  return [NSString stringWithFormat:@"%@",[self class]];;
}

- (CGFloat)heightOfViews {
  return 150.0f;
}

- (CGFloat)widthOfViews {
  return (self.view.bounds.size.width - (3 * kAppGridWidth)) / 2.0;
}

- (UIScrollView *)scrollView {
  if (!_scrollView) {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    int numberOfCustomViews = self.customViewClasses.count;
    int rowsOfCustomViews = numberOfCustomViews / 2 + numberOfCustomViews % 2;
    CGFloat contentHeight = (rowsOfCustomViews * (kAppGridWidth + self.heightOfViews)) + kAppGridWidth;
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, contentHeight);
    [self.view addSubview:_scrollView];
  }
  return _scrollView;
}

- (NSArray *)customViewClasses{
  if (!_customViewClasses) {
    _customViewClasses = [NSArray arrayWithObjects:@"THCircle", @"THRectangle", @"THCircleWithoutAntialiasing", @"THQuadraticBezierCurve", @"THCubicBezierCurve", @"THJoins", @"THCaps", @"THLineDashPatterns", @"THContextDrawPath", @"THContextEOFillPath", @"THMultiplyBlendMode", @"THClippingPath", nil];
  }
  return _customViewClasses;
}

#pragma mark - Setup

- (void)setup{
  self.view.backgroundColor = [UIColor whiteColor];
  [self addCustomViewsToScrollView];
}

- (void)addCustomViewsToScrollView{
  for (int i = 0; i < self.customViewClasses.count; i++) {
    NSString *className = [self.customViewClasses objectAtIndex:i];
    //create an instance of the class with the correct frame;
    CGRect frame = [self getFrameAtIndex:i];
    UIView *customView = [[NSClassFromString(className) alloc] initWithFrame:frame];
    //add gesturerecognizer
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDetailForCustomView:)];
    [customView addGestureRecognizer:tgr];
    //add the view to the scroll view
    [self.scrollView addSubview:customView];
    
  }
}

- (CGRect)getFrameAtIndex:(int)index{
  int row = (index + 1) / 2 + (index + 1) % 2;
  int column = (index % 2) + 1;
  CGFloat originX = (column * kAppGridWidth) + ((column - 1) * self.widthOfViews);
  CGFloat originY = (row * kAppGridWidth) + ((row - 1) * self.heightOfViews);
  return CGRectMake(originX, originY, self.widthOfViews, self.heightOfViews);
}

#pragma mark - IBActions

-(IBAction)showDetailForCustomView:(UITapGestureRecognizer *)sender {

  NSString *customViewClass = NSStringFromClass([sender.view class]);
  THRudimentsViewDetailVC *thcdVC = [[THRudimentsViewDetailVC alloc] initWithCustomViewClass:customViewClass];
  
  [self presentViewController:thcdVC animated:YES completion:nil];
}

@end















