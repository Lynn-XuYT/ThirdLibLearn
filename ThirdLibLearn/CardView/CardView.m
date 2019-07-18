//
//  CardView.m
//  ThirdLibLearn
//
//  Created by Lynn on 2019/7/8.
//  Copyright © 2019 lynn. All rights reserved.
//

#import "CardView.h"
#import <Masonry/Masonry.h>

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height

#define MainWidth           360
#define CardInfoViewWidth   334
#define Padding             16
#define HeaderHeight        187.3

@interface NMNameCardMusicCell : UIView
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *despLabel;
@end

@implementation NMNameCardMusicCell

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.icon = [UIImageView new];
        self.icon.backgroundColor = [UIColor blueColor];
        [self addSubview:self.icon];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:self.titleLabel];
        
        self.despLabel = [UILabel new];
        self.despLabel.textColor = [UIColor blackColor];
        self.despLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:self.despLabel];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(0);
            make.left.equalTo(self.mas_left);//.offset(Padding);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(40);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.icon.mas_top).offset(2);
            make.left.equalTo(self.icon.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-Padding);
        }];
        
        [self.despLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.icon.mas_bottom).offset(-2);
            make.left.equalTo(self.icon.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-Padding);
        }];
        
    }
    return self;
}

- (void)layoutSubviews {
    self.titleLabel.text = @"单曲名";
    [self.titleLabel sizeToFit];
    
    self.despLabel.text = @"XXXX,XXXXX";
    [self.despLabel sizeToFit];
}
@end

@interface CardView ()

@property (nonatomic, strong) UILabel *fansLabel;
@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *despLabel;

@property (nonatomic, strong) UIView *honorContainer;
@property (nonatomic, strong) UIView *musicInfoContainer;
@property (nonatomic, strong) UIView *hotMusicContainer;

@end

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)addToSuperview:(UIView *)view {
    [view addSubview:self];
    
    [self setupUI];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setupUI {
    
    // header
    [self addHeader];
    
    // honor
    UIView *honorContainer = [UIView new];
    [self addSubview:honorContainer];
    [self addHonorView:honorContainer];
    self.honorContainer = honorContainer;
    
    // music info
    UIView *musicInfoContainer = [UIView new];
    [self addSubview:musicInfoContainer];
    [self addMusicInfoView:musicInfoContainer];
    self.musicInfoContainer = musicInfoContainer;
    
    // hot music
    UIView *hotMusicContainer = [UIView new];
    [self addSubview:hotMusicContainer];
    [self addHotMusicView:hotMusicContainer];
    self.hotMusicContainer = hotMusicContainer;
    
    // info
    UIView *infoContainer = [UIView new];
    [self addSubview:infoContainer];
    [self addInfoView:infoContainer];
    
    [hotMusicContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(musicInfoContainer.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [infoContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotMusicContainer.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.mas_top).offset(77);
        make.width.mas_equalTo(CardInfoViewWidth);
        make.centerX.equalTo(self.superview.mas_centerX);
        make.bottom.equalTo(infoContainer.mas_bottom).offset(Padding);
    }];
}

- (void)addHeader {
    
    // 背景
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.image = [UIImage imageNamed:@"dog.png"];
    [self addSubview:bgImageView];
    
    // header container
    UIView *header = [[UIView alloc] init];
    [self addSubview:header];
    
    // 粉丝
    UILabel *fansLabel = [self labelWithFont:[UIFont systemFontOfSize:13] textColor:[UIColor whiteColor]];
    [header addSubview:fansLabel];
    self.fansLabel = fansLabel;
    
    // 排行
    UILabel *rankLabel = [self labelWithFont:[UIFont systemFontOfSize:13] textColor:[UIColor whiteColor]];
    [header addSubview:rankLabel];
    self.rankLabel = rankLabel;
    
    // 歌手名
    UILabel *nameLabel = [self labelWithFont:[UIFont boldSystemFontOfSize:19] textColor:[UIColor whiteColor]];
    [header addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    // 入驻天数
    UILabel *despLabel = [self labelWithFont:[UIFont systemFontOfSize:13] textColor:[UIColor whiteColor]];
    [header addSubview:despLabel];
    self.despLabel = despLabel;
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(HeaderHeight);
    }];
    
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(HeaderHeight);
    }];
    
    [fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(header.mas_bottom).offset(-Padding);
        make.left.equalTo(header.mas_left).offset(Padding);
    }];
    
    [rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(fansLabel.mas_top).offset(-Padding*0.5);
        make.left.equalTo(header.mas_left).offset(Padding);
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(rankLabel.mas_top).offset(-Padding*0.5);
        make.left.equalTo(header.mas_left).offset(Padding);
    }];
    
    [despLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(header.mas_bottom).offset(-Padding);
        make.right.equalTo(header.mas_right).offset(-Padding);
    }];
}

