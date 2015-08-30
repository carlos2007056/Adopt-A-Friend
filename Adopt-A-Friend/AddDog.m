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
    
    //save the image in sandbox
    
    /*
    NSString *imgName = [self.txtFName.text stringByAppendingString:@".jpg"];
    [imgName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    [maImgs addObject:imgName];
    UIImage *image = self.imageView.image;
    //permament directory
    NSString *imagePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *imageName = [imagePath stringByAppendingPathComponent:imgName];
    //NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:imgName];
    //[UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    BOOL result = [imageData writeToFile:imageName atomically:YES];
    NSLog(@"Saved to %@? %@", imageName, (result? @"YES": @"NO"));
    */
    
    
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) objectAtIndex:0];
    NSInteger tag = self.imageView.tag;
    UIImage *image = self.imageView.image;
    NSString *imageName = [NSString stringWithFormat:@"Image%li.jpg",(long)tag];
    NSString *imagePath = [docsDir stringByAppendingPathComponent:imageName];
    [maImgs addObject:imageName];
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:imagePath atomically:YES];
    
    
    
    //save the NSArray to disk to reuse
    //Creating a file path under iOS:
    //Search for the app's documents directory (copy+paste from Documentation)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // Create the full file path by appending the desired file name
    
    
    NSString *arrayFilemaNames = [documentsDirectory stringByAppendingPathComponent:@"maNames.dat"];
    //NSMutableArray *maNames = [[NSMutableArray alloc] initWithContentsOfFile: arrayFilemaNames];
    [maNames writeToFile:arrayFilemaNames atomically:YES];
    
    
    NSString *arrayFilemaDesc = [documentsDirectory stringByAppendingPathComponent:@"maAges.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maAges writeToFile:arrayFilemaDesc atomically:YES];
    
    NSString *arrayFilemaImgs = [documentsDirectory stringByAppendingPathComponent:@"maImgs.dat"];
    //NSMutableArray *maNames = [[NSMutableArray alloc] initWithContentsOfFile: arrayFilemaNames];
    [maNames writeToFile:arrayFilemaImgs atomically:YES];
    
    
    NSString *arrayFilemaLat = [documentsDirectory stringByAppendingPathComponent:@"maBreeds.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maBreeds writeToFile:arrayFilemaLat atomically:YES];
    
    
    NSString *arrayFilemaLong = [documentsDirectory stringByAppendingPathComponent:@"maDescriptions.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maDescriptions writeToFile:arrayFilemaLong atomically:YES];
    
    
    
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
