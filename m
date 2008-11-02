From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add install target for m68k architecture.
Date: Sun, 2 Nov 2008 10:02:53 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811021001530.5281@anakin>
References: <12253978673698-git-send-email-Laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:56493 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805AbYKBJC6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 04:02:58 -0500
In-Reply-To: <12253978673698-git-send-email-Laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: linux-m68k@vger.kernel.org

On Thu, 30 Oct 2008, Laurent@lvivier.info wrote:
> From: Laurent Vivier <Laurent@lvivier.info>
> 
> This patch enables the use of "make install" on m68k architecture
> to copy kernel to /boot.
> 
> Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
> ---
>  arch/m68k/Makefile   |    3 ++
>  arch/m68k/install.sh |   52 ++++++++++++++++++++++++++++++++++++++++++++++++++

It seems like we have lots of install.sh files in arch/*/{boot/}. No two of
them are identical, but they're all very similar.
Perhaps it's better to consolidate them?

> +# User may have a custom install script
> +
> +if [ -x ~/bin/${CROSS_COMPILE}installkernel ]; then exec ~/bin/${CROSS_COMPILE}installkernel "$@"; fi
> +if [ -x /sbin/${CROSS_COMPILE}installkernel ]; then exec /sbin/${CROSS_COMPILE}installkernel "$@"; fi

I know the original one has the same limitation, but shouldn't we check for
all ${CROSS_COMPILE}installkernel in the user's $PATH?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
