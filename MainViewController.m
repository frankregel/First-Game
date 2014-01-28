//
//  MainViewController.m
//  First Game
//
//  Created by Frank Regel on 10.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "MainViewController.h"
#import "PlayViewController.h"
#import "PlayerView.h"


@interface MainViewController ()
@property PlayViewController *playerViewController;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //testcode!

	// Do any additional setup after loading the view.
    [self createWelcomeLabel]; //Methode auf sich selbst aufrufen
    [self createStartButton];
    
}

-(void) createWelcomeLabel
{
    UILabel *welcomeLabel = [UILabel new];
    welcomeLabel.text = @"Welcome to PARALAX!";
    //Dem Label eine Frame Größe zuweisen in der der Text erscheint
    welcomeLabel.frame = CGRectMake(0, 100, self.view.frame.size.width, 40);
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    //UILabel ist vom Typ UIView abgeleitet und kann daher als subview eingesetzt werden
    [self.view addSubview:welcomeLabel];
}

-(void) createStartButton
{
    UIButton *startButton = [UIButton new];
    [startButton setTitle:@"Dare it!" forState:UIControlStateNormal];
    startButton.frame = CGRectMake(100, 300, 120, 40);
    //buttons sind standard zentriert , von UIControl<UIView abgeleitet
    [self.view addSubview:startButton];
    //Start Button eine Art listener/Event verpassen, der wartet ob der button getouched wurde
    [startButton addTarget:self action:@selector(startButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void) startButtonTouched
{
    //Spielfeld alloc und init
    _playerViewController = [PlayViewController new];
    //subview aufrufen, mainView bleibt im Speicher und kann später wieder verwendet werden
    [self.view addSubview:_playerViewController.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
