Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE289C77B75
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 06:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjEWG72 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 02:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjEWG70 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 02:59:26 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41162119
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 23:59:25 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561a7d96f67so90265237b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 23:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684825164; x=1687417164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNsVXRmG+EgAtae57+cQUpNnpmiDiZt+9c6Bhc+ZY20=;
        b=Tuq8gWaqovEUxporavsMKhK+7ya5a7mSAmbUCylgNGS/AacGAwXOls8QApoH+SdI3w
         sL7q7vvzDLbeOhmOVxHvsNVcp6bzPBsowyhhg0e7o4RJK6N4aaZrmziMVfZwex8PHVFo
         U526hKmzhy108sUeTV/LMyFrkAAqUmgpwxW0TNF3WPchpC1fjUC+xSBGyxfLOJ84+rT1
         pf56JbQ9xJJH1saFxKhMLO1//TTzyRv9/ag603E3A1uqgzgXxmK7b0MYeOQr+frONgrc
         2sdsctL+uh1sfJ53os7F6Kq4DGOa2rLxYkb53pCM3IUSSNtIW7RiESABR+jYq77oCclk
         ktcw==
X-Gm-Message-State: AC+VfDxv27mFfNijq46zU8nt8o1xQ4QWYDdHGse4IST5rWbYhMLhqT06
        zHpZ4jxmWwlS5FdkRlcysOuaK8dX7dinmQ==
X-Google-Smtp-Source: ACHHUZ5usjGZEgYTeJz9GAvbK970Ia/SdybzslxYi+ypXANzg2kD+QmD5qB0GfR13FTh+HVU0rVZJA==
X-Received: by 2002:a81:bb4a:0:b0:561:baab:fd22 with SMTP id a10-20020a81bb4a000000b00561baabfd22mr14297955ywl.3.1684825164126;
        Mon, 22 May 2023 23:59:24 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id n203-20020a8172d4000000b00545a08184cesm2685296ywc.94.2023.05.22.23.59.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 23:59:23 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-563874afe98so52296677b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 23:59:22 -0700 (PDT)
X-Received: by 2002:a0d:f407:0:b0:559:ea89:7c2c with SMTP id
 d7-20020a0df407000000b00559ea897c2cmr12284559ywf.33.1684825162595; Mon, 22
 May 2023 23:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683365892.git.fthain@linux-m68k.org> <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
 <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com> <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com>
In-Reply-To: <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 May 2023 08:59:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnofe1F3EJMkhjUb-hhFD5z0QERLHzpo0R7Ej05W=OWg@mail.gmail.com>
Message-ID: <CAMuHMdXnofe1F3EJMkhjUb-hhFD5z0QERLHzpo0R7Ej05W=OWg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] m68k: Move signal frame following exception on 68020/030
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>, stable@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, May 23, 2023 at 3:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 22/05/23 23:41, Geert Uytterhoeven wrote:
> > On Sat, May 6, 2023 at 11:36 AM Finn Thain <fthain@linux-m68k.org> wrote:
> >> On 68030/020, an instruction such as, moveml %a2-%a3/%a5,%sp@- may cause
> >> a stack page fault during instruction execution (i.e. not at an
> >> instruction boundary) and produce a format 0xB exception frame.
> >>
> >> In this situation, the value of USP will be unreliable. If a signal is to
> >> be delivered following the exception, this USP value is used to calculate
> >> the location for a signal frame. This can result in a corrupted user
> >> stack.
> >>
> >> The corruption was detected in dash (actually in glibc) where it showed
> >> up as an intermittent "stack smashing detected" message and crash
> >> following signal delivery for SIGCHLD.
> >>
> >> It was hard to reproduce that failure because delivery of the signal
> >> raced with the page fault and because the kernel places an unpredictable
> >> gap of up to 7 bytes between the USP and the signal frame.
> >>
> >> A format 0xB exception frame can be produced by a bus error or an address
> >> error. The 68030 Users Manual says that address errors occur immediately
> >> upon detection during instruction prefetch. The instruction pipeline
> >> allows prefetch to overlap with other instructions, which means an
> >> address error can arise during the execution of a different instruction.
> >> So it seems likely that this patch may help in the address error case also.
> >>
> >> Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
> >> Link: https://lore.kernel.org/all/CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com/
> >> Cc: Michael Schmitz <schmitzmic@gmail.com>
> >> Cc: Andreas Schwab <schwab@linux-m68k.org>
> >> Cc: stable@vger.kernel.org
> >> Co-developed-by: Michael Schmitz <schmitzmic@gmail.com>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue as a fix in the m68k for-v6.4 branch.
> >
> > I plan to send this upstream later this week, so any additional
> > testing would be appreciated.
>
> I've given this some lengthy stress testing, and haven't seen it fail once.
>
> In contrast, various attempts of mine to improve on the concept (by only
> moving the signal frame away from the USP in case it's likely to clash)
> sometimes came up against a kernel bus error in setup_frame() when
> copying the signo to the signal frame. I must be making some incorrect
> assumptions still ...
>
> Limiting the signal frame shift to bus fault exceptions that happen
> mid-instruction is not too much of an overhead even in low memory
> settings, and using 256 bytes (the largest possible operand size, i.e.
> the largest adjustment to USP that might occur on completion of the
> interrupted instruction) did not seem to cause any issues with stack
> growth either.
>
> I can give this some more testing in ARAnyM (extending the stack shift
> to format 7 frames) but I'd say it's got as much testing on 030 hardware
> as we can do.

Thank you for your continued testing!
And thanks a lot to anyone involved in nailing this issue!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
