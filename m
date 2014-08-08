From: Tuomas Vainikka <tuomas.vainikka@kopteri.net>
Subject: Re: m68k v3.16 status update
Date: Fri, 08 Aug 2014 12:53:49 +0300
Message-ID: <53E49E2D.4020106@kopteri.net>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com> <06A072CC-7C42-47C2-A877-9012C3DE6585@2014.bluespice.org> <53E49150.60307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:42154 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755485AbaHHJxy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Aug 2014 05:53:54 -0400
Received: by mail-la0-f52.google.com with SMTP id b17so3322796lan.25
        for <linux-m68k@vger.kernel.org>; Fri, 08 Aug 2014 02:53:52 -0700 (PDT)
In-Reply-To: <53E49150.60307@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, =?windows-1252?Q?Ingo_J=FCr?= =?windows-1252?Q?gensmann?= <ij@2014.bluespice.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On 08.08.2014 11:58, Michael Schmitz wrote:
> Hi Ingo,
>> Am 05.08.2014 um 21:40 schrieb Geert Uytterhoeven 
>> <geert@linux-m68k.org>:
>>
>>> m68k v3.16 is out!
>>> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
>>> m68k-queue is getting smaller, but there are still a few commits left:
>>
>> Hmm, what about the Blizzard 2060 SCSI driver from Michael & Tuomas? 
>> It runs since then on Akire... 
>
> So it still runs OK - good to know.
>
> I understand Geert's reply to Adrian to please take this patch through 
> the SCSI maintainer, not m68k. Fair enough. We'll leave it as 2060 
> only driver for now and add other boards later.

I tested it on a Blizzard 1260 with the SCSI-expansion, so it actually 
supports two setups; [blz1230-IV, blz1240/60] + SCSI-kit, and blz2040/60.

-Tuomas
