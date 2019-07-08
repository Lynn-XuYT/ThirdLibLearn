//
//  NMGuideTipView.m
//
//  Created by Lynn on 2019/6/25.
//  Copyright © 2019 Joe Fryer. All rights reserved.
//

#import "NMGuideTipView.h"
#import <Masonry/Masonry.h>

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define Padding_Left    8
#define Padding_Top     4
#define Arrow_Height    5
#define Arrow_Width     10

#define BackGroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]

@interface NMGuideTipView()

@property (nonatomic, assign) CGFloat animationTime;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, assign) CGRect targetViewFrame;
@property (nonatomic, assign) NMGuideTipViewOptions options;
@end

@implementation NMGuideTipView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.numberOfLines = 0;
        self.label.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:self.label];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)showOnView:(__kindof UIView *)superView
           message:(NSString *)message
        targetView:(UIView *)targetView
           options:(NMGuideTipViewOptions)options
          duration:(CGFloat)duration
{
    
    [superView addSubview:self];
    
    _options = options;
    
    self.label.text = message;
    self.targetViewFrame = [targetView.superview convertRect:targetView.frame toView:superView];
    
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.label.mas_left).offset(-Padding_Left);
//        make.top.equalTo(self.label.mas_top).offset(-Padding_Top);
//        make.right.equalTo(self.label.mas_right).offset(Padding_Left);
//        make.bottom.equalTo(self.label.mas_bottom).offset(Padding_Top * 2);
//        
//        if (options & NMGuideTipViewOptionTop) {
//            make.bottom.equalTo(targetView.mas_top).offset(-5);
//        }
//        else if (options & NMGuideTipViewOptionBottom) {
//            make.top.equalTo(targetView.mas_bottom).offset(5);
//        }
//        
//        if (options & NMGuideTipViewOptionLeft) {
//            make.left.equalTo(targetView.mas_left);
//        }
//        else if (options & NMGuideTipViewOptionRight) {
//            make.right.equalTo(targetView.mas_right);
//        }
//        else if (options & NMGuideTipViewOptionCenter) {
//            make.centerX.equalTo(targetView.mas_centerX);
//        }
//    }];
}

- (void)layoutSubviews {
    [self.label sizeToFit];
    
    CGSize labelSize = [self.label sizeThatFits:CGSizeMake(SCREEN_WIDTH - 30, MAXFLOAT)];
    CGFloat width = labelSize.width + 2 * Padding_Left;
    CGFloat height = labelSize.height + 2 * Padding_Top + Arrow_Height;
    CGFloat y = (_options & NMGuideTipViewOptionBottom) ? CGRectGetMaxY(_targetViewFrame) + Padding_Top * .5: CGRectGetMinY(_targetViewFrame) - Padding_Top * .5 - height;
    CGFloat x = 0;
    
    if (_options & NMGuideTipViewOptionCenter) {
        x = CGRectGetMidX(_targetViewFrame) - width *0.5;
    }
    else if (_options & NMGuideTipViewOptionLeft)
    {
        x = CGRectGetMinX(_targetViewFrame);
    }
    else if (_options & NMGuideTipViewOptionRight) {
        x = CGRectGetMaxX(_targetViewFrame) - width;
    }
    self.frame = CGRectMake(x, y, width, height);
    CGFloat labelY = (_options & NMGuideTipViewOptionBottom) ? Padding_Top + Arrow_Height : Padding_Top;
    self.label.frame = CGRectMake(Padding_Left, labelY, labelSize.width, labelSize.height);
    
    self.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        //        [self performSelector:@selector(dismiss) withObject:nil afterDelay:4];
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)drawRect:(CGRect)rect {
    // 默认圆角角度
    float r = 5;
    // y坐标偏移
    float offsetY = (_options & NMGuideTipViewOptionBottom) ? Arrow_Height : 0;
    // 设置 箭头位置
    float positionNum = CGRectGetWidth(self.frame) / 5.0;
    float arrowCenter = positionNum + Arrow_Width * 0.5;
    
    float targetViewCenter = CGRectGetWidth(self.targetViewFrame) / 2.0;
    
    if (_options & NMGuideTipViewOptionLeft) {
        if (arrowCenter > targetViewCenter) {
            positionNum = targetViewCenter - Arrow_Width * 0.5;
        }
    }
    else if (_options & NMGuideTipViewOptionRight) {
        positionNum *= 4;
        if (CGRectGetMinX(self.frame) + arrowCenter < targetViewCenter) {
            positionNum = targetViewCenter - CGRectGetMinX(self.frame) - Arrow_Width * 0.5;
        }
    }
    else {
        positionNum = (CGRectGetWidth(self.frame) - Arrow_Height) / 2.0;
    }
    
    // 定义坐标点 移动量
    float changeNum = r + Arrow_Height;
    
    // 设置画线 长 宽
    float w = self.frame.size.width ;
    float h = self.frame.size.height;
    
    
    // 获取文本
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置 边线宽度
    CGContextSetLineWidth(context, 0.2);
    //边框颜色
//    CGContextSetStrokeColorWithColor(context, BackGroundColor.CGColor);
    //矩形填充颜色
    CGContextSetFillColorWithColor(context, BackGroundColor.CGColor);
    
    // 箭头在上
    if (_options & NMGuideTipViewOptionBottom) {
        CGContextMoveToPoint(context, r, offsetY);
        CGContextAddLineToPoint(context, r + positionNum, offsetY); // 向右划线 point to `(x, y)
        CGContextAddLineToPoint(context, r + positionNum + Arrow_Width / 2, 0); // 向上斜线
        CGContextAddLineToPoint(context, r + positionNum + Arrow_Width, offsetY); // 向下斜线
        CGContextAddArcToPoint(context, w, offsetY, w, changeNum, r); // 右上角弧度
        CGContextAddArcToPoint(context, w, h, w - changeNum, h, r); // 右下角弧度
        CGContextAddArcToPoint(context, 0, h, 0, r, r); // 左下角弧度
        CGContextAddArcToPoint(context, 0, offsetY, r, offsetY, r); // 左上角弧度
    }
    else {
        // 箭头在下
        
        CGContextMoveToPoint(context, r, 0);
        CGContextAddArcToPoint(context, w, 0, w, changeNum, r);  // 右上角角度  CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius
        CGContextAddArcToPoint(context, w , h - Arrow_Height, w - changeNum, h - Arrow_Height, r);  // 右下角角度
        
        CGContextAddLineToPoint(context, positionNum + Arrow_Width, h - Arrow_Height); // 向左划线 point to `(x, y)
        CGContextAddLineToPoint(context, positionNum + Arrow_Width / 2, h); // 向下斜线
        CGContextAddLineToPoint(context, positionNum, h - Arrow_Height); // 向上斜线
        
        CGContextAddArcToPoint(context, 0, h - Arrow_Height, 0, h - changeNum, r); // 左下角角度
        CGContextAddArcToPoint(context, 0, 0, r, 0, r); // 左上角角度
    }

    
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    /** 父类调用 放在画完边线 后.  不然 设置的文字会被覆盖 */
    [super drawRect:rect];
    
}

//// 当 要改变填充颜色 可以进行调用改变
//-(void)setFillColorStr:(NSString *)fillColorStr{
//
//    _fillColorStr = fillColorStr;
//
//    // 调用- (void)drawRect:(CGRect)rect; 重绘填充颜色
//    [self setNeedsDisplay];
//}

@end
