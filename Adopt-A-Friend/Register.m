//
//  Register.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Register.h"
#import "MainPage.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

static int CorrectData =0;
static int CorrectData1 =0;

static UIStoryboard    *storyboard;
static int iKeyboardHeight = 100;


@interface Register ()
@property (nonatomic,strong) NSDictionary   *diFacebookResult;
@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = CGPointMake(160.0, 110.0);
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)initController {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
/**********************************************************************************************/
#pragma mark - Action methods methods
/**********************************************************************************************/
- (IBAction)btnNextPressed:(id)sender {
    if (CorrectData==0||CorrectData1==0) {
        
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Datos Incorrectos"
                                                           message:@"Favor de completar los campos resaltados."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [theAlert show];
        
    } else if (CorrectData==1&&CorrectData1==1)
    {
        
        MainPage *welcome= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainPage"];
        [self presentViewController:welcome animated:YES completion:nil];
        
        
    }
    //-------------------------------------------------------------------------------
}

//-------------------------------------------------------------------------------
- (IBAction)btnMenuPressed:(id)sender {
}
//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
- (IBAction)btnFacebookPressed:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile",@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"] && [result.grantedPermissions containsObject:@"public_profile"]) {
                // Do work
                if ([FBSDKAccessToken currentAccessToken]) {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         if (!error) {
                             self.diFacebookResult = result;
                             NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                             [self doLoginWithFacebook];
                         }
                     }];
                }
            }
        }
    }];
}
/**********************************************************************************************/
#pragma mark - Operation methods
/**********************************************************************************************/
- (void)doLoginWithFacebook {
    print(NSLog(@"self.diFacebookResult = %@", self.diFacebookResult))
    NSString *stName    = [self.diFacebookResult valueForKey:@"name"];
    NSString *stId      = [self.diFacebookResult valueForKey:@"id"];
    
    NSArray *items      = [stName componentsSeparatedByString:@" "];
    NSString *str1      = [items objectAtIndex:0];
    NSString *str2      = [items objectAtIndex:1];
    NSString *str3      = [items objectAtIndex:2];
    print(NSLog(@"stName = %@", stName));
    
    self.txtName.text           = str1;
    self.txtFirstSurname.text   = str2;
    self.txtSecondSurname.text  = str3;
}

/**********************************************************************************************/
#pragma mark - Text fields delegates
/**********************************************************************************************/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    print(NSLog(@"txtName"))
    /*if (textField == self.txtName) {
     }*/
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newString length] > 0) {
        if ([newString length] > nMaxTxtData) {
            return NO;
        }
    }
    return YES;
}
//-------------------------------------------------------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    print(NSLog(@"textFieldDidBeginEditing"))
    if (textField == self.txtName) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup1.frame.origin.y + 20)  animated:YES];
    }
    else if (textField == self.txtFirstSurname) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup1.frame.origin.y + 20)  animated:YES];
    }
    else if (textField == self.txtSecondSurname) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup2.frame.origin.y - 10)  animated:YES];
    }
    else if (textField == self.txtEmail) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup3.frame.origin.y - 10)  animated:YES];
    }
    else if (textField == self.txtPhone) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup3.frame.origin.y - 10)  animated:YES];
    }
}



- (void)textFieldDidChange:(UITextField *)textField {
    
    if ([_txtPassword.text isEqualToString: _txtPasswordConfirm.text]) {
        _lblPassword.textColor = [UIColor greenColor];
        _lblPasswordConfirm.textColor = [UIColor greenColor];
        
        CorrectData1=1;
        
    }else{
        _lblPassword.textColor = [UIColor redColor];
        _lblPasswordConfirm.textColor = [UIColor redColor];
        CorrectData1=0;
    }
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    //email
    if ([_txtEmail.text length]==0 || [self validateEmailWithString:_txtEmail.text]) {
        _lblEmail.textColor = [UIColor greenColor];
        [_txtEmail resignFirstResponder];
        CorrectData=1;
        
    }else{
        
        //[[[UIAlertView alloc] initWithTitle:@"Error" message:@"Por favor ingresa un email valido" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        CorrectData=0;
        [_txtEmail resignFirstResponder];
        _lblEmail.textColor = [UIColor redColor];
        
        return NO;
    }
    
    return YES;
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



//-------------------------------------------------------------------------------
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    //Method for moving to the next textfield when the "next" key is pressed
    print(NSLog(@"textFieldShouldReturn"))
    if(textField.returnKeyType == UIReturnKeyNext) {
        if (textField == self.txtName) {
            [self.txtFirstSurname becomeFirstResponder];
        }
        else if (textField == self.txtFirstSurname) {
            [self.txtSecondSurname becomeFirstResponder];
        }
        else if (textField == self.txtSecondSurname) {
            //[self.txtSecondSurname becomeFirstResponder];
            [textField resignFirstResponder];
            //self.vPicker.hidden = NO;
        }
        else if (textField == self.txtEmail) {
            [self.txtPhone becomeFirstResponder];
        }
        else if (textField == self.txtPhone) {
            [self.txtPassword becomeFirstResponder];
        }
        else if (textField == self.txtPassword) {
            [self.txtPasswordConfirm becomeFirstResponder];
        }
        print(NSLog(@"UIReturnKeyNext"))
    } else if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    return YES;
}
/**********************************************************************************************/
#pragma mark - Keyboard methods
/**********************************************************************************************/
- (void)keyboardWillShow:(NSNotification *)notification {
    print(NSLog(@"keyboardDidShow"))
    CGSize keyboardSize     = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    iKeyboardHeight         = MIN(keyboardSize.height,keyboardSize.width);
    self.svRegister.contentSize = CGSizeMake(self.svRegister.frame.size.width, self.svRegister.frame.size.height + iKeyboardHeight + 40);
}


-(void)dismissKeyboard {
    [_txtName resignFirstResponder];
    [_txtFirstSurname resignFirstResponder];
    [_txtSecondSurname resignFirstResponder];
    [_txtDate resignFirstResponder];
    [_txtEmail resignFirstResponder];
    [_txtPhone resignFirstResponder];
    [_txtPassword resignFirstResponder];
    [_txtPasswordConfirm resignFirstResponder];
}



@end
