//
//  TMPullRefreshView.h
//  PullRefreshDemo
//
//  Created by sunjianwen on 13-4-25.
//  Copyright (c) 2013年 sunjianwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TMPullRefreshViewDelegate <NSObject>

- (void)refresh;

@end

@interface TMPullRefreshView : UIView

@end

@interface UIScrollView (TMPullRefresh)

- (void)addPullRefreshWithActionHandler:(void (^)(void))actionHandler;

@property (nonatomic, strong) TMPullRefreshView *pullRefreshView;

@end
