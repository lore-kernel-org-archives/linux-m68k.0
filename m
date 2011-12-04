From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Cross Memory Attach v3
Date: Sun, 04 Dec 2011 19:34:44 +0100
Message-ID: <m2iplwuqwr.fsf@igel.home>
References: <20110719003537.16b189ae@lilo>
	<CAMuHMdWAhn7M8o0qY4pz3W1tyyKEcNY_YQL_6JuAPCcjL5vS1A@mail.gmail.com>
	<20111121104313.63c7f796@cyeoh-System-Product-Name>
	<CAMuHMdXfWoHx4GA3L8T6-6PFw9fdCVbooayR3La2Woe-0V2koA@mail.gmail.com>
	<Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40607 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755014Ab1LDSew (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Dec 2011 13:34:52 -0500
In-Reply-To: <Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org> (Thorsten
	Glaser's message of "Sun, 4 Dec 2011 14:37:33 +0000 (UTC)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Christopher Yeoh <cyeoh@au1.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Thorsten Glaser <tg@mirbsd.de> writes:

> Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S
> ===================================================================
> --- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	2011-12-04 14:36:16.000000000 +0000
> +++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	2011-12-04 14:36:26.000000000 +0000
> @@ -24,9 +24,9 @@
>  	.text
>  ENTRY (syscall)
>  	move.l 4(%sp), %d0	/* Load syscall number.  */
> -	_DOARGS_5 (24)		/* Frob arguments.  */
> +	_DOARGS_6 (28)		/* Frob arguments.  */
>  	trap &0			/* Do the system call.  */
> -	UNDOARGS_5		/* Unfrob arguments.  */
> +	UNDOARGS_6		/* Unfrob arguments.  */
>  	cmp.l &-4095, %d0	/* Check %d0 for error.  */
>  	jcc SYSCALL_ERROR_LABEL	/* Jump to error handler if negative.  */
>  	rts			/* Return to caller.  */

Thanks, installed.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
