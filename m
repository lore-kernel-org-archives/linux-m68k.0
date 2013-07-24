From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 19:40:47 +0200
Message-ID: <CAMuHMdXpm7_1BWDm+3mq6oXO2PXqC=r7tQpfLjP-CF=48N=0qQ@mail.gmail.com>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
	<87li4wpc79.fsf@igel.home>
	<Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
	<loom.20130724T152350-539@post.gmane.org>
	<alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
	<Pine.BSM.4.64L.1307241723110.6532@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:44202 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873Ab3GXRks convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 13:40:48 -0400
Received: by mail-pd0-f176.google.com with SMTP id t12so646316pdi.21
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jul 2013 10:40:48 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1307241723110.6532@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

On Wed, Jul 24, 2013 at 7:23 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>>The patch below adds a wrapper that copies the (supposedly short) nam=
e to
>>the kernel stack before calling into ARAnyM.
>
> Is that enough? What about buffers and all that?

As m68k doesn't support highmem, all memory buffers should point to
"normal" kernel virtual memory. If any of these were a problem, we shou=
ld
have noticed already.

I had a quick look at our nf* drivers, and (unless I missed something) =
none
of them seem to pass pointers to static data to NF calls, except for th=
e
ID names and the buffer in arch/m68k/emu/natfeat.c:nfprint().
The latter is OK (albeit not thread-safe, but no one calls nfprint()?),
as natfeat.c is never a module.

> Sorry, won=E2=80=99t be testing these patches for a while,
> I need to concentrate on the Debian sid kernel for now.

OK. Enjoy sid, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
