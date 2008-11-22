From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH/RFC] atafb line length
Date: Sat, 22 Nov 2008 08:11:26 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0811220805200.7263@zirkon.biophys.uni-duesseldorf.de>
References: <Pine.LNX.4.64.0811162228270.20005@anakin>
 <alpine.DEB.1.00.0811190757430.6915@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0811190909530.27671@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:47039 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752595AbYKVHLa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 22 Nov 2008 02:11:30 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KAQ009003Z4Z800@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sat, 22 Nov 2008 08:11:28 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0811190909530.27671@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

> > It looks like par->next_line should be set to linelen in all other decode_var 
> > variants. The quilt tree here does have fix->line_length = par->next_line 
> > already, what is your patch based on? 
> 
> It was based on mainline. Yes, a part of my patch had been in my quilt series
> for a while, but I wanted to post the full thing for review.

OK, I see. 
 
> > I had 
> > 
> > fix->line_length = (par->hw.falcon.line_width + par->hw.falcon.line_offset) *
> > 		par->hw.falcon.bpp / 8;
> > 
> > originally - I suppose this had to change with your cfb fixes? 
> 
> That should be OK. Strange, it's not what I got from you, cfr. atafb in
> mainline.

I concede this may be something I changed later on. atafb had been worked on my 
Roman Zippel as well after my initial patches so I'll double check this isn't 
obsolete (I was looking at my current working tree though).
 
> Cfb16 needed
>   1. fix->line_length to be valid (it was zero)
>   2. info->pseudo_palette

OK, so the above fix->line_length may be independent from your fixes.

I'll test that (just not right away, home improvement work has taken a heavy 
toll on my time lately).

	Michael
