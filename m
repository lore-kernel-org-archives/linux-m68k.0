From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: 3.12 won't startup at amiga 1200 [Antworten] [AntwortenAnAlle]
Date: Tue, 12 Nov 2013 11:02:42 +0100
Message-ID: <mvmtxfiq6nx.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:45116 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752409Ab3KLKDH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 05:03:07 -0500
In-Reply-To: tuxist@tuxist.de's message of "Sat\, Oct 26\, 2013 at 7\:37 PM"
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuxist <tuxist@tuxist.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Tuxist <tuxist@tuxist.de> writes:

> i have now successfully boot my amiga with rtc and linux-next now seem's
> the fpu emulation brocken
>
> Failure Message:
>
> PC: [<00020840>] fp_normalize_ext+0x0/0xe

        move.l  (%a0)+,%d0

> SR: 2010  SP: 079d1f3c  a2: 079e3820
>
> d0: 079e3a7a    d1: 7fffffff    d2: f23c5438    d3: 00000002
>
> d4: 00000005    d5: 800261b8    a0: 0000001c    a1: 079e3a0a
>
> Process syslogd-listfil (pid: 1397, task=079e3820)

Can you find out what is the actual FPU insn that is emulated?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