- (void)addHonorView:(UIView *)honorContainer {
    
    UILabel *titleLabel = [self labelWithFont:[UIFont boldSystemFontOfSize:15] textColor:[UIColor blackColor]];
    titleLabel.text = @"Title";
    [titleLabel sizeToFit];
    [honorContainer addSubview:titleLabel];
    
    UILabel *despLabel1 = [self labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
    despLabel1.text = @"12345";
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"XXX"];
//    attributedString = NMTextColorLevel2;
    NSMutableAttributedString *appendString = [[NSMutableAttributedString alloc] initWithString:@" 首入榜歌曲"];
//    prefix.nm_colorKey = NMTextColorLevel3;
    [attributedString appendAttributedString:appendString];
    [despLabel1 setAttributedText:attributedString];
    
    [despLabel1 sizeToFit];
    [honorContainer addSubview:despLabel1];
    
    UILabel *despLabel2 = [self labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
    despLabel2.text = @"12345";
    [despLabel2 sizeToFit];
    [honorContainer addSubview:despLabel2];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(honorContainer.mas_top).offset(20);
        make.left.equalTo(honorContainer.mas_left).offset(Padding);
        make.right.equalTo(honorContainer.mas_right);
    }];
    
    [despLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(honorContainer.mas_left).offset(Padding);
        make.right.equalTo(honorContainer.mas_centerX);
    }];
    
    [despLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(honorContainer.mas_centerX);
        make.right.equalTo(honorContainer.mas_right);
    }];
    
    [honorContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(HeaderHeight);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(despLabel1.mas_bottom);
    }];
}

- (void)addMusicInfoView:(UIView *)musicInfoContainer {
    
    UILabel *titleLabel = [self labelWithFont:[UIFont boldSystemFontOfSize:15] textColor:[UIColor blackColor]];
    titleLabel.text = @"12345";
    [titleLabel sizeToFit];
    [musicInfoContainer addSubview:titleLabel];
    
    UILabel *despLabel1 = [self labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
    despLabel1.text = @"12345";
    [despLabel1 sizeToFit];
    [musicInfoContainer addSubview:despLabel1];
    
    UILabel *despLabel2 = [self labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
    despLabel2.text = @"12345";
    [despLabel2 sizeToFit];
    [musicInfoContainer addSubview:despLabel2];
    
    UILabel *despLabel3 = [self labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
    despLabel3.text = @"12345";
    [despLabel3 sizeToFit];
    [musicInfoContainer addSubview:despLabel3];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(musicInfoContainer.mas_top);
        make.left.equalTo(musicInfoContainer.mas_left).offset(Padding);
        make.right.equalTo(musicInfoContainer.mas_right);
    }];
    
    [despLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(musicInfoContainer.mas_left).offset(Padding);
        make.width.equalTo(despLabel2.mas_width);
        make.width.equalTo(despLabel3.mas_width);
    }];
    
    [despLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(despLabel1.mas_right);
    }];
    
    [despLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(despLabel2.mas_right);
        make.right.equalTo(musicInfoContainer.mas_right);
    }];
    
    [musicInfoContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.honorContainer.mas_bottom).offset(40);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(despLabel1.mas_bottom);
    }];
}

