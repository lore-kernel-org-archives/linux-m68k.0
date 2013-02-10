From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 13/17] [m68k] Atari: implement 16 bit access macros for
 ROM port ISA
Date: Sun, 10 Feb 2013 17:14:48 +0100
Message-ID: <CAMuHMdWhD2TZGCkyiCRecGnyqxKpG0La6iuJn8g-Kp8yL2yG6A@mail.gmail.com>
References: <20130131002932.ABA9F360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:45319 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754799Ab3BJQOt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 11:14:49 -0500
Received: by mail-ie0-f178.google.com with SMTP id c13so6717642ieb.37
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 08:14:48 -0800 (PST)
In-Reply-To: <20130131002932.ABA9F360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:29 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 13/17] [m68k] Atari: implement 16 bit access macros for ROM port ISA
>         adapter cards, following debugging and clarification
>         by David Galvez
>
> Signed-off-by: Michael Schmitz <schmitz@debian.org>
> ---
>  arch/m68k/include/asm/io_mm.h  |   16 ++++++++++++----
>  arch/m68k/include/asm/raw_io.h |   32 ++++++++++++++++++++++----------

To be folded into
    m68k-queue/m68k-atari-Initial-ROM-port-ISA-adapter-support.patch
    m68k-queue/m68k-atari-io.h-fixes-for-EtherNAT-driver.patch

> --- a/arch/m68k/include/asm/raw_io.h
> +++ b/arch/m68k/include/asm/raw_io.h
> @@ -77,19 +77,31 @@ extern void __iounmap(void *addr, unsigned long size);
>  #define rom_in_8(addr) \
>         ({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
>  #define rom_in_be16(addr) \
> -       ({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
> +       ({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
>  #define rom_in_be32(addr) \
> -       ({ u32 __v = (*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
> +       ({ u32 __v = (*(__force volatile u32 *) (addr)); __v; })
>  #define rom_in_le16(addr) \
> -       ({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
> +       ({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
>  #define rom_in_le32(addr) \
> -       ({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v >>= 8; __v; })
> -
> -#define rom_out_8(addr, b)     ({u8 __w, __v = (b); __w = ((*(__force volatile u8 *)  ((addr) + 0x10000 + (__v<<1)))); })
> -#define rom_out_be16(addr, w)  ({u16 __w, __v = (w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
> -#define rom_out_be32(addr, l)  ({u32 __w, __v = (l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
> -#define rom_out_le16(addr, w)  ({u16 __w, __v = cpu_to_le16(w); __w = ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
> -#define rom_out_le32(addr, l)  ({u32 __w, __v = cpu_to_le32(l); __w = ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
> +       ({ u32 __v = le32_to_cpu(*(__force volatile u32 *) (addr)); __v; })
> +
> +#define rom_out_8(addr, b)     \
> +        ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
> +        __w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
> +#define rom_out_be16(addr, w)  \
> +        ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
> +        __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
> +        __w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
> +#define rom_out_be32(addr, l)  \
> +        ({u32 __w, __v = (l);  u32 _addr = ((u32) (addr)); \
> +        __w = ((*(__force volatile u32 *) ((_addr | 0x10000) + (__v<<1)))); })

This doesn't look correct to me: "__v << 1" will not fit in 32-bit, so
you loose data.
Are 32-bit writes (and reads) supported?

> +#define rom_out_le16(addr, w)  \
> +        ({u16 __w, __v = cpu_to_le16(w); u32 _addr = ((u32) (addr)); \
> +        __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
> +        __w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })

As you have to split the 16-bit data word in two bytes anyway, it's
more efficient to
hardcode the passing of the bytes than using cpu_to_le16().

> +#define rom_out_le32(addr, l)  \
> +        ({u32 __w, __v = cpu_to_le32(l); u32 _addr = ((u32) (addr)); \
> +        __w = ((*(__force volatile u32 *) ((_addr | 0x10000) + (__v<<1)))); })

Same comment as for out_be32().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
