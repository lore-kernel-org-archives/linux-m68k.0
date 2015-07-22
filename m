From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of
 drivers/char/nvram.c
Date: Wed, 22 Jul 2015 15:52:04 +1200
Message-ID: <55AF1364.3080701@gmail.com>
References: <20150712102527.356151908@telegraphics.com.au>
 <20150712102528.107134628@telegraphics.com.au> <87d1zwc4dj.fsf@igel.home>
 <alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34787 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755179AbbGVDwQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Jul 2015 23:52:16 -0400
In-Reply-To: <alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi Finn,

I'm afraid I cannot test anything on Atari hardware at present - my 
Falcon ate it's IDE disk partition table with all the fun that entails. 
Haven't even begun to try and recover that yet.

If you send a patch I could build a kernel and send that to Christian 
for testing (if he's got his Falcon up and running - might be a tad warm 
in the attic for that, in fact).

Cheers,

     Michael


Am 14.07.15 um 20:17 schrieb Finn Thain:
> On Mon, 13 Jul 2015, Andreas Schwab wrote:
>
>> Finn Thain <fthain@telegraphics.com.au> writes:
>>
>>> BTW, I didn't change the SCSI ID location in NVRAM. This code says 16
>>> whereas atari_scsi says 14. Which one is correct?
>> I think atari_scsi is wrong.  The best source I could find
>> (http://www.gratifiant.com/nvram-falcon-t561185) places it after the
>> video mode byte, thus at byte 16.
> Thanks for that. BTW, I googled a phrase from that page and found this one
>    http://toshyp.atari.org/en/004009.html
> which may be closer to the source.
>
> I'll send a patch if someone can offer to test such a change to atari_scsi
> (or merely confirm that the SCSI ID setting in TOS does not match this_id
> given in dmesg).
>
