From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Sun, 04 Jan 2009 03:05:04 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901040258150.18900@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin>
 <alpine.DEB.1.00.0901020046280.25512@zirkon.biophys.uni-duesseldorf.de>
 <jed4f6gi2l.fsf@sykes.suse.de>
 <alpine.DEB.1.00.0901022257150.738@zirkon.biophys.uni-duesseldorf.de>
 <1230962033.6343.15.camel@joy>
 <alpine.DEB.1.00.0901030758590.17350@zirkon.biophys.uni-duesseldorf.de>
 <jek59cg4m1.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:47302 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750870AbZADCFH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 3 Jan 2009 21:05:07 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCX00H00CGG0V00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 04 Jan 2009 03:05:04 +0100 (MET)
In-reply-to: <jek59cg4m1.fsf@sykes.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: Petr Stehlik <pstehlik@sophics.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

> > That may have been the reason, perhaps before the mouse driver was written to 
> > the busmouse interface (not sure I have kernel sources dating that far back).
> 
> You can get historical sources from
> <git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git>.  Tag
> v2.5.41 is the last one containing the old atarimouse driver.

If that's been the same as on the 0.9 series, I already have that (in 2.4.30). 
Thanks, that information helps me quite a bit aLready.

	Michael

