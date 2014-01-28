//
//  Person.h
//  First Game
//
//  Created by Frank Regel on 10.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (readonly)NSString *nickName;
@property (readonly)int score;
@property (readonly)int lastLevel;
@property (readonly)BOOL hasSupersuit;
-(void)updateNicknameWith:(NSString*)newNickName;
-(void)updateScoreWith:(int)newScore;
-(void)updateLevelWith:(int)newLevel;
-(void)toggleSuitStateWith:(BOOL)supersuitState;
@end
