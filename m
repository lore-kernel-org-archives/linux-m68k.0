From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 11:40:03 +0100
Message-ID: <m2wr91yxa4.fsf@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<4F0A3CDE.7070308@fairlite.co.uk> <4F0A421C.9000600@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:33359 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752381Ab2AIKkH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2012 05:40:07 -0500
In-Reply-To: <4F0A421C.9000600@fairlite.co.uk> (Alan Hourihane's message of
	"Mon, 09 Jan 2012 01:25:48 +0000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Alan Hourihane <alanh@fairlite.co.uk> writes:

> *** FORMAT ERROR ***   FORMAT=0
> Current process id is 768
> BAD KERNEL TRAP: 00000000
> Modules linked in:
> PC: [<000029de>] flush_thread+0x8/0xe

void flush_thread(void)
{
	unsigned long zero = 0;

	current->thread.fs = __USER_DS;
	if (!FPU_IS_EMU)
		asm volatile (".chip 68k/68881\n\t"
			      "frestore %0@\n\t"
			      ".chip 68k" : : "a" (&zero));
}

GCC is optimizing away the initialisation of zero, since nothing visible
is using its value.

Andreas.

--------------------------->8----------------------------------------
>From bbf7451db90fcec5eade9d8bc913b78829192b9c Mon Sep 17 00:00:00 2001
From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 9 Jan 2012 11:36:18 +0100
Subject: [PATCH] m68k: fix assembler constraint to prevent overeager gcc
 optimisation

Passing the address of a variable as an operand to an asm statement
doesn't mark the value of this variable as used, so gcc optimized its
initialisation away.  Fix this by using a "m" constraint instead.
---
 arch/m68k/kernel/process_mm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
index 1bc223a..aa4ffb8 100644
--- a/arch/m68k/kernel/process_mm.c
+++ b/arch/m68k/kernel/process_mm.c
@@ -189,8 +189,8 @@ void flush_thread(void)
 	current->thread.fs = __USER_DS;
 	if (!FPU_IS_EMU)
 		asm volatile (".chip 68k/68881\n\t"
-			      "frestore %0@\n\t"
-			      ".chip 68k" : : "a" (&zero));
+			      "frestore %0\n\t"
+			      ".chip 68k" : : "m" (zero));
 }
 
 /*
-- 
1.7.8.3


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
