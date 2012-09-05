From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 3/3] Add support to M54xx DMA FEC Driver
Date: Wed, 5 Sep 2012 23:50:28 +1000
Message-ID: <504758A4.1050607@snapgear.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com> <1345551531-15348-3-git-send-email-stany.marcel@novasys-ingenierie.com> <503C5C5C.8000901@snapgear.com> <20120905091426.GA16015@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120905091426.GA16015@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: Stany MARCEL <stany.marcel@novasys-ingenierie.com>, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org

Hi Philippe,

On 09/05/2012 07:14 PM, Philippe De Muyter wrote:
> Seeing that I was not the only one wanting to have the m54xx fec dma
> driver merged in, and hoping to compare Stany's version to mine,
> I have rebased (step by step) my patch from v2.38 to v3.6rc2.
> The driver still works and perhaps even better due to some fixes
> in other m68k area.
>
> Unfortunately I have not being able to compare it yet fully with Stany's
> version because Stany's patch 2/2 did not apply (using `git am') to v3.5
> or v3.6rc2.
>
> I have checked my patch using a recent version of checkpatch.pl (not the
> v3.5 version, because v3.5 version of checkpatch.pl fails with :
> Nested quantifiers in regex; marked by <-- HERE in m/(\((?:[^\(\)]++ <-- HERE |(
> ?-1))*\))/ at scripts/checkpatch.pl line 340.))
>
> and I am now at :
>      464 WARNING: line over 80 characters
>       90 WARNING: Use of volatile is usually wrong: see Documentation/volatile-considered-harmful.txt
>
> Many "volatile" warnings are about such definitions :
>
> #define FEC_FECFRST(x)                 (*(volatile unsigned int *)(x + 0x1C4))
> which are afterwards used with
>
> +       FEC_FECFRST(base_addr) |= FEC_SW_RST;
> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
> +               FEC_FECFRST(base_addr) |= FEC_SW_RST;
> +               FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
> +       FEC_FECFRST(base_addr) |= FEC_SW_RST | FEC_RST_CTL;
> +       FEC_FECFRST(base_addr) &= ~FEC_SW_RST;
>
> Any advice about those ones ?

I am glad you brought this one up :-)
I really don't like the macro use for register access like this.
What I much prefer is use of the standard read/write functions for this.

So we have sane definitions for register offsets, eg:

     #define FEC_FECFRST		0x1c4

And then use becomes something like:

     frst = __raw_readl(base_addr + FEC_FECFRST);
     __raw_writel(frst | FEC_SW_RST, base_addr + FEC_FECFRST);
     __raw_writel(frst & ~FEC_SW_RST, base_addr + FEC_FECFRST);
    ...

Obviously you need to be careful of requirement to re-read the
register, I just assumed it wasn't required for this example.
And we can possibly optimize the address, but you get the idea.

The keeps all the use of volatile hidden away like we want.


> while many "80 characters" ones are about :
> #4014: FILE: arch/m68k/platform/coldfire/MCD_tasks.c:2406:
> +       0x6000000b, /* 0098(:1560):      DRD2A: EU0=0 EU1=0 EU2=0 EU3=11 EXT ini
> t=0 WS=0 RS=0 */
>
> I would like to keep those lines intact because the comment seems to actually
> be the assembler source of the hex value at left, which seems to be a
> microcode, and it makes sense to me to keep that on one line.  What do
> you think about that ?

Like Geert said, it is ok to exceed 80 chars for good reason, and I
think this is a good reason. The other most common one is to not break
up strings - you want them to be easily grepable.


> I did not include the current status of the patch because of its size
> (I did not separate the dma part of the ethernet driver part because
> the dma part is useless without the ethernet driver, and linking the
> ethernet driver cannot succeed without the dma part), but if you ask,
> I'll send it privately.

I understand that it all fits logically together. It is just really
hard for a reviewer to go through a huge single patch. Anything you
can do to break up into smaller pieces will make it much easier to
check over.

If you can send header files first, as separate patches, then C files,
maybe one patch each, and finally the Kconfig and Makefile changes last.
Just a suggestion though. This way you never break the build, even if
the files themselves are not used/built until after the last patch is
applied.

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
