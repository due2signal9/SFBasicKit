//
//  SFBasicKit+Path.h
//  SFBasicKitExample
//
//  Created by chenhao on 2020/4/17.
//  Copyright © 2020 ch. All rights reserved.
//
#import "SFBasicKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFBasicKit (Path)
+ (NSString *)pathOfTemporary;
+ (NSString *)pathOfDocument;
+ (NSString *)pathOfCache;
+ (NSURL *)urlOfDocument;
+ (NSURL *)urlOfCache;
@end

NS_ASSUME_NONNULL_END
