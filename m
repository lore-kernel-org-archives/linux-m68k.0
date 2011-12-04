From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Cross Memory Attach v3
Date: Sun, 4 Dec 2011 17:28:19 +0100
Message-ID: <CAMuHMdXzruGCt6C=Eynzan088m_OMbVfRi=kFiceCoR1SU6kjA@mail.gmail.com>
References: <20110719003537.16b189ae@lilo>
	<CAMuHMdWAhn7M8o0qY4pz3W1tyyKEcNY_YQL_6JuAPCcjL5vS1A@mail.gmail.com>
	<20111121104313.63c7f796@cyeoh-System-Product-Name>
	<CAMuHMdXfWoHx4GA3L8T6-6PFw9fdCVbooayR3La2Woe-0V2koA@mail.gmail.com>
	<Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52669 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754577Ab1LDQ2U convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Dec 2011 11:28:20 -0500
Received: by bkbzv3 with SMTP id zv3so803024bkb.19
        for <linux-m68k@vger.kernel.org>; Sun, 04 Dec 2011 08:28:19 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Christopher Yeoh <cyeoh@au1.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Thorsten,

On Sun, Dec 4, 2011 at 15:37, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>>It turned out the flags parameter was non-zero, due to syscall() only=
 supporting
>>up to 5 parameters in the glibc I was using for testing.
>>
>>I checked the eglibc sources (2.11.1-0ubuntu7.8), and it's still not
>>fixed there,
>>although I could find a fix for a similar issue in klibc
>>(http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D334917).
>
> Does this work for you?

Thanks!
Your patch looks fine, but I'm not gonna compile eglibc now.

> Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/m68k/syscall.S =C2=
=A0 =C2=A0 =C2=A0 2011-12-04 14:36:16.000000000 +0000
> +++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S =C2=A0 =C2=
=A02011-12-04 14:36:26.000000000 +0000
> @@ -24,9 +24,9 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.text
> =C2=A0ENTRY (syscall)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0move.l 4(%sp), %d0 =C2=A0 =C2=A0 =C2=A0/* =
Load syscall number. =C2=A0*/
> - =C2=A0 =C2=A0 =C2=A0 _DOARGS_5 (24) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Frob arguments. =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 _DOARGS_6 (28) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Frob arguments. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0trap &0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 /* Do the system call. =C2=A0*/
> - =C2=A0 =C2=A0 =C2=A0 UNDOARGS_5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Unfrob arguments. =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 UNDOARGS_6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Unfrob arguments. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp.l &-4095, %d0 =C2=A0 =C2=A0 =C2=A0 /* =
Check %d0 for error. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0jcc SYSCALL_ERROR_LABEL /* Jump to error h=
andler if negative. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rts =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Return to caller. =C2=A0*/

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
