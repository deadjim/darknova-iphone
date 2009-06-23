#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "RetireShipDestroyedView.h"
#import "poorEndGameView.h"
#import "HappyEndView.h"


@interface EndOfGameViewController : UIViewController/* Specify a superclass (eg: NSObject or NSView) */ {
	IBOutlet RetireShipDestroyedView * shipDestroyedView;
	IBOutlet HappyEndView* shipHappyEndView;
	IBOutlet poorEndGameView * shipPoorEndGameView;
	IBOutlet RetireShipDestroyedView * shipDestroyedWithPodView;	
}

-(void)showShipDestroyedImage;
-(void)showPoorEndGameImage;
-(void)showHappyEndImage;

-(IBAction) startNewGame;
@end
