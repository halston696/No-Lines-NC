// No Lines NC © 2016 Wylliam Altman (@halston696)

#import <Preferences/PSListController.h>

@interface NoLinesNCRootListController: PSListController

@end

@implementation NoLinesNCRootListController
- (id)specifiers {
    if(_specifiers == nil) {
    _specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
    }
    return _specifiers;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self HeaderCell];
}

// header code via @vxbakerxv
// this was my first project and
// i didn't really know what i was doing with the preferenceBundle header when
// i started programming for iOS lol
// thanks cody you were ALOT of help back then! :)
- (void)HeaderCell{
    @autoreleasepool {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(44, 0, 0, 60)];
	UIImage *bkIm = [[UIImage alloc] initWithContentsOfFile:[[NSBundle bundleWithPath:@"/Library/PreferenceBundles/NoLinesNC.bundle"] pathForResource:@"Header" ofType:@"png"]];
	UIImageView *_background = [[UIImageView alloc] initWithImage:bkIm];
	_background.frame = CGRectMake((0 / 2) - (bkIm.size.width / 2), (60 / 2) - (bkIm.size.height / 2), bkIm.size.width, bkIm.size.height);
	[_background setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
	[headerView addSubview:_background];
	
	int width = [[UIScreen mainScreen] bounds].size.width;
	
	CGRect frame = CGRectMake(0, 10, width, 60);
	CGRect subFrame = CGRectMake(0, 70, width,40);
	
	UILabel* heading = [[UILabel alloc] initWithFrame:frame];
	[heading setNumberOfLines:1];
	heading.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
	[heading setText:@"No Lines NC"];
	[heading setBackgroundColor:[UIColor clearColor]];
	heading.textColor = [UIColor whiteColor];
	heading.textAlignment = NSTextAlignmentCenter;
	
	UILabel* subtitle = [[UILabel alloc] initWithFrame:subFrame];
	[subtitle setNumberOfLines:1];
	subtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
	[subtitle setText:@"  "];
	   
	subtitle.textColor = [UIColor whiteColor];
	subtitle.textAlignment = NSTextAlignmentCenter;
	
	[heading.layer	setShadowColor:[UIColor blackColor].CGColor];
	[heading.layer	setShadowOpacity:0.5];
	[heading.layer	setShadowRadius:1.5];
	[heading.layer	setShadowOffset:CGSizeMake(0.0, 2.0)];
	
	[subtitle.layer  setShadowColor:[UIColor blackColor].CGColor];
	[subtitle.layer  setShadowOpacity:1.0];
	[subtitle.layer  setShadowRadius:1.5];
	[subtitle.layer  setShadowOffset:CGSizeMake(0.0, 2.0)];
	
	[self.table addSubview:heading];
	[self.table addSubview:subtitle];
	[self.table setTableHeaderView:headerView];
	[self.table sendSubviewToBack:headerView];
    }
}

- (void)respring:(id)sender {
    system("killall SpringBoard");
}

- (void)halstons696Twitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/halston696"]];
}
@end
