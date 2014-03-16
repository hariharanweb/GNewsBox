//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTNewsReadyProtocol.h"
#import "HTNews.h"

@interface HTNewsFetcher : NSObject
@property(nonatomic, copy) NSString *newsURL;

+ (HTNewsFetcher *) instance;
- (void) addDelegate:(id<HTNewsReadyProtocol>) delegate;


- (void)fetchNews;
- (int) numberOfItems;
- (HTNews*) newsAtIndex:(int) index;
@end