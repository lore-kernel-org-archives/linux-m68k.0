Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD260C05027
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Feb 2023 07:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjBBHwm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Feb 2023 02:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjBBHwl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Feb 2023 02:52:41 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8304C30FB
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Feb 2023 23:52:40 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id m12so1052949qth.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 23:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQbGJF3NNyVyfmPRcK3LOjc+wIsZSabpqWJ/hgW3N7E=;
        b=2fEzHiYfR6HYu55fBYv0klKRPN34k9GgHUu860ANqqvXUX+nA08vXfmZReF/OB/KnW
         soUmL5KNc745SnkKTuSuDInOLBK3h9Xcjg9JG4cJp+/VzuPNNz0Kd1a+VWZwVjtCtRTz
         k+ilxhR330LtX0gMr3hC//Pg3W1gttfWnUcLyyNSr4M+2byqmXdmZLn3qo4X+sBGT0m8
         Yu8rLNRXi1NbHwqK4Xt1OMsiI5yfM/xHFxwTDc6jgCS6CPgyeSZi/ElGn87J43psDckM
         JPg+PVO4DYB3WiQwKbb/tgppnVod4wPGDqOI+V5v0agSDbmZAJPbS5s56x61qUDl8NzW
         tVMw==
X-Gm-Message-State: AO0yUKXkDXieMztaDhT5N0bUTmh71mFEpBDOF8fM3xlTPTdj9a24VF78
        PiCDCayfH3nQWwcESApzS8ASu79Z3DWnZg==
X-Google-Smtp-Source: AK7set/KXgWLgyDDtFlOH37ApPB3iS83MutB0/lxsuj36JKCPOQHLehYDJCzra3z+G4rtbyA+47VEw==
X-Received: by 2002:a05:622a:593:b0:3b6:2f3f:2713 with SMTP id c19-20020a05622a059300b003b62f3f2713mr10606794qtb.25.1675324359480;
        Wed, 01 Feb 2023 23:52:39 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm8612579qkn.49.2023.02.01.23.52.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 23:52:39 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 123so1146625ybv.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Feb 2023 23:52:38 -0800 (PST)
X-Received: by 2002:a25:ada1:0:b0:839:c329:be37 with SMTP id
 z33-20020a25ada1000000b00839c329be37mr648939ybi.89.1675324358662; Wed, 01 Feb
 2023 23:52:38 -0800 (PST)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com> <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com> <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
In-Reply-To: <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Feb 2023 08:52:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQrOe+Oq-1VPQY_DMbQXBA4og+OnGOgfwvjG-5jn=ONg@mail.gmail.com>
Message-ID: <CAMuHMdXQrOe+Oq-1VPQY_DMbQXBA4og+OnGOgfwvjG-5jn=ONg@mail.gmail.com>
Subject: Re: stack smashing detected
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Stan Johnson <userm57@yahoo.com>, debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael et al,

On Wed, Feb 1, 2023 at 7:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 2/02/23 05:38, Stan Johnson wrote:
> > On 1/30/23 8:05 PM, Michael Schmitz wrote:
> >> ...
> >> Am 30.01.2023 um 17:00 schrieb Stan Johnson:
> >>> I am seeing anywhere from zero to four of the following errors while
> >>> booting Linux on 68030 systems and using sysvinit startup scripts:
> >>>
> >>> *** stack smashing detected ***: terminated
> >>> Aborted
> >>>
> >>> I usually (but not always) see three of the errors while init is running
> >>> the rcS.d scripts, and one while running the rc2.d scripts. The stack
> >>> smashing messages appear only on the system console (nothing is logged
> >>> in an error log or dmesg). Despite the errors, the system continues
> >>> booting to multiuser mode without any obvious additional problems. I
> >>> haven't tested systemd, which is too slow to be useful on my m68k
> >>> systems (though I have a Debian SID with systemd that I can restore for
> >>> testing if necessary).
> >>>
> >>> ...
> >> Another way may be logging the start of each of the rcS.d or rc2.d
> >> scripts until you know what scripts to look at in more detail, then
> >> adding 'set -v' at the start of those to log every command in the
> >> offending script.
> > Hi Michael,
> >
> > Thanks for your reply.
> >
> > After logging the start and end of each script, I see that the "stack
> > smashing detected" error often happens while running
> > "/etc/rcS.d/S01mountkernfs.sh" (/etc/init.d/mountkernfs.sh). I'll try to
> > isolate it to a particular command.
> >
> > This may be a coincidence, but the error seems to happen (up to about 4
> > times) after a warm boot into Mac OS 7.5.5 and a subsequent boot into
> > Linux that when starting with a cold boot into Mac OS 7.5.5, but it
> > doesn't seem that that should make any difference for Linux. This
> > morning, after a cold boot, I saw two of the errors, while after a warm
> > boot, I saw four.
> Hmm - that might well indicate a hardware issue rather than software.
> Bits flipping at random in RAM (and getting picked up because the stack
> canary changes).

You can enable extra debugging options in the kernel, which might help
detecting memory corruption, like CONFIG_DEBUG_LIST and DEBUG_SLAB.
It will slow down your kernel, and make it grow too large, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
