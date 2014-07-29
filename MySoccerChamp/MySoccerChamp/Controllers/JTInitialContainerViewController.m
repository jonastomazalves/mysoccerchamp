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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

-(CGRect) frameForContentController {
    return CGRectZero;
}


@end
