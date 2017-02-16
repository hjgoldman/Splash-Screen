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
                             [UIView animateWithDuration:2.0f animations:^{
                                 [self.splashScreenLabel setAlpha:0.0f];
                             } completion:nil];
                         }];
        [userDefaults setBool:YES forKey:@"SeenSplashScreen"];
        [userDefaults synchronize];
   
    } else {
        
        NSLog(@"YES");
        
        [self performSegueWithIdentifier:@"segue" sender:self];

    }
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
}





@end
