From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
 address
Date: Thu, 07 Jan 2010 03:08:59 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:34119 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756531Ab0AGDJF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jan 2010 22:09:05 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KVU00D00TZ1ZT00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 07 Jan 2010 03:09:01 +0100 (MET)
In-reply-to: <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> >> Thanks - I've started a fresh attempt to get the Atari kernel built and tested
> >> but I only get 'double bus fault' from ARAnyM regardless of cross compiler used.
> >> No console output, seems to happen before console init.
> >
> > I remember seeing this as well a long time ago, due to some
> > bug/misconfiguration. But that
> > got fixed.

I'll dig through the mailbox ... 

> > The actual config I'm using is slightly different as we're at 2.6.33-rc2 now.
> > I'll build `atari_defconfig' on current linux-m68k/master and will
> > give it a try.
> 
> Runs fine:
> 
> Linux version 2.6.33-rc2-atari-00203-gdd8abd9 (geert@ayla) (gcc
> version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)) #1 Mon Jan 4
> 08:27:54 CET 2010

Can you send that kernel and the defconfig by PM please? 

I tested one of the failing kernels on the real Falcon and it did spontaenously 
reboot there (with no output) as well. 

Thanks,

  Michael
