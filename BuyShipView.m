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

#import "BuyShipView.h"
#import "S1AppDelegate.h"
#import "Player.h"
#import "AlertModalWindow.h"
#import "ShipInfoViewController.h"


@implementation BuyShipView

-(void)UpdateView {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	[app.gamePlayer DetermineShipPrices];
	
	shipPrice1.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:0]];
	shipPrice2.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:1]];
	shipPrice3.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:2]];
	shipPrice4.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:3]];
	shipPrice5.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:4]];
	shipPrice6.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:5]];
	shipPrice7.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:6]];
	shipPrice8.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:7]];
	shipPrice9.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:8]];
	shipPrice10.text = [NSString stringWithFormat:@"%@", [app.gamePlayer getShipPriceStr:9]];
	
	cash.text = [NSString stringWithFormat:@"Cash : %i cr", app.gamePlayer.credits];

	[ship1 removeFromSuperview];
	[ship2 removeFromSuperview];
	[ship3 removeFromSuperview];
	[ship4 removeFromSuperview];
	[ship5 removeFromSuperview];
	[ship6 removeFromSuperview];
	[ship7 removeFromSuperview];
	[ship8 removeFromSuperview];	
	[ship9 removeFromSuperview];
	[ship10 removeFromSuperview];	
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:0] > 0 && [app.gamePlayer getCurrentShipType] != 0 && [app.gamePlayer getShipPriceInt:0] != 0) {
		[self addSubview:ship1];
	}

	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:1] > 0 && [app.gamePlayer getCurrentShipType] != 1 && [app.gamePlayer getShipPriceInt:1] != 0) {
		[self addSubview:ship2];
	}

	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:2] > 0 && [app.gamePlayer getCurrentShipType] != 2 && [app.gamePlayer getShipPriceInt:2] != 0) {
		[self addSubview:ship3];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:3] > 0 && [app.gamePlayer getCurrentShipType] != 3 && [app.gamePlayer getShipPriceInt:3] != 0) {
		[self addSubview:ship4];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:4] > 0 && [app.gamePlayer getCurrentShipType] != 4 && [app.gamePlayer getShipPriceInt:4] != 0) {
		[self addSubview:ship5];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:5] > 0 && [app.gamePlayer getCurrentShipType] != 5 && [app.gamePlayer getShipPriceInt:5] != 0) {
		[self addSubview:ship6];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:6] > 0 && [app.gamePlayer getCurrentShipType] != 6 && [app.gamePlayer getShipPriceInt:6] != 0) {
		[self addSubview:ship7];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:7] > 0 && [app.gamePlayer getCurrentShipType] != 7 && [app.gamePlayer getShipPriceInt:7] != 0) {
		[self addSubview:ship8];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:8] > 0 && [app.gamePlayer getCurrentShipType] != 8 && [app.gamePlayer getShipPriceInt:8] != 0) {
		[self addSubview:ship9];
	}
	
	if ((int)[app.gamePlayer toSpend] - [app.gamePlayer getShipPriceInt:9] > 0 && [app.gamePlayer getCurrentShipType] != 9 && [app.gamePlayer getShipPriceInt:9] != 0) {
		[self addSubview:ship10];
	}
}

- (void)didMoveToWindow {
	
	
	[super didMoveToWindow];
	[self UpdateView];
}

- (void)viewDidAppear:(BOOL)animated  {
	[self UpdateView];
}


-(void)ShowShipInfo:(int)ship
{
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	if (app.shipInfoController == 0) {
		app.shipInfoController = [[[ShipInfoViewController alloc] initWithNibName:@"shipInfo" bundle:nil] autorelease];
	}
	
	[app.shipInfoController setShip:ship];
	[app.navigationController pushViewController:app.shipInfoController animated:YES];	
}

-(void) buyShip:(int)index {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];	
	
	if ([app.gamePlayer canBuyShip:index]) {
	[app.gamePlayer buyShip:index];	
	}
	
}

-(IBAction) buyShip1 {

	[self buyShip:0];
	[self UpdateView];
}

-(IBAction) buyShip2 {

	[self  buyShip:1];
	[self UpdateView];
}

-(IBAction) buyShip3 {

	[self  buyShip:2];
	[self UpdateView];
	
}

-(IBAction) buyShip4 {

	[self  buyShip:3];
	[self UpdateView];
}

-(IBAction) buyShip5 {

	[self  buyShip:4];
	[self UpdateView];
}

-(IBAction) buyShip6 {

	[self  buyShip:5];
	[self UpdateView];
}

-(IBAction) buyShip7 {

	[self  buyShip:6];
	[self UpdateView];
	
}

-(IBAction) buyShip8 {

	[self  buyShip:7];
	[self UpdateView];
}

-(IBAction) buyShip9 {

	[self  buyShip:8];
	[self UpdateView];
}

-(IBAction) buyShip10 {

	[self  buyShip:9];
	[self UpdateView];
}

-(IBAction) infoShip1 {
	[self ShowShipInfo:0];
}

-(IBAction) infoShip2 {
	[self ShowShipInfo:1];	
}

-(IBAction) infoShip3 {
	[self ShowShipInfo:2];	
}

-(IBAction) infoShip4 {
	[self ShowShipInfo:3];	
}

-(IBAction) infoShip5 {
	[self ShowShipInfo:4];	
}

-(IBAction) infoShip6 {
	[self ShowShipInfo:5];	
}

-(IBAction) infoShip7 {
	[self ShowShipInfo:6];	
}

-(IBAction) infoShip8 {
	[self ShowShipInfo:7];	
}

-(IBAction) infoShip9 {
	[self ShowShipInfo:8];	
}

-(IBAction) infoShip10 {
	[self ShowShipInfo:9];	
}
@end
