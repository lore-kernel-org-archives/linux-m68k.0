From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 11:22:49 +0000
Message-ID: <4F0ACE09.7030406@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <4F0A2DD0.4000707@fairlite.co.uk> <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com> <4F0A3CDE.7070308@fairlite.co.uk> <4F0A421C.9000600@fairlite.co.uk> <m2wr91yxa4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:59535 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834Ab2AILWx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2012 06:22:53 -0500
In-Reply-To: <m2wr91yxa4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On 09/01/12 10:40, Andreas Schwab wrote:
> Alan Hourihane <alanh@fairlite.co.uk> writes:
>
>> *** FORMAT ERROR ***   FORMAT=0
>> Current process id is 768
>> BAD KERNEL TRAP: 00000000
>> Modules linked in:
>> PC: [<000029de>] flush_thread+0x8/0xe
> void flush_thread(void)
> {
> 	unsigned long zero = 0;
>
> 	current->thread.fs = __USER_DS;
> 	if (!FPU_IS_EMU)
> 		asm volatile (".chip 68k/68881\n\t"
> 			      "frestore %0@\n\t"
> 			      ".chip 68k" : : "a" (&zero));
> }
>
> GCC is optimizing away the initialisation of zero, since nothing visible
> is using its value.

Great spot!

Seems this also needs massaging into process_no.c too.

But am I at a shell prompt :-)

Alan.
