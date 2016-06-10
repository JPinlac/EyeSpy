//
//  User.h
//  EyeSpy
//
//  Created by DetroitLabs on 6/9/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *username;
@property NSString *password;
@property NSTimeInterval eyespy2HighScore;
@property NSTimeInterval eyespy3HighScore;
-(id)initUser:username :password;
- (NSComparisonResult)compareEyespy2:(User *)otherObject;
- (NSComparisonResult)compareEyespy3:(User *)otherObject;
@end
