From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/coldfire: use PFN_DOWN macro
Date: Tue, 11 Aug 2015 21:02:20 +0200
Message-ID: <CAMuHMdXjXx0qdLzPWWVFJ=nu7M+UJhVHwdOq2LmwJ2hQc0gPBA@mail.gmail.com>
References: <1439312221-12688-1-git-send-email-kuleshovmail@gmail.com>
	<CAMuHMdV5bS1W5NkQnezYq_V9x2b1y2yQzgco1VNGzx9y9umapA@mail.gmail.com>
	<20150811180954.GA12610@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20150811180954.GA12610@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Kuleshov <kuleshovmail@gmail.com>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 11, 2015 at 8:09 PM, Alexander Kuleshov
<kuleshovmail@gmail.com> wrote:
>> > @@ -91,1 +92,1 @@ static void __init mcf54xx_bootmem_alloc(void)
>>
>> The numbers in the above line don't make sense?
>
> Hello Geert, Are you about `-91,1 +92,1....`? Or what numbers. If you are about

Yes.

> this, sorry for noise. I've checked the patch with the git apply --check and it
> will return some errors.

Indeed.

> If other things are normal I will resend correct patch.

OK, awaiting the update...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
