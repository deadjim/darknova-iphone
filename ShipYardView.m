/*
    Dark Nova © Copyright 2009 Dead Jim Studios
    This file is part of Dark Nova.

    Dark Nova is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dark Nova is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dark Nova.  If not, see <http://www.gnu.org/licenses/>
*/

#import "ShipYardView.h"
#import "S1AppDelegate.h"
#import "Player.h"
#import "AlertModalWindow.h"
#import "BuyShipViewController.h"


@implementation ShipYardView

//@synthesize 	fuelAmount,	fuelCost, hullStrength,	needRepairs, newShipsInfo, escapePod, buyFuel, buyFullTank,
//buyRepair, buyFullRepair, buyEscapePod, totalCash;



-(void) UpdateView {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	totalCash.text = [NSString stringWithFormat:@"Cash: %i cr.", app.gamePlayer.credits];	
	
	if ([app.gamePlayer getFuel] < [app.gamePlayer GetFuelTanks]) {
		[self addSubview:buyFuel];
		[self addSubview:buyFullTank];
	} else {
		[buyFuel removeFromSuperview];
		[buyFullTank removeFromSuperview];
	}
	
	if ( [app.gamePlayer getShipHull] <  [app.gamePlayer GetHullStrength])  {
		[self addSubview:buyRepair];
		[self addSubview:buyFullRepair];
	} else {
		[buyRepair removeFromSuperview];
		[buyFullRepair removeFromSuperview];
	}
	
	if ([app.gamePlayer getCurrentSystemTechLevelInt] >= [app.gamePlayer getCurrentShipTechLevel])/* && (
		[app.gamePlayer getShipPriceInt:0] != 0 || [app.gamePlayer getShipPriceInt:1] != 0 ||
		[app.gamePlayer getShipPriceInt:2] != 0 || [app.gamePlayer getShipPriceInt:3] != 0 ||
		[app.gamePlayer getShipPriceInt:4] != 0 || [app.gamePlayer getShipPriceInt:5] != 0 ||
		[app.gamePlayer getShipPriceInt:6] != 0 || [app.gamePlayer getShipPriceInt:7] != 0 ||
		[app.gamePlayer getShipPriceInt:8] != 0 || [app.gamePlayer getShipPriceInt:9] != 0 ))*/ {
		
		[self addSubview:buyNewShip];
		[shipInfo removeFromSuperview];
	} else {
		[buyNewShip removeFromSuperview];
		[shipInfo removeFromSuperview];
	}
	
	if ([app.gamePlayer getCurrentSystemTechLevelInt] < [app.gamePlayer getCurrentShipTechLevel] || [app.gamePlayer toSpend] < 2000 || [app.gamePlayer escapePod]) {
		[buyEscapePod removeFromSuperview];
		
	} else {
		[self addSubview:buyEscapePod];
	}
	
	fuelAmount.text = [NSString stringWithFormat:@"You have fuel to fly %i parsec%@", [app.gamePlayer getFuel],[app.gamePlayer getFuel] > 1 ? @"." : @"s." ];	
	if ([app.gamePlayer getFuel] < [app.gamePlayer GetFuelTanks]) {
		int cost = ([app.gamePlayer GetFuelTanks] - [app.gamePlayer getFuel]) * [app.gamePlayer getFuelCost];
		fuelCost.text = [NSString stringWithFormat:@"A full tank costs %i cr.", cost];	
	}
	else {
		
		fuelCost.text = @"Your tank cannot hold more fuel.";
	}
	
	hullStrength.text = [NSString stringWithFormat:@"Your hull strength is at %i %%.", [app.gamePlayer getShipHull] * 100/  [app.gamePlayer GetHullStrength]];	
	if ([app.gamePlayer getShipHull] <  [app.gamePlayer GetHullStrength]) {
		int cost = (-[app.gamePlayer getShipHull] +  [app.gamePlayer GetHullStrength]) * [app.gamePlayer getRepairCost];
		needRepairs.text = [NSString stringWithFormat:@"Full repair will cost %i cr.", cost];	
	}
	else {
		
		needRepairs.text = @"No repairs are needed.";
	}	
	
	if ([app.gamePlayer getCurrentSystemTechLevelInt] >= [app.gamePlayer getCurrentShipTechLevel]) {
		newShipsInfo.text =@"There are new ships for sale.";
	}
	else {
		newShipsInfo.text =@"No new ships for sale.";		
	}
	
	if ([app.gamePlayer escapePod]) 
		escapePod.text = @"You have an escape pod installed.";
		else 
			if ([app.gamePlayer getCurrentSystemTechLevelInt] < [app.gamePlayer getCurrentShipTechLevel])
				escapePod.text =@"No escape pods for sale.";
			else if ([app.gamePlayer toSpend] < 2000) 
				escapePod.text = @"You need 2000 c. for an escape pod.";
			else
				escapePod.text = @"You can buy an escape pod for 2000 cr.";
	
}

