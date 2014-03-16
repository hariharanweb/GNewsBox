//
//  HTViewController.m
//  GNewsBox
//
//  Created by harihat on 3/16/14.
//  Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTViewController.h"
#import "HTNewscell.h"
#import "HTGoogleNews.h"
#import "HTNewsLinkViewController.h"

@interface HTViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property HTGoogleNews *googleNews;
@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.googleNews = [[HTGoogleNews alloc] initWithListener:self];
    [self.googleNews fetchNews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.googleNews numberOfItems];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"NewsCell";
    HTNewscell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: cellName forIndexPath:indexPath];
    cell.news = [self.googleNews newsAtIndex:indexPath.row];
    return cell;
}

- (void)notifyNewsReady {
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HTNewsLinkViewController * linkController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    linkController.news = [self.googleNews newsAtIndex:indexPath.row];
}


@end
