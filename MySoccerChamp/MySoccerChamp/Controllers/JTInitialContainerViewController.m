//
//  JTInitialContainerViewController.m
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import "JTInitialContainerViewController.h"
#import "JTLoginViewController.h"
#import "JTHomeViewController.h"
#import "StoryboardUtil.h"
#import <Parse/Parse.h>

@interface JTInitialContainerViewController ()
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) JTHomeViewController *homeVC;
@property (nonatomic, strong) JTLoginViewController *loginVC;

@end

@implementation JTInitialContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![PFUser currentUser]) {
        [self displayContentController:self.loginVC];
    } else {
        [self displayContentController:self.homeVC];
    }
    
    [self addObservers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self removeObservers];
    // Dispose of any resources that can be recreated.
}

-(JTLoginViewController *)loginVC {
    if (!_loginVC) {
        _loginVC = (JTLoginViewController *)[StoryboardUtil viewControllerWithStoryboard:@"Main" controllerName:@"JTLoginViewController"];
    }
    return _loginVC;
}

-(JTHomeViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = (JTHomeViewController *)[StoryboardUtil viewControllerWithStoryboard:@"Main" controllerName:@"JTHomeViewController"];
    }
    return _homeVC;
}


#pragma mark - Container View Methods
- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = self.containerView.frame;
    [self.containerView addSubview:content.view];
    [content didMoveToParentViewController:self];
}

-(void)swapFromLoginToHome {
    
    [self.loginVC willMoveToParentViewController:nil];
    [self addChildViewController:self.homeVC];
    [self.containerView addSubview:self.homeVC.view];
    
    self.homeVC.view.frame = [self newViewStartFrame];
    CGRect endFrame = [self oldViewEndFrame];
    
    [self transitionFromViewController: self.loginVC toViewController: self.homeVC
                              duration: 0.25 options:0
                            animations:^{
                                self.homeVC.view.frame = self.containerView.frame;
                                self.loginVC.view.frame = endFrame;
                            }
                            completion:^(BOOL finished) {
                                [self.loginVC removeFromParentViewController];
                                [self.homeVC didMoveToParentViewController:self];
                            }];
}

-(CGRect)oldViewEndFrame {
    return CGRectMake(-320, 0, self.loginVC.view.frame.size.width, self.loginVC.view.frame.size.height);
}

-(CGRect)newViewStartFrame {
    return CGRectMake(320, 0, self.containerView.frame.size.width, self.containerView.frame.size.height);
}

#pragma mark - Notifications

-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(swapFromLoginToHome)
                                                 name:kSwapFromLoginToHomeNotification object:nil];
}

-(void)removeObservers{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSwapFromLoginToHomeNotification object:nil];
}

@end
