//
//  VKCommunicator.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKCommunicatorDelegate;

@interface VKCommunicator : NSObject

@property (weak, nonatomic) id<VKCommunicatorDelegate> delegate;

-(void)searchAlbumsInUser;

@end
