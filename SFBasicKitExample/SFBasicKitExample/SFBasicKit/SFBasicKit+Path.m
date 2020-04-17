//
//  SFBasicKit+Path.m
//  SFBasicKitExample
//
//  Created by chenhao on 2020/4/17.
//  Copyright © 2020 ch. All rights reserved.
//

#import "SFBasicKit+Path.h"


@implementation SFBasicKit (Path)
+ (NSString *)pathOfTemporary {
    return NSTemporaryDirectory();
}

+ (NSString *)pathOfDocument {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)pathOfCache {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSURL *)urlOfDocument {
    return [[[NSFileManager defaultManager] URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask] lastObject];
}
+ (NSURL *)urlOfCache {
    return [[[NSFileManager defaultManager] URLsForDirectory: NSCachesDirectory inDomains: NSUserDomainMask] lastObject];
}
@end
