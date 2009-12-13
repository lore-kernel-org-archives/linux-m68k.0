From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Keys: KEYCTL_SESSION_TO_PARENT needs TIF_NOTIFY_RESUME architecture support
Date: Sun, 13 Dec 2009 15:49:09 -0800
Message-ID: <20091213234909.GA10609@cynthia.pants.nu>
References: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg> <21796.1260743776@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:36154 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752644AbZLMXtn (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 13 Dec 2009 18:49:43 -0500
Content-Disposition: inline
In-Reply-To: <21796.1260743776@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Morris <jmorris@namei.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Chris Zankel <chris@zankel.net>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org

On Sun, Dec 13, 2009 at 10:36:16PM +0000, David Howells wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > +#warning TIF_NOTIFY_RESUME not implemented
> > +	return -EOPNOTSUPP;
> 
> I wonder if it should printk() too.

I would think something like WARN_ONCE() or something rate limited would
be more appropriate.

	Brad Boyer
	flar@allandria.com
