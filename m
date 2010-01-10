From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
 address
Date: Sun, 10 Jan 2010 05:56:57 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001100554300.24290@zirkon.biophys.uni-duesseldorf.de>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
 <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
 <alpine.DEB.2.00.1001072029380.15106@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001080025s657d354fl49d5c49fb8d81294@mail.gmail.com>
 <alpine.DEB.2.00.1001082331370.31802@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:63442 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751136Ab0AJE47 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 9 Jan 2010 23:56:59 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KW000500LQY0100@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 10 Jan 2010 05:56:58 +0100 (MET)
In-reply-to: <alpine.DEB.2.00.1001082331370.31802@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> > > I'll verify that on the new tree, and start bisecting. Sigh.
> > 
> > Good luck!
> 
> 7c5fd5619dc89fb52d2c2cf144fc6e4365427b86 is first bad commit
> commit 7c5fd5619dc89fb52d2c2cf144fc6e4365427b86
> Author: Tim Abbott <tabbott@ksplice.com>
> Date:   Sun Sep 27 13:57:55 2009 -0400
> 
>     m68k: Cleanup linker scripts using new linker script macros.
>     
>     Signed-off-by: Tim Abbott <tabbott@ksplice.com>
>     Tested-by: Andreas Schwab <schwab@linux-m68k.org>
>     Cc: Roman Zippel <zippel@linux-m68k.org>
>     Cc: Sam Ravnborg <sam@ravnborg.org>
>     Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> :040000 040000 5bdbf7ce5dd4ea2f23669c6a6ec11192865b5bfa 
> d3b7397533b0af6261747ccef3cff9cd40f6baf9 M	arch

Backing out that commit on the top of the tree results in a bootable 
2.6.33-rc2 for me

The order of symbols in the system map is different (as you would expect)
but I don't see what implicit assumption woule be violated.

	Michael
