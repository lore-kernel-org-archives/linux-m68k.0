From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari ROM port ISA
Date: Mon, 16 Apr 2012 11:09:30 +0200
Message-ID: <m2lilw11rp.fsf@igel.home>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F8BCF49.4060109@gmail.com> (Michael Schmitz's message of "Mon,
	16 Apr 2012 19:50:33 +1200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Right. Not sure how many data and address lines the ROM port has,

16 data and 16 address lines (68000 compatible, ie. A1-15 + UDS/LDS).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
