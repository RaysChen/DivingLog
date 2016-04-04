//
//  CXTabBarController.m
//  Diving Log
//
//  Created by 陈曦 on 16/4/4.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTabBarController.h"
#import "CXMeViewController.h"
#import "CXEssenceViewController.h"
#import "CXFriendViewController.h"
#import "CXGoViewController.h"
#import "CXLogViewController.h"
#import "CXTabBar.h"

@interface CXTabBarController ()

@end

@implementation CXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //抽取item属性
    [self setUpItem];
  
    
    //布局子控件
    [self setUpChildVc];
}


/**
 *  设置Item的属性
 */
- (void)setUpItem
{
    // UIControlStateNormal情况下的文字属性
    NSMutableDictionary *normalAtrrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAtrrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // UIControlStateSelected情况的文字属性
    NSMutableDictionary *selectedAtrrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAtrrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 统一给所有的UITabBatItem设置文字属性
    // 只有后面带有UI_APPEARANCE_SELECTOR方法的才可以通过appearance来设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAtrrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtrrs forState:UIControlStateSelected];
}


/**
 *  设置setUpChildVc的属性，添加所有的子控件
 */
- (void)setUpChildVc
{
    [self setUpChildVc:[[CXGoViewController alloc] init] title:@"去潜" image:@"tab_dest@2x_58C89562F58FD276F592420068DB8C09_0" selectedImage:@"tab_dest_select@2x_58C89562F58FD276F592420068DB8C09_0"];
    [self setUpChildVc:[[CXFriendViewController alloc] init] title:@"潜伴" image:@"tab_find@2x_58C89562F58FD276F592420068DB8C09_0" selectedImage:@"tab_find_select@2x_58C89562F58FD276F592420068DB8C09_0"];
    [self setUpChildVc:[[CXLogViewController alloc] init] title:@"日志" image:@"tab_log@2x_58C89562F58FD276F592420068DB8C09_0" selectedImage:@"tab_log_select@2x_58C89562F58FD276F592420068DB8C09_0"];
    [self setUpChildVc:[[CXMeViewController alloc] init] title:@"我的" image:@"tab_own@2x_58C89562F58FD276F592420068DB8C09_0" selectedImage:@"tab_own_select@2x_58C89562F58FD276F592420068DB8C09_0"];
}


- (void)setUpChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    nav.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
}






@end
