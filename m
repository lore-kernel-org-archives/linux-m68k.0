From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: find_next bitops on m68k may cause out of bounds memory access
Date: Mon, 07 Feb 2011 23:33:28 +0100
Message-ID: <m2bp2nfpaf.fsf@igel.home>
References: <AANLkTik00GTZDn=t6J65dHjJiU53M5vXzBqToiYWz33P@mail.gmail.com>
	<AANLkTi=LA1fmipUSycAEk48TwVXhzwbY5KMSfu=YMiCy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=LA1fmipUSycAEk48TwVXhzwbY5KMSfu=YMiCy@mail.gmail.com>
	(Michael Schmitz's message of "Tue, 8 Feb 2011 10:22:30 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>, linux-m68k@lists.linux-m68k.org

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Thanks for spotting this - does anyone remember when this version of
> find_next bitops was first introduced?

c82db5b in git.kernel.org:ralf/linux-m68k.git

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
