From: Thorsten Glaser <tg@debian.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Tue, 29 Apr 2014 10:11:55 +0000 (UTC)
Message-ID: <loom.20140429T121132-254@post.gmane.org>
References: <87ppk7m3db.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:44398 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933194AbaD2KMI (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 29 Apr 2014 06:12:08 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Wf51D-0000HD-2B
	for linux-m68k@vger.kernel.org; Tue, 29 Apr 2014 12:12:07 +0200
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 29 Apr 2014 12:12:07 +0200
Received: from tg by fb-n15-11.unbelievable-machine.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Tue, 29 Apr 2014 12:12:07 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Andreas Schwab <schwab <at> linux-m68k.org> writes:

> If the size of the first memory chunk is at least 16MB increase the
> initial mapping to 16MB instead of 4MB.  This makes it possible to map

Why not always?

>  /* size of memory already mapped in head.S */
> -#define INIT_MAPPED_SIZE	(4UL<<20)
> +#define INIT_MAPPED_SIZE	(m68k_memory[0].size >= 16UL<<20 ? 16UL<<20 :
4UL<<20)

Ah, so this is where we missed when I tried earlier.

bye,
//mirabilos
