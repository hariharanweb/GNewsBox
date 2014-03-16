//
//  HTViewController.m
//  GNewsBox
//
//  Created by harihat on 3/16/14.
//  Copyright (c) 2014 harihat. All rights reserved.
//

#import "HTViewController.h"

@interface HTViewController ()

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"NewsCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier: cellName forIndexPath:indexPath];

    return cell;
}

@end
