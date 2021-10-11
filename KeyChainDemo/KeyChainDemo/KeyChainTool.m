//
//  KeyChainTool.m
//  KeyChainDemo
//
//  Created by Alan on 2019/2/22.
//  Copyright © 2019 Alan. All rights reserved.
//

#import "KeyChainTool.h"

@implementation KeyChainTool

+ (void)saveWithService:(NSString *)service Account:(NSString *)account Password:(NSString *)password
{
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *saveSecItems = @{(id)kSecClass: (id)kSecClassGenericPassword,
                                   (id)kSecAttrService: service,
                                   (id)kSecAttrAccount: account,
                                   (id)kSecValueData: passwordData
                                   };
    SecItemAdd((CFDictionaryRef)saveSecItems, NULL);
}

+ (NSString *)queryWithService:(NSString *)service Account:(NSString *)account
{
    NSDictionary *matchSecItems = @{
                                    (id)kSecClass: (id)kSecClassGenericPassword,
                                    (id)kSecAttrService: service,
                                    (id)kSecAttrAccount: account,
                                    (id)kSecMatchLimit: (id)kSecMatchLimitOne,
                                    (id)kSecReturnData: @(YES)
                                    };
    CFTypeRef dataRef = nil;
    OSStatus errorCode = SecItemCopyMatching((CFDictionaryRef)matchSecItems, (CFTypeRef *)&dataRef);
    if (errorCode == errSecSuccess) {
        NSString *password = [[NSString alloc] initWithData:CFBridgingRelease(dataRef) encoding:NSUTF8StringEncoding];
        return password;
    }
    return nil;
}

+ (void)deleteWithService:(NSString *)service Account:(NSString *)account
{
    NSDictionary *deleteSecItems = @{
                                     (id)kSecClass: (id)kSecClassGenericPassword,
                                     (id)kSecAttrService: service,
                                     (id)kSecAttrAccount: account
                                     };
    SecItemDelete((CFDictionaryRef)deleteSecItems);
}

+ (void)updateWithService:(NSString *)service Account:(NSString *)account Password:(NSString *)password
{
    NSDictionary *queryItems = @{(id)kSecClass: (id)kSecClassGenericPassword,
                                 (id)kSecAttrService: service,
                                 (id)kSecAttrAccount: account
                                 };
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *updatedItems = @{
                                   (id)kSecValueData: passwordData,
                                   };
    SecItemUpdate((CFDictionaryRef)queryItems, (CFDictionaryRef)updatedItems);
}

@end
