From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 18:19:54 +0200
Message-ID: <CAMuHMdXNBMgHoA50Ek=edWB7jrGTWJogBMTMfDwjDF6SMVU3Dw@mail.gmail.com>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
	<87li4wpc79.fsf@igel.home>
	<Pine.BSM.4.64L.1307241241550.30771@herc.mirbsd.org>
	<loom.20130724T152350-539@post.gmane.org>
	<alpine.DEB.2.02.1307241645500.8930@ayla.of.borg>
	<1374678140.18072.10.camel@pracovni>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:50061 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935Ab3GXQTz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 12:19:55 -0400
Received: by mail-pb0-f51.google.com with SMTP id um15so9859709pbc.38
        for <linux-m68k@vger.kernel.org>; Wed, 24 Jul 2013 09:19:55 -0700 (PDT)
In-Reply-To: <1374678140.18072.10.camel@pracovni>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

On Wed, Jul 24, 2013 at 5:02 PM, Petr Stehlik <pstehlik@sophics.cz> wrote:
>> ARAnyM hackers: What's the maximum size of ID names?
>
> There isn't any given limit AFAIK, it's based on a common sense when
> creating a new NatFeat name.

Understood :-) What's the size of the longest name in use?
Is 32 OK?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
