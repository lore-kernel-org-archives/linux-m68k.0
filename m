From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Linux/m68k on Atari
Date: Tue, 14 Apr 2009 09:22:59 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
References: <20090327163917.e2b1d865.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904010922070.16532@zirkon.biophys.uni-duesseldorf.de>
 <20090404001951.55483d55.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904051035290.30160@zirkon.biophys.uni-duesseldorf.de>
 <20090409214055.f250de3c.mandin.patrice@orange.fr>
 <1239307252.11875.4.camel@joy>
 <20090410185538.04034623.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904120652210.2715@zirkon.biophys.uni-duesseldorf.de>
 <20090412094419.ab2ba909.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904140429240.18464@zirkon.biophys.uni-duesseldorf.de>
 <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:64564 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752123AbZDNHXE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 14 Apr 2009 03:23:04 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KI200E00XUCIY00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Tue, 14 Apr 2009 09:23:00 +0200 (MEST)
In-reply-to: <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrice Mandin <mandin.patrice@orange.fr>
Cc: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Hi,

> > Anyway: do you have a section like this in your log?
> > 
> > Ignoring memory chunk at 0x0:0xe00000 before the first chunk
> > Fix your bootloader or use a memfile to make use of this area!
> 
> Yes, I have this message in my log. Full log attached (seems minicom
> cut it at 80 cols).

Must be a minicom setting problem - mine doesn't (at least not what's copied to 
the log after ^A L).

Geert, Roman: does paging_init rely on part of the first memory chunk being 
mapped in head.S, or just part of the chunk the kernel resides in? Could I 
reorder the m68k_memory[] elements in setup.c to fix the ordering problems? 

	Michael

