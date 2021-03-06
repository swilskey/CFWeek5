//
//  ParseService.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/3/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseService : NSObject

+ (void)userLoginWithUsername:(NSString *)username andPassword:(NSString *)password completion:(void (^)(NSError *))completionHandler;
+ (void)signupWithUsername:(NSString *)username andPassword:(NSString *)password andEmail:(NSString *)email completion:(void (^)(NSError *))completionHandler;
+ (void)findRemindersForUser:(void(^)(NSError *, NSArray *))completionHandler;

@end
