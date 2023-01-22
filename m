Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19C9C25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 18:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjAVSuJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 13:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjAVSuI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 13:50:08 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8610C15CB5
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 10:50:07 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id j9so7678429qvt.0
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 10:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtGz6veGCDMXzbMZ+e1jaEMhChKsjfdqTCiFmoZne70=;
        b=qy8Rb65zkAwiglpDOI7o+v37ZCOfv7g+srkC/xEIrunH8+D+qNQZjOLoyQLrF0NPgX
         F/KeRF0seZp4YYdvPrAh1WxE993QnFmqNmMr91017/XTlMgKadR1yQuOBCZtiGjxVlas
         40LEyPDvDIDFIrRQugcJgL3Z0Ot+CYnAvO8YeQSUsAqSgV8FNWstxGS9wPEYc9S0aWjw
         LN+RH0Eqw/0y6rwYUHe2ERAEG0FFd7C8inJVnyjdSA83oqcG9eF0hr2lSHkwHS782cD9
         WDGwzdPPhhhO+Du1AjsLKUYlrJVUYP+ckcLkRTfru5R/cYdOcO1gZJVr1BBiWr22734S
         pEwg==
X-Gm-Message-State: AFqh2koKJnAQTdc0rRBa+H1TUVHryl9n0mESVbhaWsla9oy9tNLBVhzE
        MhyIqk64ITa0pK5rYQIhZRjz+/wDBw1klw==
X-Google-Smtp-Source: AMrXdXubGKvvM81JARNYq/SW6dLsqaF08PX1ybf1lC6J83Ef3Cu+oTZB0oVXQjTKErqEm5mCqNabnQ==
X-Received: by 2002:a05:6214:5a8a:b0:4c7:7771:513d with SMTP id ln10-20020a0562145a8a00b004c77771513dmr30915900qvb.45.1674413406513;
        Sun, 22 Jan 2023 10:50:06 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id ay30-20020a05620a179e00b007090cad77c1sm5950893qkb.3.2023.01.22.10.50.05
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 10:50:06 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4a263c4ddbaso144622827b3.0
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 10:50:05 -0800 (PST)
X-Received: by 2002:a0d:cbd7:0:b0:46f:bd6:957d with SMTP id
 n206-20020a0dcbd7000000b0046f0bd6957dmr2155602ywd.383.1674413405515; Sun, 22
 Jan 2023 10:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20230112035529.13521-1-schmitzmic@gmail.com> <20230112035529.13521-3-schmitzmic@gmail.com>
 <CAMuHMdUfBkvwME1wNnaMscXA0k9qBrHVi7M8ppkyaJLSiU8S7Q@mail.gmail.com> <27f3da39-ed14-33ac-ebba-4e8291b23d7e@gmail.com>
In-Reply-To: <27f3da39-ed14-33ac-ebba-4e8291b23d7e@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 22 Jan 2023 19:49:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXV94-eUT4Xyv0f5WUTRhDngNv6RqDsutUVsMx54qf-kw@mail.gmail.com>
Message-ID: <CAMuHMdXV94-eUT4Xyv0f5WUTRhDngNv6RqDsutUVsMx54qf-kw@mail.gmail.com>
Subject: Re: [PATCH v13 2/3] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Jan 22, 2023 at 7:12 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 23/01/23 05:37, Geert Uytterhoeven wrote:
> > On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> Add secure_computing() call to syscall_trace_enter to actually
> >> filter system calls.
> >>
> >> Add necessary arch Kconfig options, define TIF_SECCOMP trace
> >> flag and provide basic seccomp filter support in asm/syscall.h
> >>
> >> syscall_get_nr currently uses the syscall nr stored in orig_d0
> >> because we change d0 to a default return code before starting a
> >> syscall trace. This may be inconsistent with syscall_rollback
> >> copying orig_d0 to d0 (which we never check upon return from
> >> trace). We use d0 for the return code from syscall_trace_enter
> >> in entry.S currently, and could perhaps expand that to store
> >> a new syscall number returned by the seccomp filter before
> >> executing the syscall. This clearly needs some discussion.
> >>
> >> seccomp_bpf self test on ARAnyM passes 63 out of 89 tests.
> >>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k for-v6.3 branch.
> >
> >> --- a/arch/m68k/include/asm/syscall.h
> >> +++ b/arch/m68k/include/asm/syscall.h
> >> +static inline void syscall_set_return_value(struct task_struct *task,
> >> +                                           struct pt_regs *regs,
> >> +                                           int error, long val)
> >> +{
> >> +       regs->d0 = (long) error ? error : val;
> > I'll change this to "(long)error ?: val" while applying.
>
> Sure - could you also update the commit message that I forgot to change?
> It's 81 out of 94 tests now.

Np, will do so (tomorrow).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
