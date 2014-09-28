From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 1/5] m68k: Disable/restore interrupts in hwreg_present()/hwreg_write()
Date: Sun, 28 Sep 2014 11:40:51 +0200
Message-ID: <m2oau09j6k.fsf@linux-m68k.org>
References: <1411896385-25384-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1411896385-25384-1-git-send-email-geert@linux-m68k.org> (Geert
	Uytterhoeven's message of "Sun, 28 Sep 2014 11:26:21 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> While most callers run early, before interrupt are disabled, or

                                       interrupts are enabled

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
