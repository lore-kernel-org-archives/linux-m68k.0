From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 11:36:16 +1300
Message-ID: <5154C5E0.3040608@gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org> <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org> <51515889.6040106@uter.be> <5152996E.50800@gmail.com> <20130328211747.GA10917@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:56351 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607Ab3C1WgY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Mar 2013 18:36:24 -0400
Received: by mail-pb0-f47.google.com with SMTP id rp2so11359pbb.34
        for <linux-m68k@vger.kernel.org>; Thu, 28 Mar 2013 15:36:24 -0700 (PDT)
In-Reply-To: <20130328211747.GA10917@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, geert@linux-m68k.org, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

Christian,
>> If that's possible - does anyone have a kernel cross-compile machine
>> set up for that purpose?IJ?
> I have the cross-compilers from Thorsten installed and could just build a
> kernel for amiga from Geert's m68k repo.  I trimmed down the config a bit

Let's wait until Geert has applied my patches to m68k-queue.

> and removed some not needed drivers.  The kernel is now 3698472 bytes big.
> I still find that huge, but it allowed me to boot without a memfile to
> reduce the RAM!  Alas, no SCSI support for the B2060...

Not entirely unexpected.

> The official Debian package fails to cross-compile when building the
> hid-microsoft module, maybe its time to disable that? Probably this is not
> set in the m68k config, but in the "main" debian config. I am not sure if I
> can override that, it may be easier to build kernels (for testing and the

Why not? Just add another m68k patch that removes this option from the 
defconfig used.

> buildds) another way. kernel-package?

No idea really - how are the kernel packages built otherwise?

>> Next on my TODO: Amiga ESP SCSI (I've let that one sit for too long)
> Yes, please!

I hear you ...

Cheers,

     Michael
