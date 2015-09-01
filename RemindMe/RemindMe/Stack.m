//
//  Stack.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/1/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "Stack.h"

@interface Stack()

@property (strong,nonatomic) NSMutableArray *stack;

@end

@implementation Stack

- (NSNumber *) pop {
  NSNumber *popValue = [self.stack lastObject];
  [self.stack removeLastObject];
  return popValue;
}

- (void) push:(NSNumber*)value {
  [self.stack addObject:value];
}

- (NSMutableArray *)stack {
  if(!_stack) {
    _stack = [[NSMutableArray alloc] init];
  }
  return _stack;
}

@end