- (void)viewDidAppear:(BOOL)animated  {
	[self UpdateView];
}

- (void)didMoveToWindow {
	
	
	[super didMoveToWindow];
	[self UpdateView];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex  // after animation
{
	int button = buttonIndex;
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];	
	
	if (button == 1) {
		// Ok
		
		NSString * value = [[(AlertModalWindow*)alertView myTextField] text];
		unsigned int val = value.intValue;
		if (mode == 1)
			[app.gamePlayer BuyFuel:val];
		else 
			[app.gamePlayer buyRepairs:val];
		//[app.gamePlayer buyCargo:activeTradeItem Amount:buyCargoViewValue[val]];
		[self UpdateView];	
	} else if (button == 2) {
		if (mode == 1)
			[app.gamePlayer BuyFuel:999];
		else 
			[app.gamePlayer buyRepairs:999];
		//[self pressedCargoMax:activeTradeItem];
	}
		[self UpdateView];
}

-(IBAction) buyFuel {
	mode = 1;
	NSString * message = [NSString stringWithFormat:@"How much do you want to spend on fuel?"];	
	AlertModalWindow * myAlertView = [[[AlertModalWindow alloc] initWithTitle:@"Buy Fuel" yoffset:90 message:message  
																	delegate:self cancelButtonTitle:@"Cancel" okButtonTitle:@"Ok"  thirdButtonTitle:@"All"] autorelease];
	
	[myAlertView show];
}

-(IBAction) buyFullFuel {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];	
	[app.gamePlayer BuyFuel:999];
	[self UpdateView];
}

-(IBAction) buyRepair {
	mode = 2;
	NSString * message = [NSString stringWithFormat:@"How much do you want to spend on repairs?"];	
	AlertModalWindow * myAlertView = [[[AlertModalWindow alloc] initWithTitle:@"Repairs" yoffset:90 message:message  
																	delegate:self cancelButtonTitle:@"Cancel" okButtonTitle:@"Ok"  thirdButtonTitle:@"All"] autorelease];
	
	[myAlertView show];
}

-(IBAction) buyFullRepair {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];	
	[app.gamePlayer buyRepairs:999];	
	[self UpdateView];
}

-(IBAction) buyNewShip {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	if (app.buyShipController == 0)
	app.buyShipController = [[[BuyShipViewController alloc] initWithNibName:@"buyShip" bundle:nil] autorelease];

	[app.navigationController pushViewController:app.buyShipController animated:YES];
}

-(IBAction) buyEscapePod {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];	
	app.gamePlayer.escapePod = true;	
	app.gamePlayer.credits -= 2000;
	[self UpdateView];
}

-(IBAction) shipInfo {
	
}
/*
 AlertModalWindow * myAlertView = [[AlertModalWindow alloc] initWithTitle:@"Buy Items" yoffset:90 message:message  
 delegate:self cancelButtonTitle:@"Cancel" okButtonTitle:@"Ok"  thirdButtonTitle:@"All"];*/
@end
