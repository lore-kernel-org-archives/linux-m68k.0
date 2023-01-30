Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0604EC636D7
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 19:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237973AbjA3TZq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237575AbjA3TZf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 14:25:35 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6BB1D916
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:25:34 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-16346330067so16476367fac.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szZsHIWWwEIEvpBzNSiJ4tABquTay9jjA0cso0CeHsY=;
        b=Z1OYaB76wEkFB0BBQdmHGq9FrtyhA5zwlTodI+830OIsYNZYlkliQKk0VYkA8pveyi
         /2PTVHcUiug/u9nFMOBeNWu0/FaKWwKdRyNBpuTZyS5BVZ0XDBxj+BMwURiMeED70d4E
         JQWUHiIa1VL0SBesUB5UDe1GQG3pBqliXUekvZaagD3297SIA59tc30OFqxJB7eecH0J
         cn84fPK/V8YQnSzpknr+zN4EM0PHMIW+KFy4QnVo+aRNjdRNM5WPzkuZHFqeqqRfzK/9
         TWoWlvXu9MRtGzMrMPa4Uvd+5aEPlM/ZdZ5oYMRxTXU/6ZSsKzyA131VVVtWnJlEX5yU
         o2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szZsHIWWwEIEvpBzNSiJ4tABquTay9jjA0cso0CeHsY=;
        b=xMag6QPxb89vtuSO2VN+1YtvrsjJmX9yG1Dss5C/iwKBqNOn+fa8HFWDLfiysuCpvz
         m+VnGgiTr8gPpjxhDysxl9ayIOKoOW4ZIN9O8fBXVwAFJREl65Qs2k2Ezb5E9d33RkNE
         9szy8kVMOP1qh0qHsKdjTc7+Es6o+Y/dSGEtZcEsx0su35X5I+7pz3n/nIdeDHS2sJCr
         Ys5XfWg6DRrDQjSum/dkT01bHKgB3qLrNAm8drZ8EI9yEYTEk5C5QCUfrUiHweveJjMI
         G5hMqZQYKj2/hGyMPncq4eHQoomxUAJwX6aNcW54rwIbQ06LSzsmxI/SDFz1TtAIjht4
         StrA==
X-Gm-Message-State: AO0yUKVi/uU1MFyrGjuMwnzWtmskWQf5pPNoGvgR4ETxt33ISDy+5M3u
        VuyBgnvu9kMR0l2WAyeeI7nnySAuYZ/WkXFhPYE9jQ==
X-Google-Smtp-Source: AK7set830c+EUxOe9qQbgieMNM+kJN8XR9KQwuygfSQG3bmSJPBvl/GBgsvD4FoBJ796pyWhjloSjZtqWPjX844qs5c=
X-Received: by 2002:a05:6870:610d:b0:163:6c4f:ce0d with SMTP id
 s13-20020a056870610d00b001636c4fce0dmr1076652oae.219.1675106733949; Mon, 30
 Jan 2023 11:25:33 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat> <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat> <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat> <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
In-Reply-To: <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 30 Jan 2023 20:25:03 +0100
Message-ID: <CALJHbkCLVaPMZK2PMWDqROoSkzLJ9oD1WFJW6_bdkmdBoJrDJA@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     Eero Tamminen <oak@helsinkinet.fi>
Cc:     Tom Rini <trini@konsulko.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ereo,

On Mon, Jan 30, 2023 at 8:02 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
>
> Hi,
>
> On 30.1.2023 18.34, Tom Rini wrote:
> > That's great to hear. While I started my life on m68k machines, I never
> > did get Linux up on one. Do the coldfire platforms you have run U-Boot
> > today? If so, are they already supported upstream? One of my biggest
> > concerns about the architecture, in U-Boot, is that I've just not heard
> > of anyone using it in quite some time, and we don't have any emulated
> > platforms either (can it be done in QEMU? We have other plaforms in CI
> > via QEMU) so I worry it's not working.
>
> Qemu supports both m68k and ColdFire nowadays:
> https://www.qemu.org/docs/master/system/target-m68k.html
>
>
>         - Eero
>
> PS. For m68k there are also a lot of other emulators that emulate
> specific platforms.
>
> Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu
> got m68k support.
>
> WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this
> emulates also CPU cache.
>
> Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).
>
> Previous, 68030 NeXT emulator (based on Hatari).
>

Thanks, will have a look if last qemu works for ColdFire.

angelo


-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
