From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Wed, 30 Apr 2014 19:38:41 +1200
Message-ID: <5360A881.7040107@gmail.com>
References: <87ppk7m3db.fsf@igel.home> <loom.20140429T121132-254@post.gmane.org> <8738gwxw53.fsf@igel.home> <CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com> <87sioww0gb.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:50575 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbaD3Hit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Apr 2014 03:38:49 -0400
Received: by mail-ig0-f172.google.com with SMTP id hn18so7203784igb.11
        for <linux-m68k@vger.kernel.org>; Wed, 30 Apr 2014 00:38:49 -0700 (PDT)
In-Reply-To: <87sioww0gb.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

first off - thanks for the patch!

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> Always increases the initial mapping to 16 MiB.
> You can't map more than is available.
>
How about trying for 16, then 8, then 4? Would help my 14 MB ST-RAM Falcon.

I had a patch half prepared for that which I forgot to send ...

Cheers,

     Michael
