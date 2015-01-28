//
//  VKCommunicator.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlbumsCommunicatorDelegate;

@interface AlbumsCommunicator: NSObject

@property (weak, nonatomic) id<AlbumsCommunicatorDelegate> delegate;

-(void)searchAlbumsInUser;

@end
