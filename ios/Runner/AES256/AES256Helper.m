//
//  NSString+AES256.m
//  Beauty
//
//  Created by pet on 2019/12/10.
//  Copyright © 2019 Beauty. All rights reserved.
//

#import "AES256Helper.h"


@implementation AES256Helper

/// AES256 加密
/// @param key searctKey
+(NSString *)aes256EncryptWith:(NSString *)target key:(NSString *)key {
    NSData *plainData = [target dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [plainData AES256EncryptWithKey:key];
    NSString *encryptedString = [encryptedData base64Encoding];
    return encryptedString;
}


/// AES256 解密
/// @param key searctKey
+(NSString *)aes256DecryptWith:(NSString *)target key:(NSString *)key {
    NSData *encryptedData = [NSData dataWithBase64EncodedString:target];
    NSData *plainData = [encryptedData AES256DecryptWithKey:key];
    NSString *plainString = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    return plainString;
}

@end
