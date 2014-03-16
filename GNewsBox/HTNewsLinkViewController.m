//
//  HTNewsLinkViewController.m
//  GNewsBox
//
//  Created by harihat on 3/16/14.
//  Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTNewsLinkViewController.h"

@interface HTNewsLinkViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HTNewsLinkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.news.link]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
