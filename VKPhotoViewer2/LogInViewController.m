//
//  ViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

static NSString *const NEXT_CONTROLLER_SEGUE_ID = @"START_WORK";
static NSArray  * SCOPE = nil;
static NSString *VK_APP_ID = @"4731732";

-(void)viewDidLoad {
    SCOPE = @[VK_PER_PHOTOS];
    [super viewDidLoad];
    
    [VKSdk initializeWithDelegate:self andAppId:VK_APP_ID];
    if ([VKSdk wakeUpSession]) {
        [self startWorking];
    }

}

- (IBAction)authorize:(id)sender {
    [VKSdk authorize:SCOPE revokeAccess:YES];
}

-(void)startWorking {
    [self performSegueWithIdentifier:NEXT_CONTROLLER_SEGUE_ID sender:self];
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [vc presentIn:self];
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
    [self authorize:nil];
}

- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError {
    [[[UIAlertView alloc] initWithTitle:nil message:@"Access denied" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    [self startWorking];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

@end