- (void)addHotMusicView:(UIView *)hotMusicContainer {
    
    UILabel *titleLabel = [self labelWithFont:[UIFont boldSystemFontOfSize:15] textColor:[UIColor blackColor]];
    titleLabel.text = @"12345";
    [titleLabel sizeToFit];
    [hotMusicContainer addSubview:titleLabel];
    
    NMNameCardMusicCell *cell1 = [NMNameCardMusicCell new];
    [hotMusicContainer addSubview:cell1];
    
    NMNameCardMusicCell *cell2 = [NMNameCardMusicCell new];
    [hotMusicContainer addSubview:cell2];
    
    NMNameCardMusicCell *cell3 = [NMNameCardMusicCell new];
    [hotMusicContainer addSubview:cell3];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hotMusicContainer.mas_top).offset(40);
        make.left.equalTo(hotMusicContainer.mas_left).offset(Padding);
        make.right.equalTo(hotMusicContainer.mas_right);
    }];
    
    [cell1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.left.equalTo(hotMusicContainer.mas_left).offset(Padding);
        make.width.equalTo(hotMusicContainer.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    [cell2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell1.mas_bottom).offset(10);
        make.left.equalTo(hotMusicContainer.mas_left).offset(Padding);
        make.width.equalTo(hotMusicContainer.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    [cell3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell2.mas_bottom).offset(10);
        make.left.equalTo(hotMusicContainer.mas_left).offset(Padding);
        make.width.equalTo(hotMusicContainer.mas_width);
        make.height.mas_equalTo(40);
    }];
    
    [hotMusicContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.musicInfoContainer.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(cell3.mas_bottom);
    }];
}

- (void)addInfoView:(UIView *)infoContainer {
    
    UILabel *titleLabel = [self labelWithFont:[UIFont boldSystemFontOfSize:15] textColor:[UIColor blackColor]];
    titleLabel.text = @"12345";
    [titleLabel sizeToFit];
    [infoContainer addSubview:titleLabel];
    
    UILabel *despLabel = [self labelWithFont:[UIFont systemFontOfSize:14] textColor:[UIColor blackColor]];
    despLabel.text = @"12345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345123451234512345";
    [despLabel sizeToFit];
    despLabel.numberOfLines = 10;
    [infoContainer addSubview:despLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infoContainer.mas_top).offset(40);
        make.left.equalTo(infoContainer.mas_left).offset(Padding);
        make.right.equalTo(infoContainer.mas_right);
    }];
    
    [despLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10);
        make.left.equalTo(infoContainer.mas_left).offset(Padding);
        make.right.equalTo(infoContainer.mas_right).offset(-Padding);
    }];
    
    [infoContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotMusicContainer.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(despLabel.mas_bottom);
    }];
}

- (void)layoutSubviews {
    
    self.fansLabel.text = @"XX XX";
    [self.fansLabel sizeToFit];
    
    self.rankLabel.text = @"XXX";
    [self.rankLabel sizeToFit];
    
    self.nameLabel.text = @"XXX";
    [self.nameLabel sizeToFit];
    
    self.despLabel.text = @"XXXXXX";
    [self.despLabel sizeToFit];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8,8)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    return label;
}
@end

@implementation NMNameCardView

- (void)addToSuperview:(UIView *)view {
    [view addSubview:self];
    self.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:0.5];
    
    CardView *cardInfoView = [CardView new];
    [cardInfoView addToSuperview:self];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.mas_top).offset(Padding);
        make.width.mas_equalTo(MainWidth);
        make.centerX.equalTo(self.superview.mas_centerX);
        make.bottom.equalTo(cardInfoView.mas_bottom).offset(118);
    }];
}

@end
