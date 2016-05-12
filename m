From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: Thu, 12 May 2016 10:35:02 +0200
Message-ID: <mvmd1orbrnt.fsf@hawking.suse.de>
References: <20160512080429.31536.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160512080429.31536.qmail@ns.horizon.com> (George Spelvin's
	message of "12 May 2016 04:04:29 -0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org

"George Spelvin" <linux@horizon.com> writes:

> I went digging through a lot of ColdFire documentation to see if
> there were ever any that needed it, and apparently it's been in there
> since the beginning.
>
> It did occur to me that perhaps someone wanted to support tne
> intersection of all 68k family CPUs, so that meant only MULU.W
> and ADD.L.  But I can't see a gcc option to ask for that.

My guess is that someone added the support just to get it through the
assembler, without thinking about not compiling it at all for coldfire
configurations.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
