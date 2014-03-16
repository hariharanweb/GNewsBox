//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTGoogleNews.h"

@interface HTGoogleNews()
@property NSMutableArray *news;
@end


@implementation HTGoogleNews

- (id)init {
    self = [super init];
    if (self) {
        _news  = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) fetchNews {

}

@end