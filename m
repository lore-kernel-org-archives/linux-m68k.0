Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97660C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  9 May 2022 11:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbiEILUa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 May 2022 07:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbiEILU3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2022 07:20:29 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398D527CC6
        for <linux-m68k@vger.kernel.org>; Mon,  9 May 2022 04:16:36 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id x22so10682821qto.2
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2022 04:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcCLwmEt35Z55rlQaJspZMUM8zTcZBTGov/n3KCEVLE=;
        b=yIQOJ4DoTX8x0/tfDBnii/ABIHAk7C+h1rtBXMInngbEF0s5deoxaC8HubSvplig53
         j+2hp+MTBxyPy4aUpzUynHSokD/4drGDDgLtash5P6xv2GyREhsXqObZvXVQK4kakw/P
         tFaCtQw2GZeN39347Jt0FizL/r/LB+j5jnfcELW077oietgy4+gpx5s9xXjFWqsVrYOc
         JfPujretOKwoWRO8cMqAxypPI2Trw8ARIhR/7XMyo36xgXdtWfP5C2xR+QFgdkNa42O/
         hhV39yYWdm7l61pmUL0WH1OYQjA3nYVWHfxsPjRpXIAOEsS3Vg7n+EQveyAMpgMvkKjb
         g1Yg==
X-Gm-Message-State: AOAM531EOjyf7vdtcBXF9UMDzucbgHhKyGJ4FyunS3txtifTNZ2T1ejL
        6BKO2AIYzO3Dr/usr+psb9dXqhzCCqfzRw==
X-Google-Smtp-Source: ABdhPJxYwnlDoRmKmOxAXvGvxpIiX4tTGGtAMP/aPAphDkmleX3geAzBvb6Knj9e7Jwgs7O+J93HvQ==
X-Received: by 2002:ac8:5a47:0:b0:2e1:e78c:8367 with SMTP id o7-20020ac85a47000000b002e1e78c8367mr14455630qta.126.1652094994910;
        Mon, 09 May 2022 04:16:34 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id l128-20020a37a286000000b0069fc13ce24csm6806587qke.125.2022.05.09.04.16.34
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 04:16:34 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i11so2258641ybq.9
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2022 04:16:34 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr12693722yba.380.1652094994102; Mon, 09
 May 2022 04:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220127074158.25888-1-schmitzmic@gmail.com> <87r15ajnam.fsf@email.froward.int.ebiederm.org>
 <0955ca4b-bbe8-7978-4ac3-c6accac9d203@gmail.com>
In-Reply-To: <0955ca4b-bbe8-7978-4ac3-c6accac9d203@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 May 2022 13:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUFt2BX7m4BAMP8aJ9Si=sj8eupPf_oQ4_THPH5+b6HQ@mail.gmail.com>
Message-ID: <CAMuHMdVUFt2BX7m4BAMP8aJ9Si=sj8eupPf_oQ4_THPH5+b6HQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Add kernel seccomp support for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, May 6, 2022 at 10:37 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 04.05.2022 um 09:53 schrieb Eric W. Biederman:
> > Michael Schmitz <schmitzmic@gmail.com> writes:
> >> Patch 3 adds the test for TIF_SECCOMP thread info flag to call
> >> into syscall_trace_enter() when seccomp syscall filtering
> >> is active, which was missing from earlier versions (classic
> >> MMU m68k only - need some help with the test for 68000 and
> >> coldfire).
> >>
> >> The previous version required the TIF_SYSCALL_TRACE
> >> flag to be set for syscall filtering to work
> >>
> >> The rest of the series remains unchanged from v9.
> >>
> >> Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
> >> (33 with the old version).
> >>
> >> I hope you didn't waste too much effort on testing v8/v9, Adrian.
> >> Should have a suitably large brown paper bag somewhere yet :-(
> >
> > Has any progress been made on testing or merging this patch series?
>
> This series totally dropped off my radar, sorry. I had run out of
> options to test, and have been too busy to do much about that.
>
> > I was just thinking it might be nice if the only callers of
> > ptrace_report_syscall were ptrace_report_syscall_entry and
> > ptrace_report_syscall_exit.
>
> Just merging patch 1 would be enough there AFAICS. Any reason not to do
> that, Geert?

Indeed no reason. Applied and queued for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
