#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "buyCargoViewController.h"
#import "commanderStatusViewController.h"
#import "bankViewController.h"
#import "sellCargoViewController.h"
#import "shipYardViewController.h"
#import "sellEquipmentViewController.h"
#import "buyEquipmentViewController.h"
#import "SystemInfoViewController.h"
#import "personellRosterViewController.h"
#import "shortRangeChartViewController.h"
#import "galacticChartViewController.h"

@interface commandViewController : UIViewController /* Specify a superclass (eg: NSObject or NSView) */ {

	buyCargoViewController * buyCargoViewControllerImpl;
	sellCargoViewController * sellCargoViewControllerImpl;
	shipYardViewController * shipYardViewControllerImpl;
	buyEquipmentViewController * buyEquipmentViewControllerImpl;
	sellEquipmentViewController * sellEquipmentViewControllerImpl;
	personellRosterViewController * personellRosterViewControllerImpl;
	bankViewController * bankViewControllerImpl;
	SystemInfoViewController * SystemInfoViewControllerImpl;
	commanderStatusViewController * commanderStatusViewControllerImpl;
	galacticChartViewController * galacticChartViewControllerImpl;
	shortRangeChartViewController * shortRangeChartViewControllerImpl;
}

-(IBAction) buyCargo;
-(IBAction) sellCargo;
-(IBAction) shipYard;
-(IBAction) buyEquipment;
-(IBAction) sellEquipment;
-(IBAction) personellRoster;
-(IBAction) bank;
-(IBAction) systemInformation;
-(IBAction) commanderStatus;
-(IBAction) galacticChart;
-(IBAction) shortRangeChart;
//-(id)init;
@end