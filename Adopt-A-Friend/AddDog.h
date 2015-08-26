//
//  AddDog.h
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDog : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate >

@property (strong, nonatomic) IBOutlet UITextField *txtFName;
@property (strong, nonatomic) IBOutlet UITextField *txtFBreed;
@property (strong, nonatomic) IBOutlet UITextField *txtFAge;
@property (strong, nonatomic) IBOutlet UITextView *txtVDesc;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)btnAddImagePressed:(id)sender;

- (IBAction)btnSavePressed:(id)sender;
- (IBAction)btnBackPressed:(id)sender;

@end
