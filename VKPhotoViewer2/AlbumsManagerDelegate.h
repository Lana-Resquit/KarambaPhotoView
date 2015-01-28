//
//  VKManagerDelegate.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlbumsManagerDelegate

-(void)didReceiveAlbums:(NSArray *)albums;
-(void)fetchingAlbumsFailedWithError:(NSError *)error;

@end
