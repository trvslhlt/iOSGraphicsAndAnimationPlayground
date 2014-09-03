//
//  THHomeMenu.m
//  Quartz2DProgrammingGuide
//
//  Created by trvslhlt on 9/1/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

#import "THHomeMenu.h"
#import "THRudimentsGalleryVC.h"
#import "THAnimationsPlayground.h"

#define kCellReuseID @"cellReuseID"

@interface THHomeMenu()

@property (strong, nonatomic) NSArray *channels;

@end

@implementation THHomeMenu

- (id)init{
  self = [super init];
  if (self) {
    [self.view addSubview:self.tableView];
  }
  return self;
}

//- (void)viewDidLoad{
//  [super viewDidLoad];
//  [self.tableView reloadData];
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//  [self.tableView reloadData];
//}
#pragma mark - Accessors
- (NSString *)title{
  return [NSString stringWithFormat:@"%@",[self class]];
}

- (UITableView *)tableView{
  if (!_tableView) {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseID];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView reloadData];
  }
  return _tableView;
}

- (NSArray *)channels{
  if (!_channels) {
    _channels = [NSArray arrayWithObjects:@"THRudimentsGalleryVC", @"THAnimationsPlayground", nil];
  }
  return _channels;
}

#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.channels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID forIndexPath:indexPath];
  
  cell.textLabel.text = [self.channels objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *classNameAsString = [self.channels objectAtIndex:indexPath.row];
  Class VCClass = NSClassFromString(classNameAsString);
  id vcInstance = [[VCClass alloc] init];
  
  if ([vcInstance isKindOfClass:[UIViewController class]]) {
    [self.navigationController pushViewController:vcInstance animated:YES];
  }
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end











