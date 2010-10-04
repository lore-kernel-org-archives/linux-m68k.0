From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for !CONFIG_ISA
Date: Mon, 4 Oct 2010 09:57:38 +0200
Message-ID: <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
	<Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:41646 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752580Ab0JDH5j convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 03:57:39 -0400
Received: by wyb28 with SMTP id 28so4647020wyb.19
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 00:57:38 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Hi,

please take care not to disturb these macros for any other case than
the default one (nothing related to ISA emulation configured at all).

Are you certain the speakup driver has a chance to work, once you got
it to compile?

Cheers,

  Michael


On Sun, Oct 3, 2010 at 8:48 PM, Thorsten Glaser <tg@debian.org> wrote:
> On m68k, I/O macros like inb() outw() etc. are only defined to
> something useful if CONFIG_ISA is set; dummies are in place if
> not, but four macros were missing from the !CONFIG_ISA case.
> Adding these makes some drivers, such as speakup, compile again.
> The patch was made against Debian=92s linux-2.6_2.6.32-24, but
> applies cleanly on linux-m68k master.
>
> Signed-off-by: Thorsten Glaser <tg@debian.org>
> ---
> =A0arch/m68k/include/asm/io_mm.h | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io=
_mm.h
> index 56a6555..be9d7da 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -387,9 +387,13 @@ static inline void isa_delay(void)
> =A0#define outb(val,port) =A0 =A0 ((void)0)
> =A0#define outb_p(val,port) =A0 ((void)0)
> =A0#define inw(port) =A0 =A0 =A0 =A0 =A00xffff
> +#define inw_p(port) =A0 =A0 =A0 =A00xffff
> =A0#define outw(val,port) =A0 =A0 ((void)0)
> +#define outw_p(val,port) =A0 ((void)0)
> =A0#define inl(port) =A0 =A0 =A0 =A0 =A00xffffffffUL
> +#define inl_p(port) =A0 =A0 =A0 =A00xffffffffUL
> =A0#define outl(val,port) =A0 =A0 ((void)0)
> +#define outl_p(val,port) =A0 ((void)0)
>
> =A0#define insb(port,buf,nr) =A0((void)0)
> =A0#define outsb(port,buf,nr) ((void)0)
> --
> 1.6.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
