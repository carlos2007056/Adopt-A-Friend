//
//  DogDetails.m
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/25/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "DogDetails.h"
#import "Declarations.h"
#import "AddDog.h"
#import "MyDogs.h"

@interface DogDetails ()

@end

@implementation DogDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];
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
    self.lblName.text   = maNames[miCharacterIndex];
    self.lblBreed.text  = maBreeds[miCharacterIndex];
    self.lblAge.text    = maAges[miCharacterIndex];
    self.lblDescription.text = maDescriptions[miCharacterIndex];
    if ([UIImage imageNamed:maImgs[miCharacterIndex]]== nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maImgs[miCharacterIndex]];
        self.imgDog.image = [UIImage imageWithData:[NSData dataWithContentsOfFile: cachedImagePath]];
    }
    else{
        self.imgDog.image  = [UIImage imageNamed:maImgs[miCharacterIndex]];
    }
    
    self.lblDescription.text = maDescriptions[miCharacterIndex];
}
- (IBAction)btnBackPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
