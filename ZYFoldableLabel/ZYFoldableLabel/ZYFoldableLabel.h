//
//  ZYFoldableLabel.h
//  foldableLabel
//
//  Created by soufun on 15-3-9.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYFoldableLabel : UIView
@property (nonatomic,strong) NSString*     text;
@property (nonatomic,assign) CGRect        frame2;
@property (nonatomic,assign) CGRect        oraginRect;
@property (nonatomic,assign) CGRect        labelOraginRect;
@property (nonatomic,assign) CGRect        imageViewOraginRect;
@property (nonatomic,assign) NSInteger     num;
@property (nonatomic,assign) BOOL          isFolded;
@property (nonatomic,strong) UILabel*      label;
@property (nonatomic,strong) UIImageView*  imageView;
@property (nonatomic,strong) UIFont*       font;
@property (nonatomic,copy)   void (^clickAction)(CGRect frame);
-(instancetype)initWithText:(NSString*)text andFont:(UIFont*)font andNumOfLines:(NSInteger)num andRect:(CGRect)frame;
@end
