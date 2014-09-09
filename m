From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Tue, 09 Sep 2014 20:33:22 +1200
Message-ID: <540EBB52.9080006@gmail.com>
References: <1409328966-10079-1-git-send-email-geert@linux-m68k.org> <540127EE.7080900@gmail.com> <CAMuHMdUVxCqLr5P4DVwsobsM7470QhXcy+RcPp=bD19K_uVmwA@mail.gmail.com> <540D6D3F.8070009@gmail.com> <CAMuHMdWZGpbVTvJypNXejpEQRUrSQbqbMCx=-Sy=7zQiPPsAFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWZGpbVTvJypNXejpEQRUrSQbqbMCx=-Sy=7zQiPPsAFQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

>>> Upon closer look, I think I broke the NetUSBee support if
> Aarghl, I meant EtherNAT. Sorry, I misread who's using ATARI ROM ISA and
> who's using memory mapped I/O.

Makes sense now.

> I had left out the isa_rom_*() clutter, as I was really talking about
> EtherNAT.

OK, so we are on the same version after all.

>
>> need to ensure CONFIG_ATARI_ROM_ISA is set for NetUSBee though. Maybe select
>> ATARI_ROM_ISA if ATARI_USB is selected in Kconfig.bus, just to be safe?
> But ATARI_ROM_ISA is not needed for EtherNAT? So I'd rather not add this
> dependency.

Correct - compiling for EtherNAT only would pull in ROM support where it 
is not in fact needed. Might do more harm than good.

> This does mean we have to distinguish in isp116x.h between three case, right?
>    - #ifdef CONFIG_ATARI_ROM_ISA=y: handle both
>    - elif defined(CONFIG_ATARI): handle EtherNAT only
>    - else: others

If we want to avoid triggering the same compile error again, yes. To 
optimize away the clutter, doubly yes. I doubt someone would want to 
build for NetUSBee only - there is no config option that would allow 
that at present. We did discuss simplifying the option mess at some 
stage (for EtherNEC or EtherNAT) - I would be hesitant to add NetUSBee 
or EtherNAT specific options back in.

>> The help text there could use an update as well - mention NetUSBee as user
>> of ATARI_ROM_ISA in addition to EtherNEC, and mention the need for
>> ATARI_ROM_ISA for the NetUSBee in the ATARI_USB section, if you rather not
>> pre-select ATARI_ROM_ISA there. Does this make sense?
> Yes it does.

Shall I submit a help text patch, or are you happy to do that?

Cheers,

     Michael
