//
//  TMPullRefreshView.m
//  PullRefreshDemo
//
//  Created by sunjianwen on 13-4-25.
//  Copyright (c) 2013年 sunjianwen. All rights reserved.
//

#import "TMPullRefreshView.h"

@interface TMPullRefreshView ()

- (id)initWithScrollView:(UIScrollView*)scrollView;
- (void)rotateArrow:(float)degrees hide:(BOOL)hide;
- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset;
- (void)scrollViewDidScroll:(CGPoint)contentOffset;

@property (nonatomic, copy) void (^actionHandler)(void);

@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong, readonly) UIImage *arrowImage;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong, readonly) UILabel *dateLabel;
@property (nonatomic, strong, readonly) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, readwrite) UIEdgeInsets originalScrollViewContentInset;

@end

@implementation TMPullRefreshView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

#pragma mark - UIScrollView (SVPullToRefresh)
#import <objc/runtime.h>

static char UIScrollViewPullRefreshView;

@implementation UIScrollView (TMPullRefresh)

@dynamic pullRefreshView;

- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler {
    TMPullRefreshView *pullToRefreshView = [[TMPullRefreshView alloc] initWithScrollView:self];
    pullToRefreshView.actionHandler = actionHandler;
    self.pullToRefreshView = pullToRefreshView;
}

- (void)setPullToRefreshView:(TMPullRefreshView *)pullToRefreshView {
    [self willChangeValueForKey:@"pullToRefreshView"];
    objc_setAssociatedObject(self, &UIScrollViewPullRefreshView,
                             pullToRefreshView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"pullToRefreshView"];
}

- (TMPullRefreshView *)pullToRefreshView {
    return objc_getAssociatedObject(self, &UIScrollViewPullRefreshView);
}

@end
