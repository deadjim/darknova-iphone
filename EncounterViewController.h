#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface EncounterViewController : UIViewController {
	IBOutlet UIButton    *close;
	IBOutlet UIButton    *attackButton;
	IBOutlet UIButton    *surrenderButton;
	IBOutlet UIButton    *ignoreButton;	
	IBOutlet UIButton    *fleeButton;
	IBOutlet UIButton    *submitButton;
	IBOutlet UIButton    *bribeButton;
	IBOutlet UIButton    *plunderButton;
	IBOutlet UIButton    *interruptButton;
	IBOutlet UIButton    *drinkButton;	
	IBOutlet UIButton    *boardButton;
	IBOutlet UIButton    *meetButton;
	IBOutlet UIButton    *yieldButton;
	IBOutlet UIButton    *tradeButton;
	IBOutlet UIImageView *attackImage;	
	IBOutlet UIImageView *attackImage2;
	IBOutlet UIImageView *encounterTypeImage;	
	IBOutlet UILabel     *message1Label;
	IBOutlet UILabel     *message1Labe2;
}

-(IBAction) close;

-(IBAction) attack;
-(IBAction) flee;
-(IBAction) ignore;
-(IBAction) trade;
-(IBAction) yield;
-(IBAction) surrender;
-(IBAction) bribe; 
-(IBAction) submit; 
-(IBAction) plunder; 
-(IBAction) interrupt; 
-(IBAction) meet; 
-(IBAction) board; 
-(IBAction) drink;

-(void) SetLabelText:(NSString*)text;
-(void) SetLabel2Text:(NSString*)text;
-(void) showEncounterWindow;

@end 