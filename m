From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Kernel sections loosing attributes
Date: Tue, 22 Oct 2013 00:01:03 +0200
Message-ID: <87vc0qcmhs.fsf@igel.home>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 21 Oct 2013 21:55:43 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> As I also got complaints about overlapping sections from strip, I switched
> from the good old gcc 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
> and binutils 2.18.0.20080103 to gcc 4.6.3 and binutils 2.22, but apart
> from fixing the overlapping sections, it still didn't work.

Have you tried the latest binutils?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
