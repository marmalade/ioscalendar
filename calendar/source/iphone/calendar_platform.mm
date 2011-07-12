/*
 * iphone-specific implementation of the calendar extension.
 * Add any platform-specific functionality here.
 */
/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */
#include "calendar_internal.h"
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>
s3eResult calendarInit_platform()
{
    // Add any platform-specific initialisation code here
    return S3E_RESULT_SUCCESS;
}

void calendarTerminate_platform()
{
    // Add any platform-specific termination code here
}

void createEvent_platform(const char * title, const char * startDate, const char * endDate, const char * notes, const char * location, int alarmMinutes)
{
	EKEventStore *eventDB = [[EKEventStore alloc] init];
	
    EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB];
	
	NSString *nsTitle = [NSString stringWithCString:title length:strlen(title)];  
	NSString *nsNotes = [NSString stringWithCString:notes length:strlen(notes)];  
	NSString *nsStart = [NSString stringWithCString:startDate length:strlen(startDate)];  
	NSString *nsStop = [NSString stringWithCString:endDate length:strlen(endDate)];  
	NSString *nsLocation = [NSString stringWithCString:location length:strlen(location)];  
	
	
	
	myEvent.title     = nsTitle;
    myEvent.notes = nsNotes;
	myEvent.location = nsLocation;
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
	
	NSDate* dStart =   [dateFormatter dateFromString:(nsStart)];
	NSDate* dEnd =  [dateFormatter dateFromString:(nsStop)];
	
	myEvent.startDate = dStart;
	myEvent.endDate = dEnd;
	
	if (alarmMinutes > 0)
	{
		NSMutableArray *myAlarmsArray = [[NSMutableArray alloc] init];
		EKAlarm *alarm = [EKAlarm alarmWithRelativeOffset:-alarmMinutes * 60]; 
		[myAlarmsArray addObject:alarm];
		myEvent.alarms = myAlarmsArray;
		[myAlarmsArray release];
	}
	
	
    [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]];
	
    NSError *err;
	
    [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err]; 
	
	[err release];
}