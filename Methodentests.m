//
//  Methodentests.m
//  First Game
//
//  Created by Frank Regel on 16.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "Methodentests.h"

@implementation Methodentests
#define nickName @"nick"

//int: MethodennameAnfang: input Parameter %Füllwort%: 2. Parameter %Füllwort%: usw
-(int) calculateValueWith: (int)FirstValue and: (int)secondValue undAuch: (int)drittesValue
{
    
    return 0;
}

//Aufruf der int Methode
-(void) Aufruf
{
    [self calculateValueWith:10 and:20 undAuch:30];
    
    [self multiplyFirstValue:10 withThis:10 andSubtractValue:1];
}

- (int)multiplyFirstValue:(int)firstValue withThis:(int)secondValue andSubtractValue:(int)subtractValue
{
    return firstValue * secondValue - subtractValue;
}

//Dictionary

-(void) saveUserDefaultsFromDictionary: (NSDictionary*) playerValueDictionary
{
    NSString *name = [playerValueDictionary objectForKey:nickName];
    name = @"teststring";
    
}
//Array incl. Abfrage on Werte im Rahmen existieren und ob sie vom erwarteten Typ sind
-(void) saveUserDefaultsFromArray: (NSArray*) playerValueArray
{
    if ([playerValueArray count] >=10)
    {
        id someObject = [playerValueArray objectAtIndex:0];
        
        if ([someObject isKindOfClass:[NSString class]])
        {
             NSString *name = [playerValueArray objectAtIndex:0];
            name = @"teststring";
        }
    }
}

//Kuddelmuddel
-(void) UpdateUserDefaultsWithNickname: (NSString*)name andScore: (int)score andHasSuit:(BOOL)hasSuit
{
    //[self updateNicknameWith:name]; Wert an Methode übergeben
}



@end
