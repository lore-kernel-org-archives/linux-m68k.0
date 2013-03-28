From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Thu, 28 Mar 2013 22:17:47 +0100
Message-ID: <20130328211747.GA10917@chumley.earth.sol>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
 <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be>
 <5152996E.50800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-08.arcor-online.net ([151.189.21.48]:55024 "EHLO
	mail-in-08.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752768Ab3C1VRt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 28 Mar 2013 17:17:49 -0400
Content-Disposition: inline
In-Reply-To: <5152996E.50800@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, geert@linux-m68k.org, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

On Wed, Mar 27, 2013 at 08:02:06PM +1300, Michael Schmitz wrote:
> Wouter,
> >>Sadly, policy allows only stuff that???s in Linus??? tree.
> >Nothing says we can't put a kernel with those patches into unreleased
> >(or what was it called again?) for the time being...
> If that's possible - does anyone have a kernel cross-compile machine
> set up for that purpose?IJ?

I have the cross-compilers from Thorsten installed and could just build a
kernel for amiga from Geert's m68k repo.  I trimmed down the config a bit
and removed some not needed drivers.  The kernel is now 3698472 bytes big. 
I still find that huge, but it allowed me to boot without a memfile to
reduce the RAM!  Alas, no SCSI support for the B2060...

The official Debian package fails to cross-compile when building the
hid-microsoft module, maybe its time to disable that? Probably this is not
set in the m68k config, but in the "main" debian config. I am not sure if I
can override that, it may be easier to build kernels (for testing and the
buildds) another way. kernel-package?

> Next on my TODO: Amiga ESP SCSI (I've let that one sit for too long)

Yes, please!

Christian
