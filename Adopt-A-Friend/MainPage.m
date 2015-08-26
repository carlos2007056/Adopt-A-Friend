//
//  MainPage.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "MainPage.h"
#import "Register.h"
#import "Login.h"
#import "Declarations.h"
#import "AddDog.h"
#import "Swype.h"
#import "MyDogs.h"


@interface MainPage ()

@end

@implementation MainPage

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

- (IBAction)btnAddDogPressed:(id)sender {
    AddDog *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddDog"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}

- (IBAction)btnFindDogPressed:(id)sender {
    Swype *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Swype"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)btnMyDogsPressed:(id)sender {
    MyDogs *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyDogs"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}


@end
