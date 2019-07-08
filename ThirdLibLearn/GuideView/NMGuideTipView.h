//
//  NMGuideTipView.h
//  JDFTooltips
//
//  Created by Lynn on 2019/6/25.
//  Copyright © 2019 Joe Fryer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, NMGuideTipViewOptions) {
    NMGuideTipViewOptionTop         = 1 <<  0,
    NMGuideTipViewOptionBottom      = 1 <<  1,
    
    
    NMGuideTipViewOptionCenter       = 1 <<  2,
    NMGuideTipViewOptionRight        = 1 <<  3,
    NMGuideTipViewOptionLeft         = 1 <<  4,
};

@interface NMGuideTipView : UIView

- (void)showOnView:(__kindof UIView *)superView
           message:(NSString *)message
        targetView:(UIView *)targetView
           options:(NMGuideTipViewOptions)options
          duration:(CGFloat)duration;
@end

NS_ASSUME_NONNULL_END
