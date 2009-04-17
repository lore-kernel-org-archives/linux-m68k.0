From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Linux/m68k on Atari
Date: Fri, 17 Apr 2009 03:06:45 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904170304330.18855@zirkon.biophys.uni-duesseldorf.de>
References: <20090327163917.e2b1d865.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904051035290.30160@zirkon.biophys.uni-duesseldorf.de>
 <20090409214055.f250de3c.mandin.patrice@orange.fr>
 <1239307252.11875.4.camel@joy>
 <20090410185538.04034623.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904120652210.2715@zirkon.biophys.uni-duesseldorf.de>
 <20090412094419.ab2ba909.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904140429240.18464@zirkon.biophys.uni-duesseldorf.de>
 <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
 <10f740e80904160219j7f4a71e5rceb634e3fb9cc4a3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:53213 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751649AbZDQBGr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 16 Apr 2009 21:06:47 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KI800K000FABN00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 17 Apr 2009 03:06:46 +0200 (MEST)
In-reply-to: <10f740e80904160219j7f4a71e5rceb634e3fb9cc4a3@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Patrice Mandin <mandin.patrice@orange.fr>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Hi Geert,

> > Geert, Roman: does paging_init rely on part of the first memory chunk being
> > mapped in head.S, or just part of the chunk the kernel resides in? Could I
> > reorder the m68k_memory[] elements in setup.c to fix the ordering problems?
> 
> Should work. config_amiga() removes Zorro II memory chunks, and that's
> just before
> paging_init() is called. of course you cannot reorder the first chunk,
> as that one is
> already in use.

Found that out the hard way. So what's the fix for this? Does the first chunk 
always have to be the one the kernel resides in? 

What is the reason for dropping chunks that are residing below the fisrst one, 
in paging_init ?? 

	Michael
