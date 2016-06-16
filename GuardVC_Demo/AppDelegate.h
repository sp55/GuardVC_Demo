//
//  AppDelegate.h
//  GuardVC_Demo
//
//  Created by admin on 16/6/16.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;



+(AppDelegate *)sharedappDelegate;


#pragma mark - showHome
-(void)showHome;
@end

