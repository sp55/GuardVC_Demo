//
//  GuardViewController.m
//  GuardVC_Demo
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "GuardViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface GuardViewController ()

@property(strong,nonatomic)UIScrollView *scrollView;
@end

@implementation GuardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _scrollView.contentSize = CGSizeMake(kScreenWidth * 3, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guard_%d",i+1]];
        
        if (i == 2) {
            imageView.userInteractionEnabled = YES;
            [self addTapGestureOnView:imageView target:self selector:@selector(tapAction)];
        }
        
        [_scrollView addSubview:imageView];
    }
    [self.view addSubview:_scrollView];
}

- (void)addTapGestureOnView:(UIView*)view target:(id)target selector:(SEL)selector{
    UITapGestureRecognizer *gest = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
    gest.numberOfTapsRequired = 1;
    gest.numberOfTouchesRequired = 1;
    [view addGestureRecognizer:gest];
}

- (void)tapAction {
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"guide"];
    [[AppDelegate sharedappDelegate] showHome];
    
   

    
    
//    [self presentViewController:[[ViewController alloc]init] animated:YES completion:^{
//        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"guide"];
//        [[[UIApplication sharedApplication] delegate] window].rootViewController = [[ViewController alloc]init];
//    }];
}

@end
