//
//  AlbumDataController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumDataController.h"

@interface AlbumDataController ()

@property (nonatomic, readonly) NSMutableArray *albumList;


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
    [self addAlbumWithTitle:@"Summer" andPhoto:[UIImage imageNamed:@"IKV7100.png"]];
   [self addAlbumWithTitle:@"Autumn" andPhoto:[UIImage imageNamed:@"IKV7100.png"]];
}

-(void)addAlbumWithTitle:(NSString *)title andPhoto:(UIImage *)photo {
    Album *newAlbum = [[Album alloc]initWhithTitle:title andPhoto:photo];
    [self.albumList addObject:newAlbum];
}

-(NSUInteger)albumCount {
    return [self.albumList count];
}

-(Album *)albumAtIndex:(NSUInteger)index {
    return [self.albumList objectAtIndex:index];
}

@end
