From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 11:51:03 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010041149030.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1119111518-1286153463=:285"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:61455 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752003Ab0JDAvK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Oct 2010 20:51:10 -0400
In-Reply-To: <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1119111518-1286153463=:285
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sun, 3 Oct 2010, Thorsten Glaser wrote:

> On m68k, I/O macros like inb() outw() etc. are only defined to something=
=20
> useful if CONFIG_ISA is set; dummies are in place if not, but four=20
> macros were missing from the !CONFIG_ISA case. Adding these makes some=20
> drivers, such as speakup, compile again. The patch was made against=20
> Debian=E2=80=99s linux-2.6_2.6.32-24, but

I was able to compile that source package. Can you please send the .config=
=20
you used?

Finn

> applies cleanly on linux-m68k master.
>=20
> Signed-off-by: Thorsten Glaser <tg@debian.org>
> ---
>  arch/m68k/include/asm/io_mm.h |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.=
h
> index 56a6555..be9d7da 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -387,9 +387,13 @@ static inline void isa_delay(void)
>  #define outb(val,port)     ((void)0)
>  #define outb_p(val,port)   ((void)0)
>  #define inw(port)          0xffff
> +#define inw_p(port)        0xffff
>  #define outw(val,port)     ((void)0)
> +#define outw_p(val,port)   ((void)0)
>  #define inl(port)          0xffffffffUL
> +#define inl_p(port)        0xffffffffUL
>  #define outl(val,port)     ((void)0)
> +#define outl_p(val,port)   ((void)0)
> =20
>  #define insb(port,buf,nr)  ((void)0)
>  #define outsb(port,buf,nr) ((void)0)
>=20
--0-1119111518-1286153463=:285--
