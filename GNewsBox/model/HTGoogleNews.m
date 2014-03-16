//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTGoogleNews.h"
#import "HTNews.h"
#import "HTNewsReadyProtocol.h"

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
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline1"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline2"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline3"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline4"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline1"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline2"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline3"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline4"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline1"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline2"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline3"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline4"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline1"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline2"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline3"]];
    [_news addObject:[[HTNews alloc] initWithHeadline:@"Headline4"]];
    [self.delegate notifyNewsReady];
}

- (int)numberOfItems {
    return self.news.count;
}

- (HTNews *)newsAtIndex:(int)index {
    return self.news[index];
}

@end