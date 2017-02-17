//
//  SplashScreenViewController.m
//  Splash Screen
//
//  Created by Hayden Goldman on 2/15/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.splashScreenLabel.alpha = 0;
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"SeenSplashScreen"] == NO){
        //animation goes here
        [UIView animateWithDuration:2.0f delay:1.0f options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{[self.splashScreenLabel setAlpha:1.0f];}
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:2.5f animations:^{
                                 [self.splashScreenLabel setAlpha:0.0f];
                             } completion:^(BOOL finished){
                                 //[self performSegueWithIdentifier:@"segue" sender:self];
                                 [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(segueMethod) userInfo:nil repeats:NO];
                             }];
                         }];
        [userDefaults setBool:YES forKey:@"SeenSplashScreen"];
        [userDefaults synchronize];
   
    } else {
        [NSTimer scheduledTimerWithTimeInterval:0.00 target:self selector:@selector(segueMethod) userInfo:nil repeats:NO];
    }
}


-(void) segueMethod{
    [self performSegueWithIdentifier:@"segue" sender:self];
}




@end
