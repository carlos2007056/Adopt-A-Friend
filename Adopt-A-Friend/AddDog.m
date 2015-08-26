//
//  AddDog.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "AddDog.h"
#import "Declarations.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface AddDog ()

@end

@implementation AddDog

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    //keyboard dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//dismiss keyboard
-(void)dismissKeyboard {
    [_txtFName resignFirstResponder];
    [_txtFBreed resignFirstResponder];
    [_txtFAge resignFirstResponder];
    [_txtVDesc resignFirstResponder];
}

//add image
- (IBAction)btnAddImagePressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//text view delegates
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:

(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
    }
    
    return YES;
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    NSLog(@"Did begin editing");
    
    _txtVDesc = textView;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    NSLog(@"Did End editing");
    
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [textView resignFirstResponder];
    
    return YES;
    
}

- (IBAction)btnSavePressed:(id)sender {
    
    
    [_txtFName resignFirstResponder];
    [_txtFBreed resignFirstResponder];
    [_txtFAge resignFirstResponder];
    [_txtVDesc resignFirstResponder];
    
    //populate to the externs
    [maNames addObject:self.txtFName.text];
    [maBreeds addObject:self.txtFBreed.text];
    [maAges addObject:self.txtFAge.text];
    [maDescriptions addObject:self.txtVDesc.text];
    //save the image in memory
    NSString *imgName = [self.txtFName.text stringByAppendingString:@".png"];
    [imgName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    [maImgs addObject:imgName];
    UIImage *image = self.imageView.image;
    NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:imgName];
    [UIImagePNGRepresentation(image) writeToFile:cachedImagePath atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
