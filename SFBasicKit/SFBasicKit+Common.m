//
//  SFBasicKit+Common.m
//  SFBasicKitExample
//
//  Created by chenhao on 2020/4/17.
//  Copyright © 2020 ch. All rights reserved.
//

#import "SFBasicKit+Common.h"
#import <UIKit/UIKit.h>

@implementation SFBasicKit (Common)
+ (id)getCurrentVC {
    //UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}
+ (void)runOnMainThreadWithBlock:(sf_void_block)block {
    if (!block) return;
    if ([NSThread currentThread].isMainThread) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    }
}
+ (void)openURL:(NSURL *)url completion:(void (^ _Nullable)(void))completionBlock {
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:)]) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            if (completionBlock)
                completionBlock();
        }];
    }
}
@end
