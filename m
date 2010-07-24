From: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Sat, 24 Jul 2010 20:33:16 +0200
Message-ID: <95F9A48B-D971-4D99-95A1-7E7D10DC5448@bredband.net>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com> <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net> <alpine.OSX.2.00.1007221056390.354@localhost> <1CC1901B-7E56-4FAF-96A4-8F2F2F5C38A9@bredband.net> <alpine.OSX.2.00.1007231358580.393@localhost> <EF635C61-D531-4130-A94C-C3C6A0B1592B@bredband.net> <AANLkTikmRwtNdGKu-8ye4Yho1G7Cg7Sch2kMGQCQ2uaa@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtprelay-h32.telenor.se ([213.150.131.5]:51311 "EHLO
	smtprelay-h32.telenor.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754123Ab0GXSdU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 24 Jul 2010 14:33:20 -0400
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h32.telenor.se (Postfix) with ESMTP id 843B2E8FC2
	for <linux-m68k@vger.kernel.org>; Sat, 24 Jul 2010 20:33:17 +0200 (CEST)
In-Reply-To: <AANLkTikmRwtNdGKu-8ye4Yho1G7Cg7Sch2kMGQCQ2uaa@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, zippel@linux-m68k.org

> the way I understood post-increment to work was for this to happen
> only after instruction execution. If the effective address had been
> modified already, it would be more difficult for an emulator to
> determine the correct address after the trap. Also, it seems more
> efficient to first decode the instruction (and trap if needed) before
> fully decoding the address.

The 68LC040 calculates the effective address of unimplemented FP  
instructions and puts it in the exception frame so that the emulator  
should not have to - after all, the CPU already has the hardware to do  
EA calculations the right way. On the other hand, an instruction that  
traps will not, in general, alter any register.

For example, move.l -(a0),-(a0) will decrement a0 twice, once before  
the load and once again before the store. But if the either the load  
or store traps, the exception handler will see an unchanged register.  
At least this is my understanding after various experiments - the  
official docs are not very explicit about it.
