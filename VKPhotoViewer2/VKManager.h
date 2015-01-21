//
//  VKManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKCommunicatorDelegate.h"
#import "VKManagerDelegate.h"
#import "VKCommunicatorDelegate.h"

@class VKCommunicator;

@interface VKManager : NSObject<VKCommunicatorDelegate>

@property (strong, nonatomic) VKCommunicator *communicator;
@property (weak, nonatomic) id<VKManagerDelegate> delegate;

-(void)fetchAlbumsInUser;

@end
