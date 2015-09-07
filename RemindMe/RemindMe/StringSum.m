//
//  StringSum.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/3/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "StringSum.h"

@implementation StringSum

+ (int)stringNumberCount:(NSString *)string1 {
  NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
  NSString *string2 = [[string1 componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@"+"];
  NSArray *numbers = [string2 componentsSeparatedByString:@"+"];
  int sum = 0;
  for (NSString *number in numbers) {
    sum += [number intValue];
  }
  return sum;
}

@end