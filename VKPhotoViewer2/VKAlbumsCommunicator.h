//
//  VKCommunicator.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKAlbumsCommunicatorDelegate;

@interface VKAlbumsCommunicator : NSObject

@property (weak, nonatomic) id<VKAlbumsCommunicatorDelegate> delegate;

-(void)searchAlbumsInUser;

@end
