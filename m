From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch] m68k: remove a superflous KERN_ERR
Date: Thu, 5 Mar 2015 12:46:15 +0100
Message-ID: <CAMuHMdVEz_vxeXe+gNo6kTBtDV3AKxjjUm8Xh-+J5S_77iZ_bA@mail.gmail.com>
References: <20150305112700.GC13378@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:41732 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751195AbbCELqQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Mar 2015 06:46:16 -0500
In-Reply-To: <20150305112700.GC13378@mwanda>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>

On Thu, Mar 5, 2015 at 12:27 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> pr_err() has a KERN_ERR built in.  Smatch complains about these nowadays.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks! Will apply and queue for v4.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
