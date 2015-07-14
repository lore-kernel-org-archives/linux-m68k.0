From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of drivers/char/nvram.c
Date: Tue, 14 Jul 2015 10:33:33 +0200
Message-ID: <mvmegkbf89u.fsf@hawking.suse.de>
References: <20150712102527.356151908@telegraphics.com.au>
	<20150712102528.107134628@telegraphics.com.au>
	<87d1zwc4dj.fsf@igel.home>
	<alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
	<CAMuHMdVGtdEMMMF87FAEuiKYyLZPQFQeaX5dH6DiATsmLxzJfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVGtdEMMMF87FAEuiKYyLZPQFQeaX5dH6DiATsmLxzJfw@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 14 Jul 2015 10:23:52 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Tue, Jul 14, 2015 at 10:17 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> On Mon, 13 Jul 2015, Andreas Schwab wrote:
>>> Finn Thain <fthain@telegraphics.com.au> writes:
>>> > BTW, I didn't change the SCSI ID location in NVRAM. This code says 16
>>> > whereas atari_scsi says 14. Which one is correct?
>>>
>>> I think atari_scsi is wrong.  The best source I could find
>>> (http://www.gratifiant.com/nvram-falcon-t561185) places it after the
>>> video mode byte, thus at byte 16.
>>
>> Thanks for that. BTW, I googled a phrase from that page and found this one
>>   http://toshyp.atari.org/en/004009.html
>> which may be closer to the source.
>
> Hence "int" is 16-bits in all those references?

Yes, TOS uses 16-bit ints throughout.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
