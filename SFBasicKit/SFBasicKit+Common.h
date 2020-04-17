//
//  SFBasicKit+Common.h
//  SFBasicKitExample
//
//  Created by chenhao on 2020/4/17.
//  Copyright © 2020 ch. All rights reserved.
//
#import "SFBasicKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFBasicKit (Common)
+ (UIViewController *)getCurrentVC;
+ (void)runOnMainThreadWithBlock:(sf_void_block)block;
+ (void)openURL:(NSURL *)url completion:(void (^ __nullable)(void))completionBlock;
@end

NS_ASSUME_NONNULL_END
