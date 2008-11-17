From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH/RFC] atafb line length
Date: Tue, 18 Nov 2008 00:01:30 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811172228350.7416@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162228270.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:47874 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751712AbYKQXBd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 17 Nov 2008 18:01:33 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KAI00L002MIVD00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Tue, 18 Nov 2008 00:01:30 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811162228270.20005@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> Make sure fix->line_length is always set, as some applications need it because
> they don't have fallback code if line_length is zero.

I did set line_length to zero for a reason while hacking on the driver, but my 
recollection of the reasons is quite fuzzy. I'll give it a test run on the real 
hardware. 

As with all other Atari bugs recently introduced, it may equally well be sloppy 
coding on my part. 
 
> Works on ARAnyM (Falcon emulation), but par->next_line is not set on any other
> Atari variant?

fix->line_length may not be used by anything other than the VIDEL. I'll check 
that in the hardware specific code. 

Thanks for adopting atafb :-)

	Michael
