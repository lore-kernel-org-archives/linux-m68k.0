From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: nfhd performance
Date: Sat, 17 Aug 2013 09:36:55 +0200
Message-ID: <CAMuHMdUkMEorK34WnV9==thRPCVRXV0ySWq=fFTNFO1fe3Qc6g@mail.gmail.com>
References: <CAMuHMdUwzzx5Ae7sdvbRBtgY4UoXpo5-ig4PfdqFH4beWv_AHQ@mail.gmail.com>
	<03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:38261 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab3HQHgz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Aug 2013 03:36:55 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so2742721pab.35
        for <linux-m68k@vger.kernel.org>; Sat, 17 Aug 2013 00:36:55 -0700 (PDT)
In-Reply-To: <03094f45e85bca24df9306f73df2c84c@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, aranym@lists.bobek.cz

On Sat, Aug 17, 2013 at 4:01 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> In a kernel that has both IDE and nfhd support, once everything is in the
>> buffer cache, I get:
>>
>> atari:~# dd if=/dev/hda2 bs=1M of=/dev/null
>> 134+1 records in
>> 134+1 records out
>> 141114880 bytes (141 MB) copied, 5.91 seconds, 23.9 MB/s
>> atari:~# dd if=/dev/nfhd8p2 bs=1M of=/dev/null
>> 134+1 records in
>> 134+1 records out
>> 141114880 bytes (141 MB) copied, 17.09 seconds, 8.3 MB/s
>>
>> So nfhd is slower than emulated IDE?
>
>
> That seems odd indeed ... is the disk attached as IDE or via USB adapter?
> (Checking to see whether I should get similar results)

It's not a physical disk:

[IDE0]
Present = Yes
IsCDROM = No
ByteSwap = No
ReadOnly = No
Path = /scratch/geert/aranym/etch-m68k.img
Cylinders = 2102
Heads = 16
SectorsPerTrack = 63
ModelName = Sarge m68k

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
