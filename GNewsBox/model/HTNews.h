//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTNews : NSObject

@property(nonatomic, strong) NSString *headline;
@property(nonatomic, strong) NSURL *link;

- (instancetype)initWithFeed:(id)feedItem;

@end