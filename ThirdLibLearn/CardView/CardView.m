//
//  CardView.m
//  ThirdLibLearn
//
//  Created by Lynn on 2019/7/8.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "CardView.h"
#define Padding 16

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8,8)];
        //创建 layer
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        //赋值
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI {
    
    CGFloat headerHeight = 187.3;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, headerHeight)];
    imageView.image = [UIImage imageNamed:@"dog.png"];
    [self addSubview:imageView];
    
    UIView *header = [[UIView alloc] initWithFrame:imageView.bounds];
    [self addSubview:header];
    
    UILabel *fansLabel = [[UILabel alloc] init];
    fansLabel.font = [UIFont systemFontOfSize:13];
    fansLabel.text = @"XX XX";
    fansLabel.textColor = [UIColor whiteColor];
    [fansLabel sizeToFit];
    fansLabel.frame = CGRectMake(Padding, headerHeight - 16 - fansLabel.font.lineHeight, fansLabel.frame.size.width, fansLabel.font.lineHeight);
    [header addSubview:fansLabel];
    
    UILabel *rankLabel = [[UILabel alloc] init];
    rankLabel.font = [UIFont systemFontOfSize:13];
    rankLabel.text = @"XXX";
    rankLabel.textColor = [UIColor whiteColor];
    [rankLabel sizeToFit];
    rankLabel.frame = CGRectMake(Padding, CGRectGetMinY(fansLabel.frame) - 8 - rankLabel.font.lineHeight, rankLabel.frame.size.width, rankLabel.font.lineHeight);
    [header addSubview:rankLabel];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont boldSystemFontOfSize:19];
    nameLabel.text = @"XXX";
    nameLabel.textColor = [UIColor whiteColor];
    [nameLabel sizeToFit];
    nameLabel.frame = CGRectMake(Padding, CGRectGetMinY(rankLabel.frame) - 8 - nameLabel.font.lineHeight, nameLabel.frame.size.width, nameLabel.font.lineHeight);
    [header addSubview:nameLabel];
    
    UILabel *despLabel = [[UILabel alloc] init];
    despLabel.font = [UIFont systemFontOfSize:13];
    despLabel.text = @"XXXXXX";
    despLabel.textColor = [UIColor whiteColor];
    [despLabel sizeToFit];
    despLabel.frame = CGRectMake(header.frame.size.width - Padding * 2 - fansLabel.frame.size.width, headerHeight - 16 - despLabel.font.lineHeight, despLabel.frame.size.width, fansLabel.font.lineHeight);
    [header addSubview:despLabel];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
