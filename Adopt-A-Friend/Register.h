//
//  Register.h
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
//Debug
#define nDebugEnable        1
#define print(x)            if(nDebugEnable){(x);}

//Texts
#define nMaxTxtData         50

@interface Register : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAlias;
@property (strong, nonatomic) IBOutlet UITextField *txtSurname;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtPasswordConfirm;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup1;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup2;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup3;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup4;
@property (strong, nonatomic) IBOutlet UIScrollView *svRegister;
@property (strong, nonatomic) IBOutlet UITextField *txtApellidoMaterno;
@property (strong, nonatomic) IBOutlet UILabel *lblPassword;
@property (strong, nonatomic) IBOutlet UILabel *lblPasswordConfirm;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;

- (IBAction)btnBackPressed:(id)sender;

- (IBAction)btnNextPressed:(id)sender;



- (IBAction)btnFacebookPressed:(id)sender;
/*
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
 FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
 [login logInWithReadPermissions:@[@"email", @"public_profile"]
 handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
 if (error) {
 // Process error
 } else if (result.isCancelled) {
 // Handle cancellations
 } else {
 // If you ask for multiple permissions at once, you
 // should check if specific permissions missing
 if ([result.grantedPermissions containsObject:@"email"]) {
 // Do work
 NSLog(@"result: %@",result);
 NSLog(@"profileUpdated");
 NSLog(@"Url: %@",[FBSDKProfile currentProfile].linkURL);
 NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
 NSLog(@"Name: %@",[FBSDKProfile currentProfile].firstName);
 NSLog(@"Last name: %@",[FBSDKProfile currentProfile].lastName);
 NSLog(@"Middle name: %@",[FBSDKProfile currentProfile].middleName);
 self.diFacebookResult = result;
 NSLog(@"fetched user:%@  and Email : %@", self.diFacebookResult,self.diFacebookResult[@"email"]);
 NSLog(@"diFacebookResult: %@", self.diFacebookResult);
 
 }
 }
 }];
 [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
 */

/*
 //-------------------------------------------------------------------------------
 -(void)profileUpdated:(NSNotification *) notification{
 NSLog(@"profileUpdated");
 NSLog(@"Url: %@",[FBSDKProfile currentProfile].linkURL);
 NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
 NSLog(@"Name: %@",[FBSDKProfile currentProfile].firstName);
 NSLog(@"Last name: %@",[FBSDKProfile currentProfile].lastName);
 NSLog(@"Middle name: %@",[FBSDKProfile currentProfile].middleName);
 NSLog(@"fetched user:%@  and Email : %@", self.diFacebookResult,self.diFacebookResult[@"email"]);
 NSLog(@"diFacebookResult: %@", self.diFacebookResult);
 }
 */

@end
