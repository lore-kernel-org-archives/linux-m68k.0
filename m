From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
 address
Date: Fri, 08 Jan 2010 02:15:00 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001072029380.15106@zirkon.biophys.uni-duesseldorf.de>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
 <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:38538 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754556Ab0AHBPD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Jan 2010 20:15:03 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KVW00100M518Q00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 08 Jan 2010 02:15:01 +0100 (MET)
In-reply-to: <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> >> > I remember seeing this as well a long time ago, due to some
> >> > bug/misconfiguration. But that
> >> > got fixed.
> >
> > I'll dig through the mailbox ...
> 
> BTW, IIRC there were also some issues with some version of binutils,
> but I never saw that problem.
> 
> gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
> GNU assembler (GNU Binutils) 2.18.0.20080103

The 4.1.0 I built does not get past the compiler test now (miscompiles __weak).

My copy of crosstool (0.43) combines 4.1.0 and 4.1.1 (the latest supported) with 
binutils 2.16.1 ... I'll give 2.18 a try. 

3.3.6 is built with 2.15 - the m68k crosstool 0.38 build script of Christian did 
use 2.16. 

Probably no matter though - building 2.6.33 with my old cross compiler once I 
had revived that from the failing disk (3.3.6/2.16) results in the same double 
fault.
 
> My binutils is 2.18.1~cvs20080103-7 according to dpkg.

2.18.1~cvs20080103-0ubuntu1 ... what is the host binutils even used for? 
 
> > Can you send that kernel and the defconfig by PM please?
> 
> Done.

Thanks, testing ... yours does in fact boot on my ARAnyM setup. Compiling with 
your .config results in the same error. 
 
> > I tested one of the failing kernels on the real Falcon and it did spontaenously
> > reboot there (with no output) as well.
> 
> Strange.

Yep - I'll try to compile the last kernel version that worked for me to see what
the various cross compilers generate for that. 2.6.30-rc6 (botched git pull so 
I'm not too positive it isn't 2.6.29-something) does in fact compile fine with 
my old 3.3.6 cross-gcc as well as my newly built one. 

I'll verify that on the new tree, and start bisecting. Sigh. 

Cheers,

	Michael
