/*
Generic implementation of the calendar extension.
This file should perform any platform-indepedentent functionality
(e.g. error checking) before calling platform-dependent implementations.
*/

/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */


#include "calendar_internal.h"
s3eResult calendarInit()
{
    //Add any generic initialisation code here
    return calendarInit_platform();
}

void calendarTerminate()
{
    //Add any generic termination code here
    calendarTerminate_platform();
}

void createEvent(const char * title, const char * startDate, const char * endDate, const char * notes, const char * location, int alarmMinutes)
{
	createEvent_platform(title, startDate, endDate, notes, location, alarmMinutes);
}
