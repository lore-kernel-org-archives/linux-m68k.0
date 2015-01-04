From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arch: m68k: mac: misc.c: Remove some unused functions
Date: Sun, 4 Jan 2015 20:36:59 +0100
Message-ID: <CAMuHMdXFu3n4d0dMZop186UF+QG=MtLHV=oQr+VszftpEA1kFQ@mail.gmail.com>
References: <1420131732-31039-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
	<alpine.LNX.2.00.1501041045020.15927@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1501041045020.15927@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Joshua Thompson <funaho@jurai.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jan 4, 2015 at 8:21 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Thu, 1 Jan 2015, Rickard Strandqvist wrote:
>> Removes some functions that are not used anywhere:
>> mac_pram_write() mac_pram_read()
>
> If you remove those functions, you'd then find that all of the called
> functions become unused:
>
> maciisi_read_pram
> maciisi_write_pram
> pmu_read_pram
> pmu_write_pram
> cuda_read_pram
> cuda_write_pram
> via_read_pram
> via_write_pram
>
> I'd rather not remove all of this code. Better to finish the
> implementation.

Indeed.

> Would it be acceptable to utilize drivers/char/generic_nvram.c and
> CONFIG_GENERIC_NVRAM? This is the PowerMac PRAM driver but looks generic
> enough that it may not need any modification for 68k Macs.

Yes, that would be great.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
