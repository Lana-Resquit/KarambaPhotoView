//
//  AlbumTableViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumTableViewController.h"
#import "AlbumTableViewCell.h"
#import "AlbumDataController.h"
#import "DetailAlbumCollectionViewController.h"

@interface AlbumTableViewController ()

@property (nonatomic, strong) AlbumDataController * albumDataController;

@end

@implementation AlbumTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
   
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.albumDataController = [[AlbumDataController alloc]init];
    
}

-(void) showAlbumData{
//    self.albumDataController = [[AlbumDataController alloc]initWithSuccessCallback] <callback>
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.albumDataController albumCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    Album *album = [self.albumDataController albumAtIndex: indexPath.row];
    cell.albumTitle.text = album.title;
    cell.mainPhoto.image = album.photo;
    return cell;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowAlbumDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Album *album = [self.albumDataController albumAtIndex: indexPath.row];
        DetailAlbumCollectionViewController *destController = [segue destinationViewController];
        [destController setDetailItem:album];
    }
    
}

@end
