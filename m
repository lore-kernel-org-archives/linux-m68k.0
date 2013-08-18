From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Sun, 18 Aug 2013 09:41:34 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308180934140.2593@herc.mirbsd.org>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
 <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
 <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
 <Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
 <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
 <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com>
 <Pine.BSM.4.64L.1308131039210.1920@herc.mirbsd.org> <52101C34.8060404@gmail.com>
 <Pine.BSM.4.64L.1308180059420.18148@herc.mirbsd.org> <52108D28.1010405@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:10469 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab3HRJxX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 05:53:23 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7I9rGGE003205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Sun, 18 Aug 2013 09:53:21 GMT
In-Reply-To: <52108D28.1010405@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz dixit:

> Sorry, that one's unparseable on any Linux system I have access to.
> When did Debian switch to xz as compressor in archives?

Support for it was in squeeze, and first packages begun to
use it shortly afterwards, so for years. I think I even saw
it being used before squeeze, for leaf packages such as -dbg
ones or those with huge data.

On the other hand, to actually *boot* a system successfully
with this kernel you need an initrd, which requires a system
up to date as of roughly end of 2012, anyway (due to the
initramfs-tools package and the versions of the packages
that are actually needed to be put *on* the initrd, and due
to the initrd being expected to be xz IIRC). So I'm afraid
you need to boot into at least Linux 3.2 first - images are
at http://snapshot.debian.org/package/linux/3.2.35-2/ and
also require xz to unpack already, but that can be done on
any Unix box (even BSD) using ar and tar; those are mostly
monolithic and don't require an initrd to boot - then to
dist-upgrade your system to latest unstable, at which point
you can apt-get install the 3.10 kernel.

bye,
//mirabilos
-- 
> Hi, does anyone sell openbsd stickers by themselves and not packaged
> with other products?
No, the only way I've seen them sold is for $40 with a free OpenBSD CD.
	-- Haroon Khalid and Steve Shockley in gmane.os.openbsd.misc
