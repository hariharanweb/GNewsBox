//
//  HTHeaderView.m
//  GNewsBox
//
//  Created by harihat on 3/16/14.
//  Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTHeaderView.h"
#import "HTNewsFetcher.h"

@interface HTHeaderView()
- (IBAction)headerClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *headers;
@end

@implementation HTHeaderView

- (IBAction)headerClicked:(id)sender {
    const NSArray *urls = @[
            @"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&output=rss",
            @"http://www.engadget.com/rss.xml",
            @"http://www.indiaglitz.com/channels/tamil/rss/news-rss.xml",
            @"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&topic=tc&output=rss",
            @"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&topic=w&output=rss",
            @"http://www.thehindu.com/news/?service=rss"
    ];

    HTNewsFetcher *newsFetcher = [HTNewsFetcher instance];
    [newsFetcher clearNews];
    UISegmentedControl *control = sender;
    NSInteger selectedIndex = [control selectedSegmentIndex];
    newsFetcher.newsURL = urls[selectedIndex];
    [newsFetcher fetchNews];
}
@end
