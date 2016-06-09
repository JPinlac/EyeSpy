//
//  Image.h
//  EyeSpy
//
//  Created by DetroitLabs on 6/9/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Image : NSObject
@property (strong, nonatomic) NSArray *locations;
@property (strong, nonatomic) NSArray *objectsToBeFound;
@property (strong, nonatomic) UIImage *image;
@end
