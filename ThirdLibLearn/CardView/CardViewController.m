//
//  CardViewController.m
//  ThirdLibLearn
//
//  Created by Lynn on 2019/7/8.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "CardViewController.h"
#import "CardView.h"
#import <Masonry/Masonry.h>

#define PaddingTop      77
#define Padding         13
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

@interface CardViewController ()

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    NMNameCardView *cardView = [[NMNameCardView alloc] init];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3];
//    scroll.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    [self.view addSubview:scrollView];
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [cardView addToSuperview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
        make.bottom.equalTo(cardView.mas_bottom).offset(17);
    }];
    
//    [scroll addSubview:cardView];
    
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
