//
//  User.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/9/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initUser:username :password{
    self.username = username;
    self.password = password;
    self.eyespy2HighScore = 0;
    self.eyespy3HighScore = 0;
    return self;
}
@end
