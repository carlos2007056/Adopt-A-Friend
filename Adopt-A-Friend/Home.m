//
//  Home.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Home.h"
#import "Register.h"
#import "Login.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self initController];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {

    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.lblBtnLogin.layer.borderColor    = [UIColor whiteColor].CGColor;
    self.lblBtnLogin.layer.borderWidth    = 1;
    self.lblBtnLogin.clipsToBounds        = YES;
    self.lblBtnLogin.layer.cornerRadius   = 8;
    
    self.lblBtnRegister.layer.borderColor    = [UIColor whiteColor].CGColor;
    self.lblBtnRegister.layer.borderWidth    = 1;
    self.lblBtnRegister.clipsToBounds        = YES;
    self.lblBtnRegister.layer.cornerRadius   = 8;
}


/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/

- (IBAction)btnLoginPressed:(id)sender {
    Login *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Login"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)btnRegisterPressed:(id)sender {
    Register *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Register"];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
