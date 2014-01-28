//
//  GamepadView.h
//  First Game
//
//  Created by Frank Regel on 16.01.14.
//  Copyright (c) 2014 Frank Regel. All rights reserved.
//

#import <UIKit/UIKit.h>
//Protokoll bekannt machen
@protocol GamepadViewDelegate;

@interface GamepadView : UIView
//Delegate Property bekannt machen, damit es von anderen Klassen verwendet werden kann
@property id<GamepadViewDelegate> delegate; //delegate ist hier nur ein Name. Ich kann das auch Hans nennen, muss es dann aber auch in der implementierenden Klase so aufrufen.
@end

//Protokoll die Methoden bekannt geben. Wenn diese Methoden in der Klasse nicht vorhanden sind, die GamepadViewDelegate verwendet, meckert der Compiler. Sie sind obligatorisch.
@protocol GamepadViewDelegate <NSObject>

-(void) didTouchUp:(UILongPressGestureRecognizer*)recognizer;
-(void) didTouchDown:(UILongPressGestureRecognizer*)recognizer;
-(void) didTouchRight:(UILongPressGestureRecognizer*)recognizer;
-(void) didTouchLeft:(UILongPressGestureRecognizer*)recognizer;
@end