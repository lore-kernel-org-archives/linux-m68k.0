From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: Macintosh booloader - EMILE
Date: Thu, 8 Jan 2009 01:13:15 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0901080100400.17180@firda.kolla.no>
References: <D044A55A-7048-4F40-82E2-B69770D8FED8@lvivier.info> <alpine.LNX.2.00.0901071606030.6444@halbrend.uninett.no> <E254E686-E5C3-4432-BB1A-3EC5472A300C@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:57941 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752803AbZAHANS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 7 Jan 2009 19:13:18 -0500
In-Reply-To: <E254E686-E5C3-4432-BB1A-3EC5472A300C@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 7 Jan 2009, Laurent Vivier wrote:

> > aranym emile # make
> > Makefile:9: tools.mk: No such file or directory
> > sh scripts/tools.sh > tools.mk
> > Cannot find powerpc cross-compiler
> > make -C docs all
> > Missing tools to generate emile.conf.5 from emile.conf.sgml
> > make[1]: *** [emile.conf.5] Error 1
> > make: *** [docs] Error 2
> > aranym emile #
...
> > Huh? It requires toolchain for PowerPC? What's going on?
> 
> Not required, but one day I tried to boot Linux on powermac to replace bootx.

That's what I figured after looking at it more closely after I prematurely
sent the first mail.


> > I just want to build it on m68k :)
> 
> You just need to install docbook-to-man

Yes, I realised that. I cant really have been quite awake when I sent the
first mail. Anyways, emile seems to build fine on my aranym now, so
tomorrow I will hopefully be able to test a self-buildt floppy on my
quadra. :)

I currently have two 2GB SCSI disks, one with original MacOS on, and
one external with a tiny MacOS partition and the rest with linux, I never
got the mac to boot properly from this tiny MacOS partition, so I will now
try to repartition the disk with only Linux partitions, and initially use
an emile floppy to boot from, to test. If it works well, I replace the
internal 2GB "MacOS" disk with the Linux disk, and continue to use emile
from floppy, or perhaps install it on the disk if I feel brave...

(And hopefully I will also have a SCSI-SATA-adapter soon, and let new,
high capasity and _quiet_ 2.5" SATA drives (or even SSD) replace those old
noisy tiny SCSI drives)

Anyways, thanks a bunch for emile! :)

-- kolla
