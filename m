From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Fix ndelay() macro
Date: Fri, 28 Oct 2016 23:08:46 +0200
Message-ID: <CAMuHMdWEAkASM5TBRbYTtQGcnJpReF+bkV9OTLYEzJ7MzYVj_w__36541.4741485894$1477688963$gmane$org@mail.gmail.com>
References: <1477667548-740-1-git-send-email-boris.brezillon@free-electrons.com>
 <20161028210335.GA3940@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20161028210335.GA3940@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macq.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Philippe,

On Fri, Oct 28, 2016 at 11:03 PM, Philippe De Muyter <phdm@macq.eu> wrote:
> On Fri, Oct 28, 2016 at 05:12:28PM +0200, Boris Brezillon wrote:
>> The current ndelay() macro definition has an extra semi-colon at the
>> end of the line thus leading to a compilation error when ndelay is used
>> in a conditional block with curly braces like this one:
>
> without curly braces

Thanks, I'm fixing that up.

Boris: No need to resend.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
