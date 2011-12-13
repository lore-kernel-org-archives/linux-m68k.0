From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: Cross Memory Attach v3
Date: Tue, 13 Dec 2011 11:59:16 +0100
Message-ID: <20111213105916.GA9956@hall.aurel32.net>
References: <20110719003537.16b189ae@lilo>
 <CAMuHMdWAhn7M8o0qY4pz3W1tyyKEcNY_YQL_6JuAPCcjL5vS1A@mail.gmail.com>
 <20111121104313.63c7f796@cyeoh-System-Product-Name>
 <CAMuHMdXfWoHx4GA3L8T6-6PFw9fdCVbooayR3La2Woe-0V2koA@mail.gmail.com>
 <Pine.BSM.4.64L.1112041436510.16947@herc.mirbsd.org>
 <m2iplwuqwr.fsf@igel.home>
 <Pine.BSM.4.64L.1112112209570.6937@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1112112209570.6937@herc.mirbsd.org>
Sender: Aurelien Jarno <aurelien@aurel32.net>
Resent-Message-ID: <7n0AeMHcU5J.A.ojE.4Az5OB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christopher Yeoh <cyeoh@au1.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, GNU Libc Maintainers <debian-glibc@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, Dec 11, 2011 at 10:11:03PM +0000, Thorsten Glaser wrote:
> Andreas Schwab dixit:
> 
> >Thorsten Glaser <tg@mirbsd.de> writes:
> >
> >> Index: eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S
> >> ===================================================================
> >> --- eglibc-2.13.orig/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	2011-12-04 14:36:16.000000000 +0000
> >> +++ eglibc-2.13/ports/sysdeps/unix/sysv/linux/m68k/syscall.S	2011-12-04 14:36:26.000000000 +0000
> >> @@ -24,9 +24,9 @@
> >>  	.text
> >>  ENTRY (syscall)
> >>  	move.l 4(%sp), %d0	/* Load syscall number.  */
> >> -	_DOARGS_5 (24)		/* Frob arguments.  */
> >> +	_DOARGS_6 (28)		/* Frob arguments.  */
> >>  	trap &0			/* Do the system call.  */
> >> -	UNDOARGS_5		/* Unfrob arguments.  */
> >> +	UNDOARGS_6		/* Unfrob arguments.  */
> >>  	cmp.l &-4095, %d0	/* Check %d0 for error.  */
> >>  	jcc SYSCALL_ERROR_LABEL	/* Jump to error handler if negative.  */
> >>  	rts			/* Return to caller.  */
> >
> >Thanks, installed.
> 
> (Where?) So, should $someone submit that to eglibc-ports and
> Debisn src:eglibc? Did it indeed do the trick?
> 

This patch should be reported to libc-ports@sourceware.org. If it also 
needs to be applied to the Debian package quickly, please open a bug 
report in the Debian BTS.

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
