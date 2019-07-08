//
//  AnimationViewController.m
//  ThirdLibLearn
//
//  Created by Lynn on 2019/6/26.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imgView =[[UIImageView alloc] initWithFrame:CGRectMake(320, 100, 0, 460)];
    [imgView setImage:[UIImage imageNamed:@"dog.png"]];
    [self.view addSubview:imgView];
//    [imgView release];

    CGContextRef  context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:2];

    [imgView setFrame:CGRectMake(0, 100, 320, 460)];
    [UIView commitAnimations];  
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
