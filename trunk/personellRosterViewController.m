#import "personellRosterViewController.h"
#import "S1AppDelegate.h"
#import "Player.h"

@implementation personellRosterViewController

@synthesize fire0, fire1, fire2, Price0, Price1, Price2, Trader0, Trader1, Trader2, Fighter0, Fighter1, Fighter2, 
Engineer0, Engineer1, Engineer2, Pilot0, Pilot1, Pilot2, Vacancy0, Vacancy1, Vacancy2, PilotName0, PilotName1, PilotName2;
- (void)awakeFromNib
{
	self.title = @"Personell Roster";	
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		self.title = @"Personnel Roster";		
	}
	return self;
}

-(void) UpdateView {
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	cash.text = [NSString stringWithFormat:@"Cash: %i cr.", app.gamePlayer.credits];	
	[fire0 removeFromSuperview];
	[fire1 removeFromSuperview];
	[fire2 removeFromSuperview];
	[Price0 removeFromSuperview];
	[Price1 removeFromSuperview];
	[Price2 removeFromSuperview];
	[Trader0 removeFromSuperview];
	[Trader1 removeFromSuperview];
	[Trader2 removeFromSuperview];
	[Fighter0 removeFromSuperview];
	[Fighter1 removeFromSuperview];
	[Fighter2 removeFromSuperview];
	[Engineer0 removeFromSuperview];
	[Engineer1 removeFromSuperview];
	[Engineer2 removeFromSuperview];
	[Pilot0 removeFromSuperview];
	[Pilot1 removeFromSuperview];
	[Pilot2 removeFromSuperview];
	[Vacancy0 removeFromSuperview];
	[Vacancy1 removeFromSuperview];
	[Vacancy2 removeFromSuperview];
	[PilotName0 removeFromSuperview];
	[PilotName1 removeFromSuperview];
	[PilotName2 removeFromSuperview];
	[app.gamePlayer updateRosterWindow:self];
}

- (void)loadView
{
	[super loadView];
	[self UpdateView];
}

- (void)viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];
	[self UpdateView];
}

-(IBAction) pressFire0
{
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	[app.gamePlayer fireMercenary:1];
	[self UpdateView];
	
}

-(IBAction) pressFire1
{
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	[app.gamePlayer fireMercenary:2];
	[self UpdateView];
	
}

-(IBAction) pressFire2
{
	S1AppDelegate * app = (S1AppDelegate *)[[UIApplication sharedApplication] delegate];
	[app.gamePlayer hireMercenaryFromRoster];
	[self UpdateView];
}


@end
