Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3999DC636CD
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 21:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjA3Vuw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 16:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjA3Vuw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 16:50:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2737472B0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 13:50:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E98361280;
        Mon, 30 Jan 2023 21:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6D8C433D2;
        Mon, 30 Jan 2023 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675115450;
        bh=Y57z5W1jiRCGSSKHAs8VGIIVC8K6IkKYxssjhZMZbOY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lA+Ysc28X+Dz78qM/KaM98dytiu/bUOxvWt4z98Pit2QWXwobtu8lkpBs2gYE+LI8
         pHnMp3UR0FQjtNl/i3VaHATFJTqUibOTubwQBxdRf7ORBk6J25oXMBlYH5pLuRmkbf
         TWxPC4mYvJZ3+hZOCqcKlQhEnZG++Ds0p8+ysNks9XrC1iczRPfRPuLjDklMh15nHC
         FhXxZnU0Q3Hc7dCHgLVD8jzAItID3inUskmKC+hrDIHkcd+/NJqNgQ0JR6ux9U9YWq
         FqnUjsz/HYrl6aC0deXlLI8VC/5+094tVlygAv8YsCMbKFDAVaPKGswAr0FngqnbH+
         veWp9AhGDa8Hg==
Message-ID: <b3480cff-970b-bae3-4b8d-01cd587dcb94@kernel.org>
Date:   Tue, 31 Jan 2023 07:50:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: U-Boot support for M68K removal
Content-Language: en-US
To:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eero Tamminen <oak@helsinkinet.fi>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
 <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
 <CAMuHMdV3xawhr_syeM_5vLrQsF1nMqZhOuyBbUW2mjyPy6Om8Q@mail.gmail.com>
 <Y9ga+bN+wHEI7w0m@bill-the-cat>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <Y9ga+bN+wHEI7w0m@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Tom,

On 31/1/23 05:31, Tom Rini wrote:
> On Mon, Jan 30, 2023 at 08:10:36PM +0100, Geert Uytterhoeven wrote:
>> Hi Eero,
>>
>> On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
>>> On 30.1.2023 18.34, Tom Rini wrote:
>>>> That's great to hear. While I started my life on m68k machines, I never
>>>> did get Linux up on one. Do the coldfire platforms you have run U-Boot
>>>> today? If so, are they already supported upstream? One of my biggest
>>>> concerns about the architecture, in U-Boot, is that I've just not heard
>>>> of anyone using it in quite some time, and we don't have any emulated
>>>> platforms either (can it be done in QEMU? We have other plaforms in CI
>>>> via QEMU) so I worry it's not working.
>>>
>>> Qemu supports both m68k and ColdFire nowadays:
>>> https://www.qemu.org/docs/master/system/target-m68k.html
>>>
>>>
>>>          - Eero
>>>
>>> PS. For m68k there are also a lot of other emulators that emulate
>>> specific platforms.
>>>
>>> Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu
>>> got m68k support.
>>>
>>> WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
>>> emulates also CPU cache.
>>>
>>> Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
>>>
>>> Previous, 68030 NeXT emulator (based on Hatari).
>>
>> But none of the platforms listed above boot using U-Boot, which is
>> what Tom is interested in...
>>
>> "qemu-system-m68k -machine help" lists a.o.:
>>
>>      an5206               Arnewsh 5206
>>      mcf5208evb           MCF5208EVB (default)
>>
>> U-Boot still contains include/configs/M5208EVBE.h, but there are no
>> actual users...
>>
>> Angelo: so support for amcore in qemu would be nice ;-)
> 
> I did a little searching after sending and I see there's been some
> patches for mcf5208evb and U-Boot, in QEMU but the last message (2019)
> was that the CPU emulation wasn't quite complete enough.  But yes, one
> way or another, it would be really great to get a virtualized platform
> in CI to prevent future breakage.

FWIW the QEMU emulation of the m5208evb is good enough to run Linux.
I do a lot of kernel testing (and development!) using that.

Regards
Greg


