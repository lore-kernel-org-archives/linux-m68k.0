From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Writable sys_call_table (was: Re: [uClinux-dev] [PATCH] m68k:
 Merge mmu and non-mmu versions of sys_call_table)
Date: Wed, 20 Apr 2011 01:31:19 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1104200055310.441__11070.9644192413$1303227084$gmane$org@ibook.intranet>
References: <BANLkTimbHgmUvisE7+TCkgthejNi_zdojQ@mail.gmail.com> <201104181649.31492.arnd@arndb.de> <m2y637bkep.fsf@igel.home> <201104190948.36517.arnd@arndb.de> <alpine.OSX.2.00.1104191807210.373@ibook.intranet> <m2k4eqfocu.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2k4eqfocu.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@snapgear.com>, Gavin Lambert <gavinl@compacsort.com>, uClinux development list <uclinux-dev@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, linux-arch@vger.kernel.org


On Tue, 19 Apr 2011, Andreas Schwab wrote:

> Finn Thain <fthain@telegraphics.com.au> writes:
> 
> > Wouldn't that require const void * const sys_call_table[] ?
> 
> No, the right signature would be void (*const sys_call_table[])(void)
> since this is an array of function pointers.

Right. I mis-parsed the definition as a pointer to an array... Sorry about 
the noise.

Finn


> 
> Andreas.
> 
> 
