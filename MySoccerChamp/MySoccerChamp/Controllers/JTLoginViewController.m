//
//  JTLoginViewController.m
//  MySoccerChamp
//
//  Created by Jonas Tomaz on 7/29/14.
//  Copyright (c) 2014 Jonas Tomaz. All rights reserved.
//

#import "JTLoginViewController.h"
#import "JTAlertUtil.h"
#import <Parse/Parse.h>

@interface JTLoginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *facebookLoginButton;

@end

@implementation JTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma marck - Facebook Login

- (IBAction)facebookLogin:(id)sender {
    
    // Login PFUser using Facebook
    [PFFacebookUtils initializeFacebook];
    [PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                [JTAlertUtil showAlertWithTitle:@"Ooops!" andMessage:@"Facebook login is realy necesary!" andCancelButtonTitle:@"Ok"];
            } else {
                [JTAlertUtil showAlertWithTitle:@"Ooops!" andMessage:error.description andCancelButtonTitle:@"Ok"];
            }
        } else if (user.isNew) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kSwapFromLoginToHomeNotification object:nil];
            NSLog(@"User with facebook signed up and logged in!");
        } else {
            [[NSNotificationCenter defaultCenter] postNotificationName:kSwapFromLoginToHomeNotification object:nil];
            NSLog(@"User with facebook logged in!");
        }
    }];
    
}

@end
