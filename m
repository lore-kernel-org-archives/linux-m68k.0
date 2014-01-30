From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k/atari - ide: do not register interrupt if
 host->get_lock is set
Date: Fri, 31 Jan 2014 08:41:28 +1300
Message-ID: <CAOmrzkJY-zGHfoX7zO+AXYgr0SRYHBohQJ5nD2X8BKogptUQoA@mail.gmail.com>
References: <1390896466-16446-1-git-send-email-schmitz@debian.org>
	<1390896466-16446-2-git-send-email-schmitz@debian.org>
	<CAMuHMdXNfcE8r4L9D=FkhjCubimsA45UjRPmfpgKwri2eGNJfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:45102 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753860AbaA3Tl3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 14:41:29 -0500
Received: by mail-ob0-f170.google.com with SMTP id va2so4038574obc.1
        for <linux-m68k@vger.kernel.org>; Thu, 30 Jan 2014 11:41:29 -0800 (PST)
In-Reply-To: <CAMuHMdXNfcE8r4L9D=FkhjCubimsA45UjRPmfpgKwri2eGNJfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Michael Schmitz <schmitz@debian.org>

Geert,

On Fri, Jan 31, 2014 at 4:03 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jan 28, 2014 at 9:07 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> --- a/drivers/ide/ide-probe.c
>> +++ b/drivers/ide/ide-probe.c
>> @@ -853,8 +853,9 @@ static int init_irq (ide_hwif_t *hwif)
>>         if (irq_handler == NULL)
>>                 irq_handler = ide_intr;
>>
>> -       if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
>> -               goto out_up;
>> +       if (!host->get_lock)
>> +               if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
>> +                       goto out_up;
>
> Don't you need a similar check for free_irq()?

Absolutely. Thanks for spotting this. I'll send the fixed version to linux-ide.

Cheers,

  Michael
