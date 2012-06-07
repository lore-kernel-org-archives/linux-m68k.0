From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Thu, 07 Jun 2012 15:14:58 +0200
Message-ID: <m2bokvw9f1.fsf__42584.7105020241$1339074957$gmane$org@igel.home>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
	<CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
	<20120530140444.GA10543@frolo.macqel>
	<CAMuHMdW29QYN6XpBb9F3GGoJ-9frrD-00Wx=FchT9ALqW1LcPg@mail.gmail.com>
	<4FCEF956.9090603@snapgear.com>
	<CAMuHMdWg6W4uOm3N-etXJud5Lw-vBkstQ2h7HK=6i+sCLgeksQ@mail.gmail.com>
	<4FD08C1B.1090107@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4FD08C1B.1090107@snapgear.com> (Greg Ungerer's message of "Thu,
	7 Jun 2012 21:10:19 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Philippe De Muyter <phdm@macqel.be>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Greg Ungerer <gerg@snapgear.com> writes:

> This strikes me as odd. Maybe this has been wrong all along. I need
> to check further but in a little testing I did today I think it may
> well be that all ColdFire support unaligned reads and writes.

The CFPRM doesn't indicate otherwise (the address error exception is
only documented to be raised for a word index addressing mode).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
