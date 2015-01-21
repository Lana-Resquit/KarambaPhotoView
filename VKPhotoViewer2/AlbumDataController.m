//
//  AlbumDataController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumDataController.h"
#import "VKContentManager.h"

@interface AlbumDataController ()

@property (nonatomic, strong) VKContentManager * vkContentManager;

-(void)initializeDefaultAlbum;

@end

@implementation AlbumDataController

-(id) init {
    self = [super init];
    
    if (self) {
        _albumList = [[NSMutableArray alloc]init];
        [self initializeDefaultAlbum];
        return self;
    }
    return nil;
}

-(void)initializeDefaultAlbum {
    [self addAlbum];
}

-(void)addAlbum {
     self.vkContentManager = [[VKContentManager alloc]init];
    [self.vkContentManager searchAlbumsInUser];
}

-(NSUInteger)albumCount {
    return [self.albumList count];
}

-(Album *)albumAtIndex:(NSUInteger)index {
    return [self.albumList objectAtIndex:index];
}

@end
