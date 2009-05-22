From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: Cirrusfb driver debug (Zorro)
Date: Fri, 22 May 2009 12:08:40 -0500
Message-ID: <20090522170837.GA4743@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:57241 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683AbZEVRC6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 May 2009 13:02:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.hbci.com (Postfix) with ESMTP id CADCDA17B61
	for <linux-m68k@vger.kernel.org>; Fri, 22 May 2009 12:02:59 -0500 (CDT)
Received: from mail.hbci.com (ultra.hbci.com [206.230.105.5])
	by spamtitan.hbci.com (Postfix) with ESMTP id A0D2EA16F53
	for <linux-m68k@vger.kernel.org>; Fri, 22 May 2009 12:02:57 -0500 (CDT)
Received: from tag1amiga.luminet.net (unknown [64.213.220.3])
	by mail.hbci.com (Postfix) with ESMTP id 91B78278137
	for <linux-m68k@vger.kernel.org>; Fri, 22 May 2009 12:02:58 -0500 (CDT)
Received: from lancetag by tag1amiga.luminet.net with local (Exim 3.36 #1 (Debian))
	id 1M7YEc-0001TN-00
	for <linux-m68k@vger.kernel.org>; Fri, 22 May 2009 12:08:42 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hello,

I have started working on getting the cirrusfb driver working for
kernel 2.6 on m68k.  I have an EGS Spectrum card in my Amiga to
work with.  This is my first attempt at debugging a Linux kernel
driver (newbie driver debug questions warning).  :)

Observed Problems:
a) When booting and targeting the kernel to video=clgen, there
is garbage on the screen, like the horizontal sync is all wrong.
b) Setting up the cirrusfb driver as a module and loading via the
comamnd "modprobe cirrusfb" loads the module (according to syslog)
and results in a blank screen.
c) Loading with "modprobe cirrusfb mode:640x480" gives an error,
as shown in the /var/log/syslog snippet below.
d) The driver default string includes an "@60" which is not a 
documented parameter.  Was this a change in 2.6 FB device API?

Debugging steps:
a) re-compiled cirrusfb.c adding a line to cirrusfb.h to turn on 
all the DPRINTK debugging.
b) added additional debugging DPRINTK statements to the entry and
exit of each function. 
c) Changed the DPRINTK macro to be KERN_INFO instead of KERN_DEBUG
so that data shows up in /var/log/syslog. (didn't figure out to
change  the logging level to 8 without a reboot).
d) Error exits also had DPRINTK lines added.


Captured syslog output, annotation in [] by me.

May 22 07:40:22 tag1amiga kernel: cirrusfb: Unknown parameter `800x600' [modprobe cirrusfb 800x600]
May 22 07:40:34 tag1amiga kernel: cirrusfb: Unknown parameter `mode:640x480' [modprob cirrusfb mode:640x480]
May 22 07:40:47 tag1amiga kernel: cirrusfb_init: ENTER: [modprobe cirrusfb]
May 22 07:40:47 tag1amiga kernel: bus: 'zorro': add driver cirrusfb
May 22 07:40:47 tag1amiga kernel: bus: 'zorro': driver_probe_device: matched device 05 with driver cirrusfb
May 22 07:40:47 tag1amiga kernel: bus: 'zorro': really_probe: probing driver cirrusfb with device 05
May 22 07:40:47 tag1amiga kernel: cirrusfb_zorro_register: ENTER:
May 22 07:40:47 tag1amiga kernel: cirrusfb: CL Spectrum board detected; <6> RAM (2 MB) at $800000, <6> REG at $ec0000
May 22 07:40:47 tag1amiga kernel: cirrusfb_zorro_register: Virtual address for board set to: $80ec0000
May 22 07:40:47 tag1amiga kernel: cirrusfb: Cirrus Logic chipset on Zorro bus
May 22 07:40:47 tag1amiga kernel: cirrusfb_register: ENTER:
May 22 07:40:47 tag1amiga kernel: cirrusfb: Driver for Cirrus Logic based graphic boards, v2.0-pre2
May 22 07:40:47 tag1amiga kernel: cirrusfb_set_fbinfo: ENTER:
May 22 07:40:47 tag1amiga kernel: cirrusfb_set_fbinfo: EXIT :
May 22 07:40:47 tag1amiga kernel: cirrusfb_register: (RAM start set to: 0x80800000)
May 22 07:40:47 tag1amiga kernel: cirrusfb_register: driver init paramter: 640x480@60 [driver default init string]
May 22 07:40:47 tag1amiga kernel: cirrusfb: ENTER: cirrusfb_check_var()
May 22 07:40:47 tag1amiga kernel: cirrusfb: EXIT : cirrusfb_check_var()
May 22 07:40:47 tag1amiga kernel: cirrusfb_decode_var: desired pixclock: 25175 kHz
May 22 07:40:47 tag1amiga kernel: device: 'fb1': device_add
May 22 07:40:47 tag1amiga kernel: cirrusfb_register: EXIT :
May 22 07:40:47 tag1amiga kernel: cirrusfb_zorro_register: EXIT :
May 22 07:40:47 tag1amiga kernel: driver: '05': driver_bound: bound to device 'cirrusfb'
May 22 07:40:47 tag1amiga kernel: bus: 'zorro': really_probe: bound device 05 to driver cirrusfb
May 22 07:40:47 tag1amiga kernel: cirrusfb_init: EXIT :
May 22 07:40:59 tag1amiga kernel: bus: 'zorro': remove driver cirrusfb
May 22 07:40:59 tag1amiga kernel: cirrusfb_zorro_unregister: cirrusfb: ENTER: cirrusfb_zorro_unregister()
May 22 07:40:59 tag1amiga kernel: cirrusfb_cleanup: ENTER:
May 22 07:40:59 tag1amiga kernel: switch_monitor: ENTER
May 22 07:40:59 tag1amiga kernel: switch_monitor: EXIT
[modprobe -r cirrusfb]
May 22 07:40:59 tag1amiga kernel: device: 'fb1': device_unregister
May 22 07:40:59 tag1amiga kernel: device: 'fb1': device_create_release
May 22 07:40:59 tag1amiga kernel: Framebuffer unregistered
May 22 07:40:59 tag1amiga kernel: cirrusfb_zorro_unmap: cirrusfb: ENTER: cirrusfb_zorro_unmap()<6>cirrusfb_zorro_unmap: cirrusfb: EXIT : cirrusfb_zorro_unmap()<6>cirrusfb_cleanup: EXIT :
May 22 07:40:59 tag1amiga kernel: cirrusfb_zorro_unregister: cirrusfb: EXIT : cirrusfb_zorro_unregister()
May 22 07:40:59 tag1amiga kernel: driver: 'cirrusfb': driver_release

The Spectrum card switches the monitor to its output, but the display is blank.
Is there a simple way to write to /dev/fb1 to get some text on that display?
echo some text there >/dev/fb1 
resuled in locking up the system requiring reset.  Or, a command to switch the 
monitor back to the amifb: video?

My next step is to re-compile my kernel with the driver resident, and see what the 
dmesg output will look like, but I am assuming something similar will result.

The parameters do not seem to be processed by the cirrusfb, though, seem to 
be done by generic framebuffer code elsewhere.

Suggestions?

--Lance
