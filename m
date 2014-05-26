From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug console
Date: Mon, 26 May 2014 13:18:03 +1200
Message-ID: <CAOmrzk+vc3MTsCyMkMwq_1KDDY3teevvrRVyD6ho-RknT-b9pQ@mail.gmail.com>
References: <20140411052757.888960081@telegraphics.com.au>
	<20140411052759.169790206@telegraphics.com.au>
	<CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:50547 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbaEZBSD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 21:18:03 -0400
Received: by mail-ob0-f173.google.com with SMTP id wm4so7484753obc.18
        for <linux-m68k@vger.kernel.org>; Sun, 25 May 2014 18:18:03 -0700 (PDT)
In-Reply-To: <CAMuHMdUnoZVpq79LPPFN1dop8r0fMJYi7knT9a+pUHFqBAxEfQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On Sun, May 25, 2014 at 9:09 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Apr 11, 2014 at 7:28 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> Fix SCC initialization for Atari as was previously fixed for Mac. It's
>> probably not practical to share more code but some attempt is made to
>> align the Mac and Atari variants.
>>
>> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>>
>> ---
>> This patch needs testing on Atari. It can't be tested without editing
>> macro definitions to enable SCC debug output (which also means disabling
>> MFP debug output).
>>
>> The line rate is changed to 38400 baud to match the Mac code (which
>> follows the pmac_zilog serial console default). It would be nice to
>> standardize but I don't know whether this is realistic.
>>
>> The 7.9872 MHz PCLK used in this patch was inferred from the existing code
>> as I don't have any hardware data.
>
> Has anyone tested this on Atari?
>

Ooops - not yet. Thanks for reminding me.

Cheers,

  Michael
