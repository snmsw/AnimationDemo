//
//  SpringAnimationViewController.m
//  AnimationDemo
//
//  Created by king on 16/7/5.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "SpringAnimationViewController.h"
#import <pop/POP.h>

@interface SpringAnimationViewController ()

@property (nonatomic, strong) UITextField *loginTextField;


@end

@implementation SpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self springTest];
    [self springTest2];
    [self springTest3];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.loginTextField endEditing:YES];
}

- (void)springTest {
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    NSInteger height = CGRectGetHeight(self.view.bounds);
//    NSInteger width = CGRectGetWidth(self.view.bounds);
//    
//    CGFloat centerX = arc4random() % width;
//    CGFloat centerY = arc4random() % height;
    
    CGFloat centerX = 300;
    CGFloat centerY = 400;
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.springSpeed = 10;
    anim.springBounciness = 16;
    anim.beginTime = CACurrentMediaTime() + 2.0f;
    
    [testView pop_addAnimation:anim forKey:@"center"];
    
}

- (void)springTest2 {
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 30, 30)];
    testLabel.backgroundColor = [UIColor blueColor];
    testLabel.text = @"3";
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:testLabel];
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    anim.beginTime = CACurrentMediaTime() + 1.0f;
    anim.springBounciness = 20;
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(100, 300, 100, 100)];
    [testLabel pop_addAnimation:anim forKey:@"size"];
    
}


- (void)springTest3 {
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 400, 100, 30)];
    [loginBtn setTitle:@"login" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:loginBtn];
    
    [loginBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 350, 200, 30)];
    self.loginTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.loginTextField.layer.borderWidth = 1.0;
    [self.view addSubview:self.loginTextField];
    
}

- (void)buttonClick {
    POPSpringAnimation *wrongShake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    wrongShake.springBounciness = 10;
    wrongShake.springSpeed = 10;
    wrongShake.velocity = @(3000);
    [self.loginTextField.layer pop_addAnimation:wrongShake forKey:@"shakePassword"];
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
