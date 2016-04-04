//
//  CXTabBar.m
//  Diving Log
//
//  Created by 陈曦 on 16/4/4.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTabBar.h"

@interface CXTabBar()
//增加精选button
@property (nonatomic,weak) UIButton *essenceButton;
@end




@implementation CXTabBar


-(instancetype)initWithFrame:(CGRect)frame{


    if (self = [super initWithFrame:frame]) {
        
        //设置背景图片
            //self.backgroundImage = [UIImage imageNamed:@"tab_bg@2x_58C89562F58FD276F592420068DB8C09_0"];
        
        UIButton *essenceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [essenceButton setBackgroundImage:[UIImage imageNamed:@"tab_jia@2x_58C89562F58FD276F592420068DB8C09_0"] forState:UIControlStateNormal];
        [essenceButton setBackgroundImage:[UIImage imageNamed:@"tab_jia@2x_58C89562F58FD276F592420068DB8C09_0"] forState:UIControlStateSelected];
        [essenceButton sizeToFit];
        
        
        //监听精选按钮
        [essenceButton addTarget:self action:@selector(essenceButtonClick)forControlEvents:UIControlEventTouchUpOutside];
        [self addSubview:essenceButton];
        self.essenceButton = essenceButton;
        
    }

    return self;
}


-(void)essenceButtonClick{

    NSLog(@"%s",__func__);
}


/*重写layoutSubviews方法，布局子控件*/

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    //TabBar的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    //设置发布按钮的位置
    self.essenceButton.center = CGPointMake(width * 0.5, height *0.5);
    
    //设置索引
    int index = 0;
    
    //按钮尺寸
    CGFloat tabBarButtonW = self.frame.size.width / 5;
    CGFloat tabBarButtonH = self.frame.size.height;
    CGFloat tabBarButtonY = 0;
    
    //设置四个tabBarButton的frame
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"])continue;
        
        //计算按钮x的值
        CGFloat tabBarButtonX = index * tabBarButtonW;
        
        
        if (index >=2) {
            tabBarButtonX += tabBarButtonW;//给后面两个button增加x宽度的值
        }
        
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
        index++;
        
    }
    
    
    
}



@end
