//
//  ViewController.m
//  AnimationDemo
//
//  Created by king on 16/7/5.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import <pop/POP.h>


#define SRCEEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SRCEEN_WIDTH [UIScreen mainScreen].bounds.size.width

static NSString * const identifier = @"animationCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"BasicAnimationViewController", @"SpringAnimationViewController", @"DecayAnimationViewController", @"PropertyAnimationViewController"];
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SRCEEN_WIDTH, SRCEEN_HEIGHT) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    [self.view addSubview:tableview];
    
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cls = NSClassFromString(self.dataArray[indexPath.row]);
    UIViewController *vc = [cls new];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
