From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] kexec support for Linux/m68k (tools part)
Date: Fri, 13 Dec 2013 09:03:45 +0100
Message-ID: <CAMuHMdW8cSLXy36fD1QaSjHoFsM5B4ZK4JVwLY-OefX+wFOtiQ@mail.gmail.com>
References: <1381859460-13645-1-git-send-email-geert@linux-m68k.org>
	<20131213005322.GJ32101@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20131213005322.GJ32101@verge.net.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org

Hi Simon,

On Fri, Dec 13, 2013 at 1:53 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Oct 15, 2013 at 07:50:57PM +0200, Geert Uytterhoeven wrote:
>> kexec support for Linux/m68k (tools part)
>>
>> This is a set of patches to add kexec support for m68k to kexec-tools.
>>
>>   - Kexec only, no kdump support yet (do you have enough RAM to keep a
>>     crashdump kernel in memory at all times? ;-)
>
> Thanks, applied.

Thanks, I have queued the kernel counterpart for 3.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
