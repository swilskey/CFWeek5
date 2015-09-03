//
//  Anagrams.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/2/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Anagrams : NSObject
+ (BOOL) isStringAnagram:(NSString *)string1 of:(NSString *)string2;
@end
