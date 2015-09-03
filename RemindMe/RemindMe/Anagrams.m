//
//  Anagrams.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/2/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "Anagrams.h"

@implementation Anagrams

+ (BOOL) isStringAnagram:(NSString *)string1 of:(NSString *)string2 {
  if (string1.length != string2.length) {
    return false;
  }
  
  NSCountedSet *aSet = [[NSCountedSet alloc] init];
  NSCountedSet *bSet = [[NSCountedSet alloc] init];
  
  for (int i = 0; i < string1.length; i++)
  {
    [aSet addObject:@([string1 characterAtIndex:i])];
    [bSet addObject:@([string2 characterAtIndex:i])];
  }
  
  return [aSet isEqualToSet:bSet];
}
@end