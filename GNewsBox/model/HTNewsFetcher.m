//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTNewsFetcher.h"
#import "HTNews.h"
#import "HTNewsReadyProtocol.h"
#import "RSSParser.h"
#import <ObjectiveSugar.h>

@interface HTNewsFetcher ()
@property NSMutableArray *news;
@property id<HTNewsReadyProtocol> delegate;
@end


@implementation HTNewsFetcher

- (id)initWithListener:(id<HTNewsReadyProtocol>) delegate {
    self = [super init];
    if (self) {
        self.news  = [[NSMutableArray alloc] init];
        self.delegate = delegate;
    }
    return self;
}

- (void)fetchNews:(NSString *)url {
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];


    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
        [feedItems each:^(id feedItem) {
           HTNews *newsItem = [[HTNews alloc] initWithFeed:feedItem];
           [self.news addObject:newsItem];
        }];
        [self.delegate notifyNewsReady];
    } failure:^(NSError *error) {

        NSLog(@"%@ Errrr", error);

    }];

}

- (int)numberOfItems {
    return self.news.count;
}

- (HTNews *)newsAtIndex:(int)index {
    return self.news[index];
}

@end