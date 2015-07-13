From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v4 00/25] Re-use nvram module
Date: Mon, 13 Jul 2015 09:55:31 +0200
Message-ID: <CAMuHMdX+5XHWf3sVqAnF_mioS1zZmxQXurEeMGMM3OKa9acxhA@mail.gmail.com>
References: <20150712102527.356151908@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35757 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbbGMHzc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jul 2015 03:55:32 -0400
In-Reply-To: <20150712102527.356151908@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

Hi Finn,

On Sun, Jul 12, 2015 at 12:25 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The generic NVRAM module, drivers/char/generic_nvram, implements a
> /dev/nvram misc device. It is used only by 32-bit PowerPC platforms and
> isn't generic enough to be more widely used.

[...]

Thanks for your work!

How are we gonna merge this?
Have you looked into the dependencies?
Are there (large) parts we can merge in parallel?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
