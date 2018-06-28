//
//  OtherAppViewController.h
//  GTEmptyView_Example
//
//  Created by liuxc on 2018/6/28.
//  Copyright © 2018年 liuxc123. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ApplicationExsampleTypeQQ,
    ApplicationExsampleTypeWeiBo,
    ApplicationExsampleTypeYY,
    ApplicationExsampleTypePhotos,
    ApplicationExsampleTypeMeiTuan,
    ApplicationExsampleTypeJingDong
} ApplicationExsampleType;

@interface OtherAppViewController : UIViewController

@property (nonatomic, copy) NSString *vcTitle;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *viewBackgroundColor;
@property (nonatomic, copy) NSDictionary *dataDic;
@property (nonatomic, assign) ApplicationExsampleType appType;

@end
