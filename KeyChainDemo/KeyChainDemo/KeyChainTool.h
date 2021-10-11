//
//  KeyChainTool.h
//  KeyChainDemo
//
//  Created by Alan on 2019/2/22.
//  Copyright © 2019 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyChainTool : NSObject

/// 增
+ (void)saveWithService:(NSString *)service Account:(NSString *)account Password:(NSString *)password;

/// 查
+ (NSString *)queryWithService:(NSString *)service Account:(NSString *)account;

/// 改
+ (void)updateWithService:(NSString *)service Account:(NSString *)account Password:(NSString *)password;

/// 删
+ (void)deleteWithService:(NSString *)service Account:(NSString *)account;



@end

NS_ASSUME_NONNULL_END
