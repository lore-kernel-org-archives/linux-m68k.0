From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] m68k: propose move of platform coldfire
Date: Thu, 21 Aug 2014 15:32:51 +0200
Message-ID: <CAMuHMdUFoGEUw7Sy2Nx4gR70GrxVYgJXPwL_eFnpS3CcybXigw@mail.gmail.com>
References: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
	<CAMuHMdX2a4n3+wAOmF43NCSBKowJ6X72KDtjgKzW-vYCLGisbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:54692 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755035AbaHUNcx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Aug 2014 09:32:53 -0400
Received: by mail-la0-f42.google.com with SMTP id pv20so8682879lab.29
        for <linux-m68k@vger.kernel.org>; Thu, 21 Aug 2014 06:32:51 -0700 (PDT)
In-Reply-To: <CAMuHMdX2a4n3+wAOmF43NCSBKowJ6X72KDtjgKzW-vYCLGisbQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Aug 21, 2014 at 9:30 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Aug 21, 2014 at 5:04 AM,  <gerg@uclinux.org> wrote:
>> I propose that we move the arch/m68k/platform/coldfire directory to be
>> directly under arch/m68k.
>>
>> The current platform/ structure was inhereted from the move of m68knommu,
>> and is inconsistent with the existing m68k platforms (each having a
>> directory under arch/m68k).
>>
>> Moving platform/coldfire is quite strait forward. The following patches do a
>> move, and fix up the broken pathname comments.
>
> That sounds fine to me.

All 2 of this series:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
