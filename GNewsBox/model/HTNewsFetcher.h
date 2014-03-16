//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTNewsReadyProtocol.h"
#import "HTNews.h"

@interface HTNewsFetcher : NSObject
- (id)initWithListener:(id<HTNewsReadyProtocol>) delegate;

- (void)fetchNews:(NSString *)url;
- (int) numberOfItems;
- (HTNews*) newsAtIndex:(int) index;
@end