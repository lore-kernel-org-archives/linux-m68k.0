From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: NULL pointer dereference in 3.3-rc6
Date: Sun, 18 Mar 2012 13:52:43 +0100
Message-ID: <m2zkbejckk.fsf@igel.home>
References: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg> (Geert
	Uytterhoeven's message of "Sun, 18 Mar 2012 12:35:06 +0100 (CET)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> I'm a bit puzzled, as the crash location is not a memory dereference but
> the "set_fs(MAKE_MM_SEG(wbs));" in do_040writeback1().

I guess the integer unit can move ahead while the memory unit processes
the write.  Take a look at the places that jump to 0x5da8.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
