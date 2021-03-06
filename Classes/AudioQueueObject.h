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

/*
File: AudioQueueObject.h
Abstract: The superclass for the recording and playback classes.

Version: 1.0

Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple Inc.
("Apple") in consideration of your agreement to the following terms, and your
use, installation, modification or redistribution of this Apple software
constitutes acceptance of these terms.  If you do not agree with these terms,
please do not use, install, modify or redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and subject
to these terms, Apple grants you a personal, non-exclusive license, under
Apple's copyrights in this original Apple software (the "Apple Software"), to
use, reproduce, modify and redistribute the Apple Software, with or without
modifications, in source and/or binary forms; provided that if you redistribute
the Apple Software in its entirety and without modifications, you must retain
this notice and the following text and disclaimers in all such redistributions
of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may be used
to endorse or promote products derived from the Apple Software without specific
prior written permission from Apple.  Except as expressly stated in this notice,
no other rights or licenses, express or implied, are granted by Apple herein,
including but not limited to any patent rights that may be infringed by your
derivative works or by other works in which the Apple Software may be
incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF
CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright (C) 2008 Apple Inc. All Rights Reserved.

*/


#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

#define kNumberAudioDataBuffers	3

@interface AudioQueueObject : NSObject {

	AudioQueueRef					queueObject;					// the audio queue object being used for playback
	AudioFileID						audioFileID;					// the identifier for the audio file to play
	CFURLRef						audioFileURL;
	AudioStreamBasicDescription		audioFormat;
	AudioQueueLevelMeterState		*audioLevels;
	SInt64							startingPacketNumber;			// the current packet number in the playback file
	id								notificationDelegate;
}

@property (readwrite)			AudioQueueRef				queueObject;
@property (readwrite)			AudioFileID					audioFileID;
@property (readwrite)			CFURLRef					audioFileURL;
@property (readwrite)			AudioStreamBasicDescription	audioFormat;
@property (readwrite)			AudioQueueLevelMeterState	*audioLevels;
@property (readwrite)			SInt64						startingPacketNumber;
@property (nonatomic, retain)	id							notificationDelegate;


- (void) incrementStartingPacketNumberBy:  (UInt32) inNumPackets;
- (void) setNotificationDelegate: (id) inDelegate;
- (void) enableLevelMetering;
- (void) getAudioLevels: (Float32 *) levels peakLevels: (Float32 *) peakLevels;
- (BOOL) isRunning;

@end