From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] m68k/amiga: Fix specifying multiple debug= parameters
Date: Sun, 1 Dec 2013 12:15:19 +0100
Message-ID: <CAMuHMdUsEc=webi62QpMasTjRVo2exsxxr204QDhM60MV383Ew@mail.gmail.com>
References: <1382039212-26062-1-git-send-email-geert@linux-m68k.org>
	<CAMuHMdUUvzc1eGhJjqye7aOcNQoGgOEfT=TDLQgbef6-0vT=qQ@mail.gmail.com>
	<87fvqkpam2.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <87fvqkpam2.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 25, 2013 at 8:03 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>>   2. Do we want to fix it this way? Alternatives are:
>>>        a. Reject a second debug= parameter by checking for a non-NULL .write()
>>>           method
>>>           => only the first debug console will be used,
>>>        b. Skip console registration in case of a non-NULL .write() method
>>>           => only the last debug console will be used,
>>>   3. Atari has a similar issue, with even more (4) debug consoles.
>
> 2b is backward compatible.

Thanks, good point!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
