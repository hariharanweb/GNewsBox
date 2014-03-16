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


+ (HTNewsFetcher *)instance {
    static HTNewsFetcher *fetcher;
    if(fetcher)
        return fetcher;

    fetcher = [[HTNewsFetcher alloc] init];
    return fetcher;
}

- (void)addDelegate:(id <HTNewsReadyProtocol>)delegate {
    self.delegate = delegate;
}

- (id)init {
    self = [super init];
    if (self) {
        self.news  = [[NSMutableArray alloc] init];
        self.newsURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&output=rss";
    }
    return self;
}

- (void)fetchNews {
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.newsURL]];
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

- (void)clearNews {
    [self.news removeAllObjects];
    [self.delegate notifyNewsReady];
}

- (int)numberOfItems {
    return self.news.count;
}

- (HTNews *)newsAtIndex:(int)index {
    return self.news[index];
}

@end