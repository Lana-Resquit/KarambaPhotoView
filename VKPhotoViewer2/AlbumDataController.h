//
//  AlbumDataController.h
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface AlbumDataController : NSObject

-(NSUInteger)albumCount;
-(Album *) albumAtIndex:(NSUInteger)index;
-(void)addAlbumWithTitle:(NSString *)title andPhoto:(UIImage *)photo;

@end
