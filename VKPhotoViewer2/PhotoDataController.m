//
//  PhotoDataController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 13.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PhotoDataController.h"

@interface PhotoDataController ()

@property (nonatomic, readonly) NSMutableArray *albumPhotos;

-(void)initializePhotos;

@end

@implementation PhotoDataController

-(id)init {
    self = [super init];
    if (self) {
        _albumPhotos = [[NSMutableArray alloc]init];
        [self initializePhotos];
        return self;
    }
    return nil;
}

-(void)initializePhotos {
    [self addPhoto:[UIImage imageNamed:@"IKV7100.png"]];
    [self addPhoto:[UIImage imageNamed:@"IKV7100.png"]];
   
}

-(void)addPhoto:(UIImage *)photo {
    Photo *newPhoto = [[Photo alloc]initWithPhoto:photo];
    [self.albumPhotos addObject:newPhoto];
}

-(NSUInteger)photoCount {
    return [self.albumPhotos count];
}

-(Photo *)photoAtIndex:(NSUInteger)index {
    return [self.albumPhotos objectAtIndex:index];
}

@end
