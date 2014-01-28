//
//  GamepadView.m
//  First Game
//
//  Created by Frank Regel on 16.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import "GamepadView.h"
@interface GamepadView()
@property UIButton *downButton;
@end

@implementation GamepadView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self loadSteuerkreuz];
        [self loadUpButton];
        [self loadDownButton];
        [self loadRightButton];
        [self loadLeftButton];
    }
    return self;
}
#pragma mark - Grafiken laden
-(void) loadSteuerkreuz
{
    UIImage *steuerKreuz = [UIImage imageNamed:@"steuerkreuz.png"];
    UIImageView *steuerKreuzBackGround = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, steuerKreuz.size.width, steuerKreuz.size.height)];
    steuerKreuzBackGround.image = steuerKreuz;
    [self addSubview:steuerKreuzBackGround];
}

#pragma mark - button laden
-(void) loadUpButton
{
    UIView *upButton = [[UIView alloc]initWithFrame:CGRectMake(41, 0, 42, 42)];
    [self addSubview:upButton];
    UILongPressGestureRecognizer *moveUp = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(upButtonTouched:)];
    [upButton addGestureRecognizer:moveUp];
}


-(void) loadDownButton
{
    UIView *downButton = [[UIView alloc]initWithFrame:CGRectMake(41, 88, 42, 42)];
    [self addSubview:downButton];
    UILongPressGestureRecognizer *moveDown = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(downButtonTouched:)];
    [downButton addGestureRecognizer:moveDown];
}

-(void) loadRightButton
{
    
    UIView *rightButton = [[UIView alloc]initWithFrame:CGRectMake(84, 43, 42, 42)];
    [self addSubview:rightButton];
    UILongPressGestureRecognizer *moveRight = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(rightButtonTouched:)];
    [rightButton addGestureRecognizer:moveRight];
    
}

-(void) loadLeftButton
{
    UIView *leftButton = [[UIView alloc]initWithFrame:CGRectMake(0, 43, 42, 42)];
    [self addSubview:leftButton];
    UILongPressGestureRecognizer *moveLeft = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(leftButtonTouched:)];
    [leftButton addGestureRecognizer:moveLeft];
}

#pragma mark - delegate Methoden Anfang
//Diese Methoden können von anderen Klassen die das delegate verwenden Nachrichten empfangen. Bedeutet: Was in der anderen Klasse in der Methode didTouchUp implementiert wurde, kann unterschiedlich sein. Diese Methode achtet nur drauf ob UILongGestureRecognizer ausgelöst wurde. In einer Klasse kann das ein Hüpfen zur Folge haben , in einer anderen eine Bewegung nach oben. Ich muss also nicht immer ein neues Objekt erzeugen und spezialisieren, sondern kann diese Methoden verwenden. Das erspart mir, jedes mal ein neues Gamepad verwenden zu müssen wenn ich die Spielart ändere. Damit das funktioniert, werden diese Methoden in der header Datei bekannt gegeben. Siehe Doku dort.

-(void) upButtonTouched:(UILongPressGestureRecognizer*)recognizer
{
    if (_delegate) //hier könnte nun also auch Hans stehen, statt delegate, siehe Header Datei
    {
        [_delegate didTouchUp:recognizer];
    }
    NSLog(@"up Touched!");
}

-(void) downButtonTouched:(UILongPressGestureRecognizer*)recognizer
{
    if (_delegate)
    {
        [_delegate didTouchDown:recognizer];
    }
    NSLog(@"down Touched!");
}

-(void) rightButtonTouched:(UILongPressGestureRecognizer*)recognizer
{
    if (_delegate)
    {
        [_delegate didTouchRight:recognizer];
    }
    NSLog(@"right Touched!");
}

-(void) leftButtonTouched:(UILongPressGestureRecognizer*)recognizer
{
    if (_delegate)
    {
        [_delegate didTouchLeft:recognizer];
    }
    NSLog(@"left Touched!");
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
