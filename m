From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: Macintosh booloader - EMILE
Date: Wed, 7 Jan 2009 16:17:03 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0901071606030.6444@halbrend.uninett.no>
References: <D044A55A-7048-4F40-82E2-B69770D8FED8@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:34033 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751257AbZAGPQt (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 7 Jan 2009 10:16:49 -0500
In-Reply-To: <D044A55A-7048-4F40-82E2-B69770D8FED8@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 6 Aug 2008, Laurent Vivier wrote:

> Hi guys,
> 
> a new version of EMILE is available.
> 
> It adds multiboot and ext2 support.
> 
> So, macintosh m68k developers, you can:
> 
> modify your kernel, compile it, install it and reboot ... as it is done on
> i386.

I'm pussled. I decided to try emile on my q610, so I downloaded the rescue
floppy and it works nicely, great! But the kernel was slightly old (to put
it mildly) and I really just want to make a scsi disk I can boot directly
from, so I decided to build emile myself... what pussles me is this:

aranym emile # make
Makefile:9: tools.mk: No such file or directory
sh scripts/tools.sh > tools.mk
Cannot find powerpc cross-compiler
make -C docs all
Missing tools to generate emile.conf.5 from emile.conf.sgml
make[1]: *** [emile.conf.5] Error 1
make: *** [docs] Error 2
aranym emile #


scripts/tools.sh says:

  if test "${ARCH}" != "ppc"
  then
          PPC_CROSS_COMPILE=powerpc-linux-
          if ! type "${PPC_CROSS_COMPILE}${CC}" > /dev/null 2>&1
  ...

Huh? It requires toolchain for PowerPC? What's going on?

I just want to build it on m68k :)

-- kolla
