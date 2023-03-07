Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F721C678D4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Mar 2023 07:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjCGHon convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Mar 2023 02:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCGHon (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Mar 2023 02:44:43 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB19B2B637
        for <linux-m68k@vger.kernel.org>; Mon,  6 Mar 2023 23:44:40 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id c18so13477554qte.5
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 23:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ArgdY1TKff+exoZRzS1JSqpFH0kCesLdWcVjj8exH0=;
        b=kQdpiHbe75jwpKB0JqANqk9N1Z2vDUW5jjz5dg3fH4Zo/eC0EoZwUJ7r8RHTHeH3af
         F/wEu2EeXYadQrckPyxS8WUrEiJHFAJ/tj/hoOzGP38wEy08BT93cfK/167x6wKOLvWW
         AiTLplCeUXL2C9jmEbXA5F6+IJ280E1NYBBbq+LgzFwZaxeb+hnX3pvTCRQawzKsccMs
         fFSaBzvbBO7CpMeXfsYPhG/YH2elFXQlcFJJSRFN5yjjcvPjH8OSZwJEk3gRgKe5Q5R1
         jimM2RzNTDUASZvpEb0fjYQ8EWG7v1di/5+ek5zO/Sb0Rrbkb7wN4Ghl1Vt6/GfH+RND
         Lr0A==
X-Gm-Message-State: AO0yUKVb6Xg2Wl/0f+0JkAmKhoZHV82MZ8gJnxCD4attW1EbYnKGi7LS
        IiiNs+NtV/vR/HavrydcYNX2rzsTiYl6nw==
X-Google-Smtp-Source: AK7set9GLBBcaFqG/UwFw5eoYJu2DhYcyUGgZ9QvfZ2sTesAtmcUSmfbaOrdnyfXWUollm5lulBzcg==
X-Received: by 2002:a05:622a:87:b0:3bd:85c:cb3 with SMTP id o7-20020a05622a008700b003bd085c0cb3mr23776694qtw.63.1678175079559;
        Mon, 06 Mar 2023 23:44:39 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id x21-20020a05620a01f500b0071eddd3bebbsm9026517qkn.81.2023.03.06.23.44.39
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 23:44:39 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5384ff97993so230718597b3.2
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 23:44:39 -0800 (PST)
X-Received: by 2002:a81:af0c:0:b0:52f:1c23:ef1 with SMTP id
 n12-20020a81af0c000000b0052f1c230ef1mr8882264ywh.5.1678175078767; Mon, 06 Mar
 2023 23:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20230301021107.26307-1-schmitzmic@gmail.com> <CAMuHMdVP=cNZKZcurO8V1UrNTUgookaWnmPr02+Wv9vxKX-b6Q@mail.gmail.com>
 <e02f3388-461c-27ac-b305-2a63ae144a48@gmail.com>
In-Reply-To: <e02f3388-461c-27ac-b305-2a63ae144a48@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Mar 2023 08:44:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLgQprQDfEavB+wmzLw2PFOZ2uz3Ucm1BxBfhyJvOifA@mail.gmail.com>
Message-ID: <CAMuHMdWLgQprQDfEavB+wmzLw2PFOZ2uz3Ucm1BxBfhyJvOifA@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: kernel/traps.c - only force 030 bus error if PC
 not in exception table
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Mar 7, 2023 at 1:28 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 7/03/23 02:03, Geert Uytterhoeven wrote:
> > On Wed, Mar 1, 2023 at 3:13 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> __get_kernel_nofault() does copy data in supervisor mode when
> >> forcing a task backtrace log through /proc/sysrq_trigger.
> >> This is expected cause a bus error exception on e.g. NULL
> >> pointer dereferencing when logging a kernel task has no
> >> workqueue associated. This bus error ought to be ignored.
> >>
> >> Our 030 bus error handler is ill equipped to deal with this:
> >>
> >> Whenever ssw indicates a kernel mode access on a data fault,
> >> we don't even attempt to handle the fault and instead always
> >> send a SEGV signal (or panic). As a result, the check
> >> for exception handling at the fault PC (buried in
> >> send_sig_fault() which gets called from do_page_fault()
> >> eventually) is never used.
> >>
> >> In contrast, both 040 and 060 access error handlers do not
> >> care whether a fault happened on supervisor mode access,
> >> and will call do_page_fault() on those, ultimately honoring
> >> the exception table.
> >>
> >> Add a check in bus_error030 to call do_page_fault() in case
> >> we do have an entry for the fault PC in our exception table.
> >>
> >> I had attempted a fix for this earlier in 2019 that did rely
> >> on testing pagefault_disabled() (see link below) to achieve
> >> the same thing, but this patch should be more generic.
> >>
> >> Tested on 030 Atari Falcon.
> >>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> >> Reported-by: Eero Tamminen <oak@helsinkinet.fi>
> >> CC: Eero Tamminen <oak@helsinkinet.fi>
> >> CC: Finn Thain <fthain@linux-m68k.org>
> >> CC: Andreas Schwab <schwab@linux-m68k.org>
> >> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
> >> Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
> >> --
> >>
> >> Changes from v1:
> >>
> >> - add comment
> >> - reword commit message
> >> - add link to old patch as well (stick to lore.kernel.org
> >>    even though these links are currently not functional)
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue as a fix in the m68k for-v6.3 branch.
>
> Thanks - I neglected to search far enough back to find where the context
> of this diff originates, but upon a closer look, it appears to be the
> well-known commit 1da177e4c3f4 (start of git history). Do you think this
> is worth a backport to stable?

I guess it will be auto-backported to stable once it has reached
upstream, together with the two other fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
