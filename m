From: fthain@telegraphics.com.au
Subject: initcall question
Date: Fri, 23 Oct 2009 00:56:50 +1100 (EST)
Message-ID: <alpine.LNX.2.00.0910222357390.22095@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:47295 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbZJVOEO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Oct 2009 10:04:14 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@vger.kernel.org>


Hi All,

I've been porting the powermac zilog driver to 68k macs. It works, but I 
can't figure out how to get the device initialisation right.

I've used platform devices for the serial ports. The serial controller 
base address is passed in by the bootloader.

If the platform devices are statically defined, they get no release method 
which can result in the driver core carping, "Device 'scc.0' does not have 
a release() function, it is broken and must be fixed", and then dumping a 
backtrace.

The alternative to statically defined devices is platform_device_alloc(), 
which does provide a release method, but I can't call it at arch_initcall 
time because the console_initcall has already happened. And I can't use it 
at setup_arch() time (when the boot info is parsed) because there's no 
kmalloc() yet.

What to do? I don't want to export the bootinfo data to the pmac_zilog 
driver for console initialisation. And I'd really like to avoid a bunch of 
hard coded SCC base addresses.

Any suggestions?

Perhaps there is some other kind of initcall that runs after memory 
management becomes available but before console initialisation?

Finn
