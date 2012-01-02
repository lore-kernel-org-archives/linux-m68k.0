From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 11:04:12 +0900
Message-ID: <5496.1325469852@jrobl>
References: <1325264773.13595.133.camel@deadeye> <9569.1325306817@jrobl> <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail01-md.ns.itscom.net ([175.177.155.111]:33087 "EHLO
	mail01-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054Ab2ABCEQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 21:04:16 -0500
Received: from scan05-mds.s.noc.itscom.net (scan05-md.ns.itscom.net [175.177.155.100])
	by mail01-md-outgoing.ns.itscom.net (Postfix) with ESMTP id 5C15D9E04B7
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 11:04:12 +0900 (JST)
In-Reply-To: <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, aufs-users@lists.sourceforge.net, Thorsten Glaser <tg@mirbsd.de>, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Geert Uytterhoeven:
> If the Makefile refers to the macro, perhaps the Makefile should
> define it, and pass it with -D?

??
Instead of defining it in Makefile, "-imacros linux/aufs_name.h" is
added. Or do you mean -imacros is useless?


J. R. Okajima
