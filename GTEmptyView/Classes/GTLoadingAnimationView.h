//
//  GTLoadingAnimationView.h
//  GTEmptyView
//
//  Created by liuxc on 2018/6/27.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GTLoadingAnimationType) {
    GTLoadingAnimationTypeNone = 0,
    GTLoadingAnimationTypeCircle,
    GTLoadingAnimationTypeCircleJoin,
    GTLoadingAnimationTypeDot,
};

@interface GTLoadingAnimationView : UIView

@property (nonatomic,assign) NSInteger  count;

@property (nonatomic) UIColor  *defaultBackGroundColor;

@property (nonatomic) UIColor  *foregroundColor;

- (void)showAnimationAtView:(UIView *)view animationType:(GTLoadingAnimationType)animationType;

-(void)removeSubLayer;

@end
