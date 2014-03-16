//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import <BlockRSSParser/RSSItem.h>
#import "HTNews.h"


@implementation HTNews

- (id)initWithFeed:(id)feedItem {
    self = [super init];
    if(self){
        self.headline = [feedItem title];
        self.link = [feedItem link];
    }
    return self;
}


@end