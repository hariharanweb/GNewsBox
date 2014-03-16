//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTGoogleNews.h"
#import "HTNews.h"
#import "HTNewsReadyProtocol.h"
#import "RSSParser.h"
#import <ObjectiveSugar.h>

@interface HTGoogleNews()
@property NSMutableArray *news;
@property id<HTNewsReadyProtocol> delegate;
@end


@implementation HTGoogleNews

- (id)initWithListener:(id<HTNewsReadyProtocol>) delegate {
    self = [super init];
    if (self) {
        self.news  = [[NSMutableArray alloc] init];
        self.delegate = delegate;
    }
    return self;
}

- (void) fetchNews {
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&output=rss"]];


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