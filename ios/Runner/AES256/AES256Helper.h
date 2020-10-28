//
//  NSString+AES256.h
//  Beauty
//
//  Created by pet on 2019/12/10.
//  Copyright © 2019 Beauty. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NSData+AES256.h"

NS_ASSUME_NONNULL_BEGIN

@interface AES256Helper : NSObject

/// AES256 加密
/// @param key searctKey
+(NSString *)aes256EncryptWith:(NSString *)target key:(NSString *)key;

/// AES256 解密
/// @param key searctKey
+(NSString *)aes256DecryptWith:(NSString *)target key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
