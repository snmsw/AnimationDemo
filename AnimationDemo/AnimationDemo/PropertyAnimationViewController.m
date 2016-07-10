//
//  PropertyAnimationViewController.m
//  AnimationDemo
//
//  Created by king on 16/7/5.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "PropertyAnimationViewController.h"
#import <pop/POP.h>

@interface PropertyAnimationViewController ()

@end

@implementation PropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self propertyTest];
}

- (void)propertyTest {
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 250, 30)];
    [self.view addSubview:testLabel];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            testLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", (int)values[0] / 60, (int)values[0] % 60, (int)(values[0] * 100) % 100];
        };
        
    }];
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];
    anBasic.property = prop;
    anBasic.fromValue = @(0);
    anBasic.toValue = @(30);
    anBasic.duration = 30;
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;
    [testLabel pop_addAnimation:anBasic forKey:@"countdown"];
    
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
