/*
Internal header for the calendar extension.

This file should be used for any common function definitions etc that need to
be shared between the platform-dependent and platform-indepdendent parts of
this extension.
*/

/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */


#ifndef CALENDAR_H_INTERNAL
#define CALENDAR_H_INTERNAL

#include "s3eTypes.h"
#include "calendar.h"
#include "calendar_autodefs.h"


/**
 * Initialise the extension.  This is called once then the extension is first
 * accessed by s3eregister.  If this function returns S3E_RESULT_ERROR the
 * extension will be reported as not-existing on the device.
 */
s3eResult calendarInit();

/**
 * Platform-specific initialisation, implemented on each platform
 */
s3eResult calendarInit_platform();

/**
 * Terminate the extension.  This is called once on shutdown, but only if the
 * extension was loader and Init() was successful.
 */
void calendarTerminate();

/**
 * Platform-specific termination, implemented on each platform
 */
void calendarTerminate_platform();
void createEvent_platform(const char * title, const char * startDate, const char * endDate, const char * notes, const char * location, int alarmMinutes);


#endif /* CALENDAR_H_INTERNAL */