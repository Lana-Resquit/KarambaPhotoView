//
//  AlbumTableViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "AlbumTableViewCell.h"
#import "DetailAlbumCollectionViewController.h"

#import "Album.h"
#import "AlbumsManager.h"
#import "AlbumsCommunicator.h"
#import "AFNetworking.h"
#import "VKSdk.h"

@interface AlbumTableViewController () <AlbumsManagerDelegate> {
    NSArray *_albums;
    AlbumsManager *_manager;
}

@end

@implementation AlbumTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[AlbumsManager alloc]init];
    _manager.communicator = [[AlbumsCommunicator alloc]init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchAlbumsInUser];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
   
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed. We know this is true because self is no longer
        // in the navigation stack.
        [VKSdk forceLogout];
    }
    [super viewWillDisappear:animated];
}

#pragma mark - VKManagerDelegate

-(void)didReceiveAlbums:(NSArray *)albums {
    _albums = albums;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)fetchingAlbumsFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    Album *album = _albums[indexPath.row];
    [cell.indicator startAnimating];
    cell.albumTitle.text = album.title;
    
    NSURL *url = [NSURL URLWithString:album.urlPhoto];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [cell.indicator stopAnimating];
        cell.mainPhoto.image = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
    }];
    [requestOperation start];
  
    return cell;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowAlbumDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Album *album = _albums[indexPath.row];;
        DetailAlbumCollectionViewController *destController = [segue destinationViewController];
        [destController setDetailItem:album];
    }
    
}

@end
