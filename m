From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Make sure {read,write}s[bwl]() are always defined
Date: Mon, 16 Apr 2012 21:56:33 +1000
Message-ID: <4F8C08F1.5050907@snapgear.com>
References: <1334516410-5777-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1334516410-5777-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Felipe Balbi <balbi@ti.com>, Greg Ungerer <gerg@uclinux.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Hi Geert,

On 04/16/2012 05:00 AM, Geert Uytterhoeven wrote:
> If CONFIG_ATARI_ROM_ISA is defined (e.g. allmodconfig), musb fails to
> compile with:
>
> In file included from drivers/usb/musb/musb_core.h:68,
>                   from drivers/usb/musb/musb_core.c:104:
> drivers/usb/musb/musb_io.h:45: error: conflicting types for =C3=A6raw=
_insl=C3=86
> arch/m68k/include/asm/raw_io.h:200: error: previous definition of =C3=
=A6raw_insl=C3=86 was here
> drivers/usb/musb/musb_io.h:47: error: conflicting types for =C3=A6raw=
_insw=C3=86
> arch/m68k/include/asm/raw_io.h:121: error: previous definition of =C3=
=A6raw_insw=C3=86 was here
> drivers/usb/musb/musb_io.h:52: error: conflicting types for =C3=A6raw=
_outsl=C3=86
> arch/m68k/include/asm/raw_io.h:240: error: previous definition of =C3=
=A6raw_outsl=C3=86 was here
> drivers/usb/musb/musb_io.h:54: error: conflicting types for =C3=A6raw=
_outsw=C3=86
> arch/m68k/include/asm/raw_io.h:161: error: previous definition of =C3=
=A6raw_outsw=C3=86 was here
> make[4]: *** [drivers/usb/musb/musb_core.o] Error 1
>
> This happens because musb_io.h provides default implementations for
> {read,write}s[bwl]() on most platforms, some of which conflict with t=
heir
> Atari ROM ISA counterparts.
>
> To avoid adding a check for CONFIG_ATARI_ROM_ISA to musb_io.h, make s=
ure
> {read,write}s[bwl]() are always defined on m68k, and disable the defa=
ult
> implementations in musb_io.h on m68k, like is already done for severa=
l
> other architectures.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> Cc: Felipe Balbi<balbi@ti.com>
> Cc: Greg Ungerer<gerg@uclinux.org>
> --
> Felipe: OK if I carry this through the m68k tree, as CONFIG_ATARI_ROM=
_ISA
>          (and this compile problem) is not yet in mainline, and fixin=
g only
>          musb_io.h now would introduce a regression in mainline?
>          I could also proactively have m68k provide {read,write}s[bwl=
]() in
>          mainline before pushing out Atari ROM ISA support.
> Greg: Do you want a similar change for asm/io_no.h? Or move it to asm=
/io.h?

Ultimately I would like to see it in asm/io.h. It is on my list of file=
s
to merge back together, ending up with a single asm/io.h.

But right now I don't mind at all if it is easier for you to push into
asm/io_mm.h.


>        Or do you want musb_io.h to check for
>        "!(defined(CONFIG_M68K)&&  defined(CONFIG_MMU))" instead?

No, I would rather see just the defined(CONFIG_M68K), and no check for
CONFIG_MMU. I am pretty sure there is some similarity between the way
the Atari does ISA bus interfacing to what some of the ColdFire boards
do.

>        Or don't you care, as allmodconfig never selects nommu anyway?

Well, I do care a little :-)

Regards
Greg


> ---
>   arch/m68k/include/asm/io_mm.h |   12 +++++++-----
>   drivers/usb/musb/musb_io.h    |    2 +-
>   2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io=
_mm.h
> index eff3f83..73dc331 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -371,11 +371,6 @@ static inline void isa_delay(void)
>   #define writeb(val,addr) out_8((addr),(val))
>   #define readw(addr)      in_le16(addr)
>   #define writew(val,addr) out_le16((addr),(val))
> -
> -#define readsw  raw_insw
> -#define writesw raw_outsw
> -#define readsl  raw_insl
> -#define writesl raw_outsl
>   #endif /* CONFIG_ATARI_ROM_ISA */
>
>   #if !defined(CONFIG_ISA)&&  !defined(CONFIG_ATARI_ROM_ISA)
> @@ -415,6 +410,13 @@ static inline void isa_delay(void)
>   #define readl(addr)      in_le32(addr)
>   #define writel(val,addr) out_le32((addr),(val))
>
> +#define readsb(port, buf, nr)     raw_insb((port), (u8 *)(buf), (nr)=
)
> +#define readsw(port, buf, nr)     raw_insw((port), (u16 *)(buf), (nr=
))
> +#define readsl(port, buf, nr)     raw_insl((port), (u32 *)(buf), (nr=
))
> +#define writesb(port, buf, nr)    raw_outsb((port), (u8 *)(buf), (nr=
))
> +#define writesw(port, buf, nr)    raw_outsw((port), (u16 *)(buf), (n=
r))
> +#define writesl(port, buf, nr)    raw_outsl((port), (u32 *)(buf), (n=
r))
> +
>   #define mmiowb()
>
>   static inline void __iomem *ioremap(unsigned long physaddr, unsigne=
d long size)
> diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
> index 1d5eda2..f7c1c8e 100644
> --- a/drivers/usb/musb/musb_io.h
> +++ b/drivers/usb/musb/musb_io.h
> @@ -40,7 +40,7 @@
>   #if !defined(CONFIG_ARM)&&  !defined(CONFIG_SUPERH) \
>   	&&  !defined(CONFIG_AVR32)&&  !defined(CONFIG_PPC32) \
>   	&&  !defined(CONFIG_PPC64)&&  !defined(CONFIG_BLACKFIN) \
> -	&&  !defined(CONFIG_MIPS)
> +	&&  !defined(CONFIG_MIPS)&&  !defined(CONFIG_M68K)
>   static inline void readsl(const void __iomem *addr, void *buf, int =
len)
>   	{ insl((unsigned long)addr, buf, len); }
>   static inline void readsw(const void __iomem *addr, void *buf, int =
len)


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
