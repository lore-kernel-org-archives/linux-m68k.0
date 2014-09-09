From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Tue, 9 Sep 2014 10:38:33 +0200
Message-ID: <CAMuHMdUSCE5+frT3ExdBPaoX2SRsPPXfJD5a9FCw6pTj4imJtQ@mail.gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
	<540127EE.7080900@gmail.com>
	<CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com>
	<540D6D3F.8070009@gmail.com>
	<CAMuHMdWZGpbVTvJypNXejpEQRUrSQbqbMCx=-Sy=7zQiPPsAFQ@mail.gmail.com>
	<540EBB52.9080006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <540EBB52.9080006@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Michael,

On Tue, Sep 9, 2014 at 10:33 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> The help text there could use an update as well - mention NetUSBee as
>>> user
>>> of ATARI_ROM_ISA in addition to EtherNEC, and mention the need for
>>> ATARI_ROM_ISA for the NetUSBee in the ATARI_USB section, if you rather
>>> not
>>> pre-select ATARI_ROM_ISA there. Does this make sense?
>>
>> Yes it does.
>
> Shall I submit a help text patch, or are you happy to do that?

Feel free to send patches. If not, I'll see if I find some spare time...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
