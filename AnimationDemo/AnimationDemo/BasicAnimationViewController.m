//
//  BasicAnimationViewController.m
//  AnimationDemo
//
//  Created by king on 16/7/5.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import <pop/POP.h>

@interface BasicAnimationViewController ()


@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    [self easeOutTest];
    [self testTwo];
}


- (void)test {
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic.toValue = @(view1.center.x + 280);
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;
    [view1 pop_addAnimation:anBasic forKey:@"position"];
    
}

- (void)easeOutTest {
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 100)];
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    
    NSInteger height = CGRectGetHeight(self.view.bounds);
    NSInteger width = CGRectGetWidth(self.view.bounds);
    
    CGFloat centerX = arc4random() % width;
    CGFloat centerY = arc4random() % height;
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.beginTime = CACurrentMediaTime() + 2.0f;
    anim.duration = 0.4;
    [testView pop_addAnimation:anim forKey:@"centerAnimation"];    
    
}

- (void)testTwo {
    CALayer *testLayer = [CALayer layer];
    testLayer.opacity = 1.0;
    testLayer.transform = CATransform3DIdentity;
    [testLayer setMasksToBounds:YES];
    [testLayer setBackgroundColor:[UIColor cyanColor].CGColor];
    [testLayer setCornerRadius:12.5];
    [testLayer setBounds:CGRectMake(0, 0, 25, 25)];
    [self.view.layer addSublayer:testLayer];
    
    testLayer.position = CGPointMake(self.view.center.x, 260);
    [self performAnimation:testLayer];
    
}

- (void)performAnimation:(CALayer *)layer {
    [layer pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.duration = 1.0f;
    static BOOL ani = YES;
    if (ani) {
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    } else {
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(5.0, 5.0)];
    }
    ani = !ani;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            [self performAnimation:layer];
        }
    };
    [layer pop_addAnimation:anim forKey:@"Animation"];
    
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
