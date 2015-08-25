//
//  Home.h
//  Adopt-A-Friend
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

@interface Home : UIViewController

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) IBOutlet UIView *vVideo;
@property (strong, nonatomic) IBOutlet UIButton *lblBtnLogin;
@property (strong, nonatomic) IBOutlet UIButton *lblBtnRegister;

//Actions
- (IBAction)btnLoginPressed:(id)sender;
- (IBAction)btnRegisterPressed:(id)sender;
@end
