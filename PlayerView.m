//
//  PlayerView.m
//  First Game
//
//  Created by Frank Regel on 13.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "PlayerView.h"

@interface PlayerView ()
@property UIImage *heroImage;
@end

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        //auf der playerView den Spieler aufrufen
        [self loadHero];
    }
    return self;
}

-(void) loadHero
{
    UIImage *heroImage = [UIImage imageNamed:@"hero.png"];
    UIImageView *heroBackground = [[UIImageView alloc]initWithFrame:CGRectMake(110,250, heroImage.size.width, heroImage.size.height)];
    heroBackground.image = heroImage;
    [self addSubview:heroBackground];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
