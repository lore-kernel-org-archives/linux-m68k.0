Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385C6C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Jan 2022 07:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349286AbiALHzk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 02:55:40 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:40876 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348632AbiALHzi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Jan 2022 02:55:38 -0500
Received: by mail-ua1-f50.google.com with SMTP id v12so3191075uar.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jan 2022 23:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxRXtvjLv5dyZ8SH85L5LQavbuogqUJq1KHgO/SS6/I=;
        b=K08sLwXtVji3CKzqWpDhyj8QQ5LQqVUYNze1ljQ7792UtsRVYHMwYOGYZGQqv3DZ22
         Krgcowz4tII/jnezzgA4cApeZokOlvjuLVuyLg6wAidPRplzwu9xNtzq0PkeUYLK0Dcv
         TZsj1ZV6d4t9mtWZp0F0ZYM2H1daY1IvntLPN2XUbLKbKKNtAt4IiojajIzmI+PeiZum
         TZZuhQfnLqW50jwhZ9HAsB04szA9SYXWfL/riKhQl6cDCcwFB5hPeURkSbAdEsrVzD7w
         rlNeE9i8H+KzPwGvZtbouXtEQxVhOSFSdRUV88J3BAWI3BOkGiT8SDXz5O05U1NKL53l
         CP7Q==
X-Gm-Message-State: AOAM530oRCIq/MbVAcrCKHjevbMVog8MxhtKlyZ/BwJZUhMdMtV5RE9t
        biWQgJj9UxVYSc2IGMuEsyIOJ8YXEJnsww==
X-Google-Smtp-Source: ABdhPJwbzzYj2TfIqCCkz0lrxESueo9hap/QV4P1mD31oIbiMDn4cSAp71TR+DpCAYi47o7AAlyH9w==
X-Received: by 2002:a05:6102:3f07:: with SMTP id k7mr3768961vsv.13.1641974137227;
        Tue, 11 Jan 2022 23:55:37 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id m8sm6757365uae.8.2022.01.11.23.55.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 23:55:36 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id n12so1091196vkc.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jan 2022 23:55:35 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr3790303vkb.33.1641974135789;
 Tue, 11 Jan 2022 23:55:35 -0800 (PST)
MIME-Version: 1.0
References: <87r19opkx1.fsf_-_@email.froward.int.ebiederm.org>
 <20220103213312.9144-8-ebiederm@xmission.com> <CAMuHMdWsNBjOJh0QEx9sppA9x3WoL8H2icqukNqECFhOPremjw@mail.gmail.com>
 <YdxcszwEslyQJSuF@zeniv-ca.linux.org.uk> <CAMuHMdX9nhUQe_jeQCUtXeQgcQ5MBiHpPiRexh86EssoHNtJ3Q@mail.gmail.com>
 <acf7b627-2dec-c76c-2aa0-6b4c6addd793@gmail.com> <d660267-ce4f-e598-9b40-5cdbb4566c7@linux-m68k.org>
 <6060f799-d0c5-e4c2-a81c-2bd872ce3d5a@gmail.com>
In-Reply-To: <6060f799-d0c5-e4c2-a81c-2bd872ce3d5a@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jan 2022 08:55:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJLfOKk-+gMbzVvG50vn8RBVsCdJAaysYWph01Ef-WrA@mail.gmail.com>
Message-ID: <CAMuHMdXJLfOKk-+gMbzVvG50vn8RBVsCdJAaysYWph01Ef-WrA@mail.gmail.com>
Subject: Re: [PATCH 08/17] ptrace/m68k: Stop open coding ptrace_report_syscall
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Jan 12, 2022 at 1:20 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 12.01.2022 um 11:42 schrieb Finn Thain:
> > On Tue, 11 Jan 2022, Michael Schmitz wrote:
> >>> In fact Michael did so in "[PATCH v7 1/2] m68k/kernel - wire up
> >>> syscall_trace_enter/leave for m68k"[1], but that's still stuck...
> >>>
> >>> [1]
> >>> https://lore.kernel.org/r/1624924520-17567-2-git-send-email-schmitzmic@gmail.com/
> >>
> >> That patch (for reasons I never found out) did interact badly with
> >> Christoph Hellwig's 'remove set_fs' patches (and Al's signal fixes which
> >> Christoph's patches are based upon). Caused format errors under memory
> >> stress tests quite reliably, on my 030 hardware.
> >>
> >
> > Those patches have since been merged, BTW.
>
> Yes, that's why I advised caution with mine.
>
> >
> >> Probably needs a fresh look - the signal return path got changed by Al's
> >> patches IIRC, and I might have relied on offsets to data on the stack
> >> that are no longer correct with these patches. Or there's a race between
> >> the syscall trap and signal handling when returning from interrupt
> >> context ...
> >>
> >> Still school hols over here so I won't have much peace and quiet until
> >> February.
> >>
> >
> > So the patch works okay with Aranym 68040 but not Motorola 68030? Since
>
> Correct - I seem to recall we also tested those on your 040 and there
> was no regression there, but I may be misremembering that.
>
> > there is at least one known issue affecting both Motorola 68030 and Hatari
> > 68030, perhaps this patch is not the problem. In anycase, Al's suggestion
>
> I hadn't ever made that connection, but it might be another explanation,
> yes.
>
> > to split the patch into two may help in that testing two smaller patches
> > might narrow down the root cause.
>
> That's certainly true.
>
> What's the other reason these patches are still stuck, Geert? Did we
> ever settle the dispute about what return code ought to abort a syscall
> (in the seccomp context)?

IIRC, some (self)tests were still failing?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
