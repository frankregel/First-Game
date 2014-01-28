//
//  PlayViewController.m
//  First Game
//
//  Created by Frank Regel on 10.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "PlayViewController.h"
#import "Person.h"
#import "PlayerView.h"
#import "GamepadView.h"

@interface PlayViewController () <GamepadViewDelegate>
@property Person *player;
@property PlayerView *showPlayer;
@property GamepadView *showGamepad;
@property UIImage *bgImage;
@property UIImage *heroImage;
@property UIImageView *backgroundImageView;
@end

@implementation PlayViewController

#pragma mark - delegate Methoden implentieren
-(void) didTouchUp:(UILongPressGestureRecognizer*)recognizer
{
    CGRect playField= _backgroundImageView.frame;
    if (playField.origin.y <0)
    {
        playField.origin.y +=10;
        _backgroundImageView.frame = playField;
    }

}

-(void) didTouchDown:(UILongPressGestureRecognizer*)recognizer
{
    CGRect playField= _backgroundImageView.frame;
    if (playField.origin.y > -playField.size.height +490)
    {
        playField.origin.y -=10;
        _backgroundImageView.frame = playField;
    }
}

-(void) didTouchRight:(UILongPressGestureRecognizer*)recognizer
{
    CGRect playField= _backgroundImageView.frame;
    if (playField.origin.x > -playField.size.width +330)
    {
        playField.origin.x -=10;
        _backgroundImageView.frame = playField;
        NSLog(@"right!");
    }
}

-(void) didTouchLeft:(UILongPressGestureRecognizer*)recognizer
{
    CGRect playField= _backgroundImageView.frame;
    if (playField.origin.x <0 )
    {
        playField.origin.x +=10;
        _backgroundImageView.frame = playField;
        NSLog(@"left");
    }
}

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        //Wenn init erfolgreich war, einen neuen Spieler erzeugen (Hier NSUSerDefaults laden bzw. Methode aufrufen)
        [self loadPlayerFromDefaults];
        [self loadBackGroundImage];
        [self loadPlayer];
        [self creatQuitButton];
        [self loadGamepad];
    }
    return self;
}
#pragma mark - Spielfeld aufbauen
-(void) loadBackGroundImage
{
    UIImage *bgImage = [UIImage imageNamed:@"map.png"];
    _backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0,0.0, bgImage.size.width, bgImage.size.height)];
    _backgroundImageView.image = bgImage;
    [self.view addSubview:_backgroundImageView];
}

-(void) loadGamepad
{
    _showGamepad = [GamepadView new];
    _showGamepad.delegate = self;
    CGRect frame = self.view.bounds;
    frame.size.height = 130;
    frame.origin.y = 350;
    _showGamepad.frame = frame;
    [self.view addSubview:_showGamepad];
}

-(void) loadPlayer
{
    _showPlayer = [PlayerView new];
    [self.view addSubview:_showPlayer];
}

//das funktioniert noch nicht
-(void) loadPlayerFromDefaults
{
    _player = [Person new];
    
#warning debug Code entfernen
    [_player updateNicknameWith:@"Frank Regel"];
    [_player updateScoreWith:1234];
    
    NSLog(@"Player erzeugt: %@", _player.nickName);
}
#pragma mark - Object handling
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - quitbutton
-(void) creatQuitButton
{
    UIButton *quitButton = [UIButton new];
    UIImage *quitButtonImage = [UIImage imageNamed:@"quit.png"];
    quitButton.frame = CGRectMake(270, 20, 32, 32);
    [quitButton setImage:quitButtonImage forState:UIControlStateNormal];
    [self.view addSubview:quitButton];
    //Quit Button listener/Event verpassen, der wartet ob der button getouched wird
    [quitButton addTarget:self action:@selector(quitApplicationCalled) forControlEvents:UIControlEventTouchUpInside];
}

-(void) quitApplicationCalled
{
    //UIApplication *app = [UIApplication sharedApplication];
    //[app performSelector:@selector(suspend)];
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"quit gedrückt");
    //exit app when app is in background
    //exit is nicht erlaubt im AppStore aber auch ein quit button wird nicht benötigt
    exit(0);
}
@end
