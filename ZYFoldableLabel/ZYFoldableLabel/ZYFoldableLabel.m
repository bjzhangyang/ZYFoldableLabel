//
//  ZYFoldableLabel.m
//  foldableLabel
//
//  Created by soufun on 15-3-9.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ZYFoldableLabel.h"
#define kGap 10
#define IOS7DEVICE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
@implementation ZYFoldableLabel
-(instancetype)initWithText:(NSString*)text andFont:(UIFont*)font andNumOfLines:(NSInteger)num andRect:(CGRect)frame
{
    if(self = [[ZYFoldableLabel alloc]init])
    {
        [self initData];
        [self setUpLabelAndImageWithFrame:frame andFont:font andNumOfLines:num andText:text];
    }
    return self;
}
-(void)initData
{
    self.isFolded = YES;
    self.font = [UIFont systemFontOfSize:15];
    self.num = 3;
}
-(void)setUpLabelAndImageWithFrame:(CGRect)frame andFont:(UIFont*)font andNumOfLines:(NSInteger)num andText:(NSString*)text
{
    if(font != nil )
    {
        self.font = font;
    }
    if(num != 0)
    {
        self.num = num;
    }
    _text = text;
    self.label = [[UILabel alloc]init];
    self.label.numberOfLines = 0;
    self.label.font = font;
    self.label.text = text;
    [self addSubview:self.label];
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"ic_arrow_down@2x.png"];
    [self addSubview:self.imageView];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)]];
    [self setUIFrameWithFrame:frame];
    [self isShowImage];
}
-(void)setFrame2:(CGRect)frame2
{
    _frame2 = frame2;
    [self setUIFrameWithFrame:frame2];
    [self isShowImage];
}
-(void)setUIFrameWithFrame:(CGRect)frame
{
    CGSize fontSize =[@"呵呵" sizeWithAttributes:@{NSFontAttributeName:self.font}];
    NSLog(@"%f %f",fontSize.width,fontSize.height);
    double finalHeight = fontSize.height * self.num;
    self.label.frame = CGRectMake(kGap, kGap, frame.size.width - 2*kGap, finalHeight);
    self.imageView.frame = CGRectMake(frame.size.width - kGap - 30, self.label.frame.size.height + 2*kGap, 13, 8);
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, self.label.frame.size.height + 3*kGap + 8);
    self.oraginRect = self.frame;
    self.labelOraginRect = self.label.frame;
    self.imageViewOraginRect = self.imageView.frame;
}
-(void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
    [self reLayoutWithText:text];
    [self isShowImage];
}
-(void)isShowImage
{
    self.imageView.hidden = NO;
    self.userInteractionEnabled = YES;
    CGSize fontSize =[@"呵呵" sizeWithAttributes:@{NSFontAttributeName:self.font}];
    double finalHeight = fontSize.height * self.num;
    if (finalHeight >= [self getTextHeight]) {
        self.imageView.hidden = YES;
        self.userInteractionEnabled = NO;
        self.label.frame = CGRectMake(kGap, kGap, self.label.frame.size.width, [self getTextHeight]);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.label.frame.size.height + 3*kGap);
    }
}
-(CGFloat)getTextHeight
{
    CGFloat height;
    if (IOS7DEVICE) {
        
        CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.label.frame.size.width, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];
        height = rect.size.height;
    }
    else{
        CGSize size=[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.label.frame.size.width, 10000) lineBreakMode:NSLineBreakByWordWrapping];
        height = size.height;
    }
    return height;
}
-(void)reLayoutWithText:(NSString*)text
{
    if(!self.isFolded)
    {
        
        self.label.frame=CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y, self.label.frame.size.width, [self getTextHeight]);
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.label.frame.size.height + 2*kGap, 13, 8);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,  self.label.frame.size.height + 3*kGap + 8);
        self.imageView.image = [UIImage imageNamed:@"ic_arrow_up.png"];
    }
    else
    {
        self.label.frame = self.labelOraginRect;
        self.imageView.frame = self.imageViewOraginRect;
        self.frame = self.oraginRect;
        self.imageView.image = [UIImage imageNamed:@"ic_arrow_down@2x.png"];
    }
    if(self.clickAction != nil)
    {
        self.clickAction(self.frame);
    }
    
}
-(void)tap:(UITapGestureRecognizer*)sender
{
    if(self.isFolded)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.label.frame=CGRectMake(self.label.frame.origin.x, self.label.frame.origin.y, self.label.frame.size.width, [self getTextHeight]);
            self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.label.frame.size.height + 2*kGap, 13, 8);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,  self.label.frame.size.height + 3*kGap + 8);
            
        }];
        self.imageView.image = [UIImage imageNamed:@"ic_arrow_up.png"];
    }
    else
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.label.frame = self.labelOraginRect;
            self.imageView.frame = self.imageViewOraginRect;
            self.frame = self.oraginRect;
        }];
        
        self.imageView.image = [UIImage imageNamed:@"ic_arrow_down@2x.png"];
    }
    self.isFolded = !self.isFolded;
    if(self.clickAction != nil)
    {
        self.clickAction(self.frame);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
