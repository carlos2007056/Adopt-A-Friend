//
//  DogDetails.h
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/25/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DogDetails : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgDog;
//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblBreed;
@property (strong, nonatomic) IBOutlet UILabel *lblAge;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
//Actions
- (IBAction)btnBackPressed:(id)sender;
@end
