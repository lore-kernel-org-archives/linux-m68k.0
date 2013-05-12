From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: I/O macros redefined, inconsistent across m68k machdep headers
Date: Sun, 12 May 2013 13:15:59 +1200
Message-ID: <518EED4F.7080702@gmail.com>
References: <loom.20130511T171757-995@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:38810 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754458Ab3ELBQO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 May 2013 21:16:14 -0400
Received: by mail-pd0-f171.google.com with SMTP id r11so3604852pdi.30
        for <linux-m68k@vger.kernel.org>; Sat, 11 May 2013 18:16:13 -0700 (PDT)
In-Reply-To: <loom.20130511T171757-995@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Thorsten,
> I *really* dislike seeing messages like this while compiling,
> that=E2=80=99s why I=E2=80=99m sending them there. I had a look at bo=
th files,
> but there=E2=80=99s a lot of ifdeffery going on, and I don=E2=80=99t =
know
> which of the macro resolutions, if any, is supposedly correct.
>  =20
I'm responsible for part of the ifdef'ery in io_mm.h - as far as I can=20
see, Q40 only needs this hack for the parport, all other ISA accesses=20
should be mapped to isa_insl()/isa_outsl() with address translation=20
applied correctly in all cases regarding of whether or not this is a=20
multiarch kernel.

I'm certain there is a reason for turning the word macros into byte one=
s=20
(Q40 needs delays between accesses, maybe that's it. Or the parport chi=
p=20
is 8 bit only). So this most likely needs to stay.

A cleaner way to do this would be to prefix the #defines with

#ifdef isa_insl
#undef isa_insl
#undef isa_outsl
#endif

(untested)

or just #undef anyway, since we can be fairly certain the previous=20
#defines have been made.
>   CC [M]  drivers/parport/parport_pc.o
> In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
> parport_pc.c:67:0:
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warnin=
g:=20
> "insl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: t=
his is=20
> the location of the previous definition
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warnin=
g:=20
> "outsl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0: note: t=
his is=20
> the location of the previous definition
> In file included from /tmp/buildd/linux-3.8.12/drivers/parport/
> parport_pc.c:67:0:
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:14:0: warnin=
g:=20
> "insl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:280:0: note: t=
his is=20
> the location of the previous definition
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/parport.h:15:0: warnin=
g:=20
> "outsl" redefined [enabled by default]
> /tmp/buildd/linux-3.8.12/arch/m68k/include/asm/io_mm.h:283:0:this is =
the=20
> location of the previous definition
>
>
> This is from building the amiga flavour (first of six!) of the Debian
> unstable Linux kernel source package. We=E2=80=99ll have the new kern=
els in
> roughly 1=C2=BD-2 weeks, if everything works =E2=98=BA
>  =20
What kernel versions are these?

Cheers,

    Michael

> bye,
> //mirabilos
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
