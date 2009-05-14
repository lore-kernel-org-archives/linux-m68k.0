From: Riccardo <riccardo@kaffe.org>
Subject: X11 problems
Date: Thu, 14 May 2009 10:26:57 +0200
Message-ID: <FCFD5D59-4060-11DE-A812-00050249ADE1@kaffe.org>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out8.libero.it ([212.52.84.108]:56737 "EHLO
	cp-out8.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbZENI1C (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 May 2009 04:27:02 -0400
Received: from kaffe.org (151.57.116.179) by cp-out8.libero.it (8.5.107)
        id 4A095130004BFEE1 for linux-m68k@vger.kernel.org; Thu, 14 May 2009 10:27:01 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I have two problems with X11 on my Q950. The first is that the X server  
doesn't start up:

here a snippet from my X11 log:
<...>
(II) Loading /usr/lib/xorg/modules//libshadow.so
(II) Module shadow: vendor="X.Org Foundation"
         compiled for 1.4.2, module version = 1.1.0
         ABI class: X.Org ANSI C Emulation, version 0.3
(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
(EE) FBDEV(0): mode initialization failed

Fatal server error:
AddScreen/ScreenInit failed for driver 0

Then furthermore, I compiled all my precious GNUstep stuff (make, base,  
back and two test apps). I export the display and then I get the  
following error:

/usr/GNUstep/Local/Applications/Terminal.app/Terminal: symbol lookup  
error:  
/usr/GNUstep/Local/Library/Bundles/libgnustep-back-017.bundle/./ 
libgnustep-back-017: undefined symbol: XShmQueryVersion

Do we miss this symbol? I recompiled gnustep-back again and got no  
errors... Ideas?

Riccardo

