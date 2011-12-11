From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Cross Memory Attach v3
Date: Sun, 11 Dec 2011 22:11:03 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112112209570.6937@herc.mirbsd.org>
References: <20110719003537.16b189ae@lilo>
 <CAMuHMdWAhn7M8o0qY4pz3W1tyyKEcNY_YQL_6JuAPCcjL5vS1A@mail.gmail.com>
 <20111121104313.63c7f796@cyeoh-System-Product-Name>
 <CAMuHMdXfWoHx4GA3L8T6-6PFw9fdCVbooayR3La2Woe-0V2koA@mail.gmail.com>
 <Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org> <m2iplwuqwr.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:40951 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752528Ab1LKWMM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Dec 2011 17:12:12 -0500
In-Reply-To: <m2iplwuqwr.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Christopher Yeoh <cyeoh@au1.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, GNU Libc Maintainers <debian-glibc@lists.debian.org>

Andreas Schwab dixit:

>Thorsten Glaser <tg@mirbsd.de> writes:
>
>> Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	20=
11-12-04 14:36:16.000000000 +0000
>> +++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	2011-12=
-04 14:36:26.000000000 +0000
>> @@ -24,9 +24,9 @@
>>  	.text
>>  ENTRY (syscall)
>>  	move.l 4(%sp), %d0	/* Load syscall number.  */
>> -	_DOARGS_5 (24)		/* Frob arguments.  */
>> +	_DOARGS_6 (28)		/* Frob arguments.  */
>>  	trap &0			/* Do the system call.  */
>> -	UNDOARGS_5		/* Unfrob arguments.  */
>> +	UNDOARGS_6		/* Unfrob arguments.  */
>>  	cmp.l &-4095, %d0	/* Check %d0 for error.  */
>>  	jcc SYSCALL_ERROR_LABEL	/* Jump to error handler if negative.  */
>>  	rts			/* Return to caller.  */
>
>Thanks, installed.

(Where?) So, should $someone submit that to eglibc-ports and
Debisn src:eglibc? Did it indeed do the trick?

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
