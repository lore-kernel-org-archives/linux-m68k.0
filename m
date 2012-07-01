From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/5] New Atari EtherNEC / EtherNAT network device support
Date: Sun, 1 Jul 2012 16:20:37 +1200 (NZST)
Message-ID: <alpine.DEB.2.00.1207011608550.12212@xplor.waratah>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57296 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEUn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:20:43 -0400
Received: by dady13 with SMTP id y13so6020715dad.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:20:42 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

Hi Geert,

this patch series has the cleaned up changes needed to introduce the new 
network device support for EtherNEC and EtherNAT devices used on Atari. 
Tested on Christian's and my Falcon and hopefully ready for submission to 
Linus now.

I have removed the controversial changes to ne.c (adding the IRQF_SHARED) 
flag to the driver interrupt in order to work with the current dedicated 
hires timer) because this will not be necessary in the long term. Instead, 
I will add a dedicated 'interrupt chip' for the hires timer interrupt so 
each user of the hires timer will appear as a dedicated interrupt to the 
system.

In the meantime, additional code to make ne.c cope with shared interrupts 
will be necessary to actually use this driver (I can provide such a patch 
if this is preferred).

Feedback welcome as always!

Cheers,

 	Michael
