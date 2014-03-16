//
//  HTViewController.m
//  GNewsBox
//
//  Created by harihat on 3/16/14.
//  Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTViewController.h"
#import "HTNewscell.h"
#import "HTNewsFetcher.h"
#import "HTNewsLinkViewController.h"
#import "HTHeaderView.h"

@interface HTViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property HTNewsFetcher *newsFetcher;
@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.newsFetcher = [[HTNewsFetcher alloc] initWithListener:self];
    [self.newsFetcher fetchNews:@"https://news.google.com/news/feeds?pz=1&cf=all&ned=in&hl=en&output=rss"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.newsFetcher numberOfItems];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"NewsCell";
    HTNewscell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: cellName forIndexPath:indexPath];
    cell.news = [self.newsFetcher newsAtIndex:indexPath.row];
    return cell;
}

- (void)notifyNewsReady {
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HTNewsLinkViewController * linkController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    linkController.news = [self.newsFetcher newsAtIndex:indexPath.row];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if(kind == UICollectionElementKindSectionHeader){
        HTHeaderView *header =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        return header;
    }
    return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];

}




@end
