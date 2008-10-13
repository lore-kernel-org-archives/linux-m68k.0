From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Linux and amiga floppy images
Date: Mon, 13 Oct 2008 04:20:29 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.0810130345170.4882@firda.kolla.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:55922 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbYJMCwD (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 12 Oct 2008 22:52:03 -0400
Received: from uninett.no (firda.kolla.no [158.38.160.150])
	by ufisa.uninett.no (Postfix) with ESMTP id 1C523348D5
	for <linux-m68k@vger.kernel.org>; Mon, 13 Oct 2008 04:20:30 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>


Hello!

I had a strange observation a few weeks ago that I intended to check with
you guys, but then forgot all about. :P

I was restoring some old amiga systems, and in that process needed to get
software onto floppies. I have a catweasel and can write out so called ADF
files (amiga floppy images) to floppies just fine with it (excellent
hardware). The problem I had was creating ADFs on linux, I assumes I could
just loopback-mount them with affs and just write files to them, but no -
I always ended up getting I/O-error, and the kernel put the filesystem
write-protected.

Deleting files seems to work ok, but once you try to write  a file, the
filesystem chokes, becomes write-protected and the resulting file is a
0-byte entry.

But I didnt give up there, I tried on different systems... much to my
amusement it worked fine on my linux/m68k systems - amigas, macs and
aranym alike!  OK, I thought, maybe endianness, so I tried on my ppc ibook
running linux - same failures as on the PCs. So - something is done very
correct on m68k in regard to affs, that isnt done correct on other archs.
Anyone know what that might be?

(All systems I tried with were running 2.6.2x, ubuntu, debian, gentoo)

Cheers!

-- kolla
