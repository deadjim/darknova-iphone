#import "ShipInfoViewController.h"
#import "ShipInfoViewRENAME.h"

@implementation ShipInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		self.title = @"Ship Information";				
	}


	return self;
}

-(void) setShip:(int)index {
	ShipInfoViewRENAME* view1 = (ShipInfoViewRENAME*)[self view];//(shipInfoView*)[UIViewController view] delegate];
	view1.ship = index;
}
@end