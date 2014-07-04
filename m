From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Remove FIXME comment in file sun3_pgalloc.h
Date: Fri, 4 Jul 2014 18:17:38 +0200
Message-ID: <CAMuHMdWJ=6FDzZg0p-_9eFaJ7sKrmmsJBy0sM5tsrGLFL0PgVg@mail.gmail.com>
References: <1404351693-5588-1-git-send-email-xerofoify@gmail.com>
	<alpine.LNX.2.00.1407041125060.15901@nippy.intranet>
	<CAPDOMVhvuvWesMev-5dOFA78Sf67o0kUCXR2VkdhE-xeiYQ=6w@mail.gmail.com>
	<alpine.LNX.2.00.1407041615280.8188@nippy.intranet>
	<CAPDOMVh4V_JLdXoL4SH6nWFwxnjXENWbyApkioK8eNE892iZ9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAPDOMVh4V_JLdXoL4SH6nWFwxnjXENWbyApkioK8eNE892iZ9A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nick Krause <xerofoify@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 4, 2014 at 6:10 PM, Nick Krause <xerofoify@gmail.com> wrote:
> Very well then seems I should resend this patch removing the define
> line as it seems to have no use
> in this file.

Indeed. Thanks in advance!
FYI, the last user of _KERNPG_TABLE was removed in 2.5.18.

> Cheers Nick
>
> On Fri, Jul 4, 2014 at 2:19 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>>
>> On Fri, 4 Jul 2014, Nick Krause wrote:
>>
>>> What are these two lines for them another compile issue?
>>
>> I don't see why those two lines are important.
>>
>>> >> -/* FIXME - when we get this compiling */
>>> >>  /* erm, now that it's compiling, what do we do with it? */
>>> >>  #define _KERNPG_TABLE 0
>>
>> Presumably it is the third line that the "FIXME" refers to.
>>
>> I didn't write this code, but obviously it isn't supposed to be read as
>>
>> /* FIXME - this comment needs to be deleted */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
