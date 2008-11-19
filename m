From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH/RFC] atafb line length
Date: Wed, 19 Nov 2008 08:04:23 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811190757430.6915@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162228270.20005@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:56053 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751271AbYKSHEZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 19 Nov 2008 02:04:25 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KAK00200JNCIC00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Wed, 19 Nov 2008 08:04:24 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811162228270.20005@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> Make sure fix->line_length is always set, as some applications need it because
> they don't have fallback code if line_length is zero.
> 
> Works on ARAnyM (Falcon emulation), but par->next_line is not set on any other
> Atari variant?

You're right - while testing on the Falcon framebuffer I noticed 
fix->line_length needs to be set, and kludged around to get it set to something 
more or less sane, but I could not test the other code paths. 

It looks like par->next_line should be set to linelen in all other decode_var 
variants. The quilt tree here does have fix->line_length = par->next_line 
already, what is your patch based on? 

I had 

fix->line_length = (par->hw.falcon.line_width + par->hw.falcon.line_offset) *
		par->hw.falcon.bpp / 8;

originally - I suppose this had to change with your cfb fixes? 

	Michael

