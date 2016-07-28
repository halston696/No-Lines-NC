// No Lines NC © 2016 Wylliam Altman (@halston696)

static BOOL Switch1 = YES;

static void loadPrefs(){
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.halston696.nolinesnc.plist"];
    if(prefs) {
	Switch1 = ( [prefs objectForKey:@"AwesomeSwitch1"] ? [[prefs objectForKey:@"AwesomeSwitch1"] boolValue] : Switch1 );
    }
    [prefs release];
}

%group iOS7
%hook SBNotificationCenterSeparatorView
-(id)initWithFrame:(CGRect)frame mode:(int)mode{ 
    if(Switch1 == YES){ 
	return nil;
    }
    else {
	return %orig;
    }
}
%end
%end

%group iOS8_9
%hook SBNotificationSeparatorView
-(id)initWithFrame:(CGRect)frame mode:(int)mode{ 
    if(Switch1 == YES){
	return nil;
    }
    else{
	return %orig;
    }
}
%end
%end

%ctor{
    loadPrefs();
    if (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_8_0) {
	%init(iOS8_9);
    }
    else{
	%init(iOS7);
    }
}
