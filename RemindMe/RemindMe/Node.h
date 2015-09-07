//
//  Node.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/5/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong,nonatomic) id value;
@property (strong,nonatomic) Node *next;

@end
