From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH/RFC] atafb and panning
Date: Sat, 22 Nov 2008 08:16:18 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811220812440.7263@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162235251.20005@anakin>
 <alpine.DEB.1.00.0811190828090.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190912190.27671@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:47661 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757306AbYKVHQU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 22 Nov 2008 02:16:20 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KAQ00A00477AM00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sat, 22 Nov 2008 08:16:19 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811190912190.27671@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > > Fix panning on ARAnyM (Falcon emulation). Without this, `fbtest test011' fails
> > > (for a 320x200x8 display with virtual 640x400).
> > 
> > Fails how, exactly? 
> 
> It shows a corrupted display (bad line length) if xoffset & 15 != 0.

OK; this should work but I'll have to verify it in 2.4. 
 
> > If var->xoffset has the low order bits set (sub-word pixel offset) 
> > par->hw.falcon.xoffset takes care of that, and xoffset takes care of the rest. 
> > Since the partial word offset shifts the beginnig of the scan line into the 
> > first word, the offset to the next scan line (par->hw.falcon.line_offset) has to 
> > be shortened. 
> 
> Sounds reasonable. But the shortening part doesn't work on ARAnyM, nor do
> small panning increments. So it really smells like an ARAnyM bug.

Petr said as much if I understand him right. No need to fix ARAnyM though, we 
just need to keep that in mind. 
 
> > I'll test your patch as soon as I get fbtest to work (missing libgcc_s.so.2).
> 
> The alternative is to compile fbtest yourself (CVS module
> FBdev/utlilities/fbtest from project linux-fbdev on sf.net).

Tried that before but could not get it to work a year ago. Will retry.

> I've been thinking of putting a git clone on kernel.org...

Good thinking - git I can use (sort of) :-)

	Michael

