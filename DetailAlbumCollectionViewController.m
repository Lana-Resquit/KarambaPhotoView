//
//  DetailAlbumCollectionViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailAlbumCollectionViewController.h"
#import "PhotoDataController.h"
#import "DetailAlbumCollectionViewCell.h"
#import "OnePhotoViewController.h"

@interface DetailAlbumCollectionViewController ()

@property (nonatomic, strong) PhotoDataController *photoDataController;

@end

@implementation DetailAlbumCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photoDataController = [[PhotoDataController alloc]init];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.photoDataController photoCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailAlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Photo *photoIm = [self.photoDataController photoAtIndex:indexPath.row];
    cell.imageView.image = photoIm.photo;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowAlbumDetails"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]lastObject];
        Photo *photo = [self.photoDataController photoAtIndex:indexPath.row];
        
        OnePhotoViewController *destController = [segue destinationViewController];
        [destController setPhotoItem: photo];
    }
    
}

@end
