//
//  ViewController.m
//  foldableLabel
//
//  Created by soufun on 15-2-5.
//  Copyright (c) 2015年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYFoldableLabel.h"
@interface ViewController ()
{
    ZYFoldableLabel *  _foldView;
}
@end

@implementation ViewController
- (IBAction)click:(id)sender
{
    _foldView.frame2 = CGRectMake(0, 200, self.view.frame.size.width, 0);
    _foldView.text = @"法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫法师打发士大夫撒的发生大幅度撒飞洒的范德萨发放的飒飒大法师打发士大夫";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIFont systemFontOfSize:15];
    
    _foldView = [[ZYFoldableLabel alloc]initWithText:@"    哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" andFont:[UIFont systemFontOfSize:15] andNumOfLines:3 andRect:CGRectMake(30,30,200,0)];
    
    _foldView.clickAction = ^(CGRect frame)
    {
//        NSLog(@"clicked");
        NSLog(@"%f",frame.size.height);
    };
    [self.view addSubview:_foldView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
