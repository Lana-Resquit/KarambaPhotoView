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
#import "VKAlbumsManager.h"
#import "VKAlbumsCommunicator.h"
#import "AFNetworking.h"

@interface AlbumTableViewController () <VKAlbumsManagerDelegate> {
    NSArray *_albums;
    VKAlbumsManager *_manager;
}
@end

@implementation AlbumTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    _manager = [[VKAlbumsManager alloc]init];
    _manager.communicator = [[VKAlbumsCommunicator alloc]init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchAlbumsInUser];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
   
}

#pragma mark - VKManagerDelegate

-(void)didReceiveAlbums:(NSArray *)albums {
    _albums = albums;
    [self.tableView reloadData];
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
    cell.albumTitle.text = album.title;
    
    NSURL *url = [NSURL URLWithString:album.urlPhoto];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
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
