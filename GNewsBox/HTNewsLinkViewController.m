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
    [self.webView setScalesPageToFit:YES];
    [self.webView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
  [self.navigationItem setTitle:@"Loading...."];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.navigationItem setTitle:@"Loading...."];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.navigationItem setTitle:@"Your content"];
}


@end
