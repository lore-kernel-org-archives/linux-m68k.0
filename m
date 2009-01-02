From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Fix atarimouse init
Date: Fri, 02 Jan 2009 01:27:04 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0901020126160.25512@zirkon.biophys.uni-duesseldorf.de>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin>
 <Pine.LNX.4.64.0812211205270.3499@anakin>
 <alpine.DEB.1.00.0812282252230.10733@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0812291151200.20983@anakin> <1230628701.6336.7.camel@joy>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:54771 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751119AbZABA1I (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 1 Jan 2009 19:27:08 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KCT00400IL59F00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 02 Jan 2009 01:27:05 +0100 (MET)
In-reply-to: <1230628701.6336.7.camel@joy>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Petr,

> > I get events from /dev/input/mouse0 and /dev/input/mice (atari_defconfig).
> > 
> > When running X under ARAnyM (depth 16), some shortcomings show up:
> >   - the middle mouse button is dead
> 
> BTW, ARAnyM implements a mouse extension for the wheels that is
> compatible with an existing hardware modification (or an add-on).
> Sometime later we could implement its support in linux to get true
> middle mouse button and its wheels.

So what would the middle button and wheel events be reported at? 

	Michael

