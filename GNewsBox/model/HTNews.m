//
// Created by harihat on 3/16/14.
// Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTNews.h"


@implementation HTNews

- (id)initWithHeadline:(NSString *)headline {
    self = [super init];
    if (self) {
        self.headline = headline;
    }
    return self;
}
@end