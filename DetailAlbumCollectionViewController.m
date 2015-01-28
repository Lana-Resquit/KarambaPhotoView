//
//  DetailAlbumCollectionViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailAlbumCollectionViewController.h"
#import "DetailAlbumCollectionViewCell.h"
#import "OnePhotoViewController.h"

#import "Photo.h"
#import "VKPhotosManager.h"
#import "VKPhotosCommunicator.h"
#import "AFNetworking.h"

@interface DetailAlbumCollectionViewController () <VKPhotosManagerDelegate> {

NSArray *_photos;
VKPhotosManager *_manager;
}
@end

@implementation DetailAlbumCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.detailItem.title;
    
    _manager = [[VKPhotosManager alloc]init];
    _manager.communicator = [[VKPhotosCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchPhotosInAlbum:self.detailItem.albumId];
}

#pragma mark - VKPhotosManagerDelegate

-(void)didReceivePhotos:(NSArray *)photos {
    
    _photos = photos;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });

}

-(void)fetchingPhotosFailedWithError:(NSError *)error {
    
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 0, 10, 0);
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Create cell");
    DetailAlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Photo *photo = _photos[indexPath.row];
    [cell.indicatorCollection startAnimating];
    
    NSURL *url = [NSURL URLWithString:photo.photoURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [cell.indicatorCollection stopAnimating];
        cell.imageView.image = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
    }];
    [cell setLoadingOperation:requestOperation];
    [requestOperation start];

    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowAlbumDetails"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]lastObject];
        Photo *photo = _photos[indexPath.row];
        
        OnePhotoViewController *destController = [segue destinationViewController];
        [destController setPhotoItem: photo];
    }
    
}

@end
