//
//  THCutomViewDetailVC.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 8/31/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THRudimentsViewDetailVC.h"
#import "THLabeledView.h"
#import "THDrawRectImplementationScraper.h"

#define kHeightOfCustomView 250.0f

@interface THRudimentsViewDetailVC()

@property (strong, nonatomic) THLabeledView *labeledView;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UITextView *codeView;

@end

@implementation THRudimentsViewDetailVC

- (id)initWithCustomViewClass:(NSString*)customViewClass{
  self = [super init];
  if (self) {
    self.customViewClass = customViewClass;
  }
  return self;
}

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
- (THLabeledView *)labeledView{
  if (!_labeledView) {
    CGRect rect = CGRectMake(kAppGridWidth, kAppGridWidth, self.view.bounds.size.width - 2*kAppGridWidth, kHeightOfCustomView);
    Class labeledViewSubclass = NSClassFromString(self.customViewClass);
    _labeledView = [[labeledViewSubclass alloc] initWithFrame:rect];
  }
  return _labeledView;
}

- (UITextView *)codeView{
  if (!_codeView) {
    CGRect frame = CGRectMake(kAppGridWidth, kHeightOfCustomView + kAppGridWidth * 2, self.view.bounds.size.width - 2*kAppGridWidth, self.view.bounds.size.height - (kAppGridWidth*3 + kHeightOfCustomView));
    _codeView = [[UITextView alloc] initWithFrame:frame];
    _codeView.text = [THDrawRectImplementationScraper drawRectImpForClass:self.customViewClass];
  }
  return _codeView;
}

- (UIButton *)backButton{
  if (!_backButton) {
    CGRect rect = CGRectMake(0, self.view.bounds.size.height - kAppGridWidth, kAppGridWidth, kAppGridWidth);
    _backButton = [[UIButton alloc] initWithFrame:rect];
    [_backButton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    _backButton.backgroundColor = [UIColor redColor];
  }
  return _backButton;
}

#pragma mark - Setup
- (void)setup{
  [self.view addSubview:self.labeledView];
  [self.view addSubview:self.codeView];
  [self.view addSubview:self.backButton];
  self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - IBActions
- (void)backButtonTapped:(UIButton *)sender{
  [self dismissViewControllerAnimated:YES completion:nil];
}
@end













