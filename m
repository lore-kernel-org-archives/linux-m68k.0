From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Server down
Date: Sun, 9 Nov 2008 10:56:35 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811091050530.19341@anakin>
References: <184247DB-011A-1000-A072-865705B74C2E-Webmail-10012@mac.com>
 <1226008853.9889.22.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:35028 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbYKIJ4j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 04:56:39 -0500
In-Reply-To: <1226008853.9889.22.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Tony Mantler <nicoyakitty@mac.com>, linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Thu, 6 Nov 2008, Kars de Jong wrote:
> On di, 2008-07-01 at 17:12 -0700, Tony Mantler wrote:
> > Sadly this afternoon the RAID on my server died bigtime, taking down my server. Further complicating matters is the fact that I'm in california for the next two months and I won't be able to repair it.
> > 
> > I have a backup of the m68k cvs, homedirs etc that I can send to someone else to host. Please reply to this address ASAP if you can provide hosting.
> 
> Hi Tony / Geert / Roman,
> 
> I wanted to do some m68k hacking again, tried to do a cvs update of my
> local tree(s) and found out it is no longer there :-(
> 
> I still have several old source trees on my disks (including 2.4 ones)
> for which I don't have current diffs against CVS and I have no idea how
> to generate them without the CVS repository...
> 
> I'm a bit rusty here, I never used git before...
> 
> How can I track the current Linux/m68k kernel sources, and how do I
> commit things?

The quilt series for my current development tree is at:

http://www.kernel.org/pub/linux/kernel/people/geert/linux-m68k-patches-2.6/

There are separate series for stable versions, e.g. in
linux-m68k-patches-2.6.27.

How to construct the m68k tree:

  1. Obtain Linus' tree:

	git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

  2. Download the patches

  3. Set up quilt

	cd linux-2.6
	ln -s where_you_downloaded_the_patches patches
	quilt push -a

A real git tree is on my todo-list...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
