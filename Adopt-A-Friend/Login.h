//
//  Login.h
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/24/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtFAlias;
@property (strong, nonatomic) IBOutlet UITextField *txtFPassword;
- (IBAction)btnLoginPressed:(id)sender;

@end
