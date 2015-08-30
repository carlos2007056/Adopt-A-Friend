//
//  Login.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/24/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Login.h"
#import "Register.h"
#import "Declarations.h"
#import "MainPage.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnLoginPressed:(id)sender {
    NSString *user = _txtFAlias.text;
    NSString *pass = _txtFPassword.text;
    
    if (user == maUserAlias[0] && pass == maUserPassword[0]) {
        MainPage *welcome= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainPage"];
        [self presentViewController:welcome animated:YES completion:nil];
    }
    else{
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Datos Incorrectos"
                                                           message:@"Favor de ingresar los datos corectos."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [theAlert show];
        
    
    }
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    //Method for moving to the next textfield when the "next" key is pressed
    print(NSLog(@"textFieldShouldReturn"))
    if(textField.returnKeyType == UIReturnKeyNext) {
        if (textField == self.txtFAlias) {
            [self.txtFPassword becomeFirstResponder];
        }
        
        
    }
    else if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }

    return YES;
}
-(void)dismissKeyboard {

    [_txtFAlias resignFirstResponder];
    [_txtFPassword resignFirstResponder];

}

@end
