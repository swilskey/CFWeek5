//
//  Keys.h
//  RemindMe
//
//  Created by Sam Wilskey on 8/31/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Keys : NSObject

@property (strong,nonatomic) NSString *applicationId;
@property (strong,nonatomic) NSString *clientKey;
+ (NSString *)getApplicationKey;
+ (NSString *)getClientId;

@end