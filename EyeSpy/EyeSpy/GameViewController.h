//
//  GameViewController.h
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image.h"
#import "User.h"
@interface GameViewController : UIViewController
@property NSString *selectedImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageInPlay;
@property NSMutableArray *userDatabase;
@end
