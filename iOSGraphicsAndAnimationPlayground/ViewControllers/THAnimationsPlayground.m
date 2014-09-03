//
//  THAnimationsPlayground.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 9/1/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THAnimationsPlayground.h"
#import "THCALayerWithImage.h"

#define kCellReuseID @"cellReuseID"

@interface THAnimationsPlayground()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *animationsArray;
@property (strong, nonatomic) UIView *animationTableTab;

@property (nonatomic) BOOL displayAnimationsTable;

@property (strong, nonatomic) NSString *animationPlaygroundViewSubclass;
@property (strong, nonatomic) THCALayerWithImage *animationPlaygroundView;

@end

@implementation THAnimationsPlayground

- (id)init{
  self = [super init];
  if (self) {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.animationTableTab];
    _displayAnimationsTable = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
  }
  return self;
}

#pragma mark - Accessors
- (NSString *)title{
  return [NSString stringWithFormat:@"%@",[self class]];
}

- (THCALayerWithImage *)animationPlaygroundView{
  if (!_animationPlaygroundView) {
    Class apvs = NSClassFromString(self.animationPlaygroundViewSubclass);
    if (!apvs) {
      apvs = [THCALayerWithImage class];
    }
    _animationPlaygroundView = [[apvs alloc] initWithFrame:self.view.bounds];
    _animationPlaygroundView.alpha = 0.0;
  }
  return _animationPlaygroundView;
}

- (UITableView *)tableView{
  if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseID];
  }
  return _tableView;
}

- (NSArray *)animationsArray{
  if (!_animationsArray) {
    _animationsArray = [NSArray arrayWithObjects:@"THCALayerWithImage", nil];
  }
  return _animationsArray;
}

- (UIView *)animationTableTab{
  if (!_animationTableTab) {
    CGRect frame = CGRectMake(self.view.bounds.size.width - kAppGridWidth, self.view.bounds.size.height - kAppGridWidth, kAppGridWidth * 3, kAppGridWidth);
    _animationTableTab = [[UIView alloc] initWithFrame:frame];
    _animationTableTab.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableTabTapped:)];
    [_animationTableTab addGestureRecognizer:tgr];
  }
  return _animationTableTab;
}

- (void)setDisplayAnimationsTable:(BOOL)displayAnimationsTable{
  if (_displayAnimationsTable == displayAnimationsTable) { return; }
  _displayAnimationsTable = displayAnimationsTable;
  
  CGFloat xTranslationToHide = self.view.bounds.size.width * -1;
  static CGRect displayedTableFrame, displayedTabFrame, hiddenTableFrame, hiddenTabFrame;
  static dispatch_once_t token;
  dispatch_once(&token, ^{
    displayedTableFrame = self.tableView.frame;
    displayedTabFrame = self.animationTableTab.frame;
    hiddenTableFrame = displayedTableFrame;
    hiddenTableFrame.origin.x = hiddenTableFrame.origin.x + xTranslationToHide;
    hiddenTabFrame = displayedTabFrame;
    hiddenTabFrame.origin.x = hiddenTabFrame.origin.x + xTranslationToHide;
  });
  
  [UIView animateWithDuration:kPrimaryAnimationDuration animations:^{
    if (displayAnimationsTable) {
      self.tableView.frame = displayedTableFrame;
      self.animationTableTab.frame = displayedTabFrame;
      self.tableView.alpha = 1.0;
    } else {
      self.tableView.frame = hiddenTableFrame;
      self.animationTableTab.frame = hiddenTabFrame;
      self.tableView.alpha = 0.0;
    }
  }];
}

#pragma mark - IBActions
- (IBAction)tableTabTapped:(UITapGestureRecognizer *)sender{
  self.displayAnimationsTable = !self.displayAnimationsTable;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.animationsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID forIndexPath:indexPath];
  
  [self configureCell:cell];
  cell.textLabel.text = [self.animationsArray objectAtIndex:indexPath.row];
  return cell;
}

- (void)configureCell:(UITableViewCell*)cell{
  cell.backgroundColor = [UIColor clearColor];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  self.displayAnimationsTable = NO;
  
  [self transitionToNewAnimationPlaygroundViewNamed:[self.animationsArray objectAtIndex:indexPath.row]];
  
}

- (void)transitionToNewAnimationPlaygroundViewNamed:(NSString *)playgroundName{
  
  [UIView animateWithDuration:kPrimaryAnimationDuration animations:^{
    self.animationPlaygroundView.alpha = 0.0;
  } completion:^(BOOL finished){
    [self.animationPlaygroundView removeFromSuperview];
    self.animationPlaygroundView = nil;
    self.animationPlaygroundViewSubclass = playgroundName;
    
    [self.view addSubview:self.animationPlaygroundView];
    [self.view sendSubviewToBack:self.animationPlaygroundView];
    [UIView animateWithDuration:kPrimaryAnimationDuration animations:^{
      self.animationPlaygroundView.alpha = 1.0;
    }];
  }];
  
}

@end












