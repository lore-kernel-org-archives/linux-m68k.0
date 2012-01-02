From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 22:53:56 +0900
Message-ID: <6600.1325512436@jrobl>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> <9798.1325486722@jrobl> <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org> <5487.1325510133@jrobl> <Pine.BSM.4.64L.1201021328500.13674@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail05-md.ns.itscom.net ([175.177.155.115]:50648 "EHLO
	mail05-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752485Ab2ABNyA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 08:54:00 -0500
Received: from scan03-mds.s.noc.itscom.net (scan03-md.ns.itscom.net [175.177.155.124])
	by mail05-md-outgoing.ns.itscom.net (Postfix) with ESMTP id 31FCD65845F
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 22:53:57 +0900 (JST)
In-Reply-To: <Pine.BSM.4.64L.1201021328500.13674@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Thorsten Glaser:
> Then, why include it in the Makefile at all?
> (Or, why include aufs_name.h from aufs_type.h?)

- AUFS_NAME is necessary for both of kernel-space and user-space.
- from userspace, users include aufs_type.h. to keep the consistency,
  aufs_type.h should include aufs_name.h.
- for kernelspace, to put aufs_name.h _before_ all other headers.

Do I make myself clear with my poor English?


J. R. Okajima
