//
//  Queue.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/1/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "Queue.h"
@interface Queue()

@property (strong,nonatomic) NSMutableArray *queue;

@end

@implementation Queue

- (NSNumber *)dequeue {
  NSNumber *retValue = [self.queue firstObject];
  [self.queue removeObjectAtIndex:1];
  return retValue;
}

- (void)enqueue:(NSNumber *)value {
  [self.queue addObject:value];
}

- (NSMutableArray *)queue {
  if(!_queue) {
    _queue = [[NSMutableArray alloc] init];
  }
  return _queue;
}

@end
