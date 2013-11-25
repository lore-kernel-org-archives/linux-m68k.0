From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH/RFC] m68k/amiga: Fix specifying multiple debug= parameters
Date: Mon, 25 Nov 2013 20:03:33 +0100
Message-ID: <87fvqkpam2.fsf__18496.4665947065$1385406254$gmane$org@igel.home>
References: <1382039212-26062-1-git-send-email-geert@linux-m68k.org>
	<CAMuHMdUUvzc1eGhJjqye7aOcNQoGgOEfT=TDLQgbef6-0vT=qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUUvzc1eGhJjqye7aOcNQoGgOEfT=TDLQgbef6-0vT=qQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 25 Nov 2013 17:16:10 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

>>   2. Do we want to fix it this way? Alternatives are:
>>        a. Reject a second debug= parameter by checking for a non-NULL .write()
>>           method
>>           => only the first debug console will be used,
>>        b. Skip console registration in case of a non-NULL .write() method
>>           => only the last debug console will be used,
>>   3. Atari has a similar issue, with even more (4) debug consoles.

2b is backward compatible.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
