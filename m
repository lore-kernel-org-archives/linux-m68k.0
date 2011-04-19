From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Writable sys_call_table (was: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of sys_call_table)
Date: Tue, 19 Apr 2011 15:25:45 +0200
Message-ID: <m2fwpefk4m.fsf__39474.1786564284$1303219564$gmane$org@igel.home>
References: <BANLkTimbHgmUvisE7+TCkgthejNi_zdojQ@mail.gmail.com>
	<alpine.OSX.2.00.1104191807210.373@ibook.intranet>
	<m2k4eqfocu.fsf@igel.home> <201104191416.35746.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201104191416.35746.arnd@arndb.de> (Arnd Bergmann's message of
	"Tue, 19 Apr 2011 14:16:35 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@snapgear.com>, Gavin Lambert <gavinl@compacsort.com>, uClinux development list <uclinux-dev@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, linux-arch@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> But it's not an array of pointers to function with signature
> void f(void).

It does not matter which kind of function pointer you use since all
function pointers are alike (unlike data pointers).

> It's an array of void pointers that we assign to function pointers of
> various types.

It is an array of function pointers.  It is only void * because that
suppresses a warning (it is only accessed through assembly, so any type
the size of a pointer would do).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
