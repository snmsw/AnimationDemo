//
//  DecayAnimationViewController.m
//  AnimationDemo
//
//  Created by king on 16/7/5.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "DecayAnimationViewController.h"
#import <pop/POP.h>


@interface DecayAnimationViewController ()

@end

@implementation DecayAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self decayTest];
    
}


- (void)decayTest {
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    POPDecayAnimation *anDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anDecay.velocity = [NSNumber numberWithFloat:600];
    anDecay.beginTime = CACurrentMediaTime() + 1.5f;
    [testView pop_addAnimation:anDecay forKey:@"position"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
