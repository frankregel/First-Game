//
//  Person.m
//  First Game
//
//  Created by Frank Regel on 10.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "Person.h"

@interface Person()
@property NSUserDefaults *existingValue;
@property NSUserDefaults *updateValue;

@end

@implementation Person
#define nickname @"nickName"
#define score @"score"
#define lastlevel @"lastLevel"
#define hassupersuit @"hasSupersuit"

- (id)init
{
    self = [super init];

    if (self)
    {
        //die beiden Objekte sind nur wegen der Lesbarkeit doppelt
        _existingValue = [NSUserDefaults standardUserDefaults];
        _updateValue = [NSUserDefaults standardUserDefaults];

        NSLog(@"self init");
        NSLog(@"%s",__PRETTY_FUNCTION__);
    
        if ([_existingValue objectForKey:nickname]!= nil)
        {
            _nickName = [_existingValue objectForKey:nickname];
        }
        if ([_existingValue objectForKey:score]!= nil)
        {
            //String auslesen und dann in int umwandeln
            NSNumber *scoreNumber = [_existingValue objectForKey:score];
            _score = [scoreNumber intValue];
        }
        if ([_existingValue objectForKey:lastlevel]!= nil)
        {
            NSNumber *levelNumber = [_existingValue objectForKey:lastlevel];
            _lastLevel = [levelNumber intValue];
        }
        if ([_existingValue objectForKey:hassupersuit]!= nil)
        {
             NSNumber *toggleSuitNumber = [_existingValue objectForKey:hassupersuit];
            _hasSupersuit = [toggleSuitNumber boolValue];
        }
    }
    return self;
}

//Jeden Wert als eigene Methode, da sie unabhängig voneinander gesetzt werden können
-(void)updateNicknameWith:(NSString*)newNickName
{
    [_updateValue setObject:newNickName forKey:nickname];
    [_updateValue synchronize];
    _nickName = newNickName;
}
-(void)updateScoreWith:(int)newScore
{
    //statt Casting NS Number verwenden
    //NSString *scoreString = [NSString stringWithFormat:@"%d", newScore];
    //NSNUmber ist Container
    NSNumber *scoreNumber = [NSNumber numberWithInt:newScore];
    [_updateValue setObject:scoreNumber forKey:score];
    [_updateValue synchronize];
}

-(void)updateLevelWith:(int)newLevel
{
    NSNumber *levelNumber = [NSNumber numberWithInt:newLevel];
    [_updateValue setObject:levelNumber forKey:lastlevel];
    [_updateValue synchronize];
}
-(void)toggleSuitStateWith:(BOOL)supersuitState
{
    NSNumber *toggleStateNumber = [NSNumber numberWithBool:supersuitState];
    [_updateValue setObject:toggleStateNumber forKey:hassupersuit];
    [_updateValue synchronize];
}



@end
