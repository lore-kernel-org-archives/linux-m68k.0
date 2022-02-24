Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B46C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Feb 2022 09:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiBXJ5F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Feb 2022 04:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiBXJ46 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Feb 2022 04:56:58 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4939B28ADA1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:56:22 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id d26so1576985vsh.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UaaU3qYErVihNgxgJw4SHNwOEGx/UhY/ytg286+tR04=;
        b=PqWjvPJWo/2BaphW+2txNxOrWCITE1zT4VbQIhRME+YYBFQ9izMeVOCCAdt3uP0vzn
         C7t1ruenqr4itXKuewqEkNik9zpv9n2ZBPFIRyENMyXgIwOJ01061FlW2oHI0DolCGaP
         bnDb2lhF/vSD4p9bzepDViCdEa+PZscKBjmusUiYSVZPz/FhtBAHU/bPTs3qEVvMhlZq
         33CndukxmNdOGrAzBIxKErf+TkIhLQXMHjLTILWGNkCpaC/thy1R1HqU8go0SQ93wuEw
         2QEswgTgqGT67YhnWoiAzm02vmgzwSAX7CgB4o3sYw8qbLkPyKls+afKeJ9bS1zj3Kjc
         yegw==
X-Gm-Message-State: AOAM531WdXwzNQTyZfFvdPHB/oYXDJ3HzTA3kKxqIecruRig+q+IqjSI
        zXYyDl4LxgyWBtabw3lK9cyE4q6X7CvdyA==
X-Google-Smtp-Source: ABdhPJzOIwpApWAW5zd3w+a0VckuAbVVnYxx//XzFS0R+vTvAgWAbk5cn2x/Be9HRzs4Dh1sASlxfg==
X-Received: by 2002:a67:ecc6:0:b0:31c:33d2:8f6b with SMTP id i6-20020a67ecc6000000b0031c33d28f6bmr867249vsp.46.1645696581324;
        Thu, 24 Feb 2022 01:56:21 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id j24sm322196vki.39.2022.02.24.01.56.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:56:21 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id c23so620502uaq.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 01:56:21 -0800 (PST)
X-Received: by 2002:a9f:360f:0:b0:341:8a12:8218 with SMTP id
 r15-20020a9f360f000000b003418a128218mr737932uad.14.1645696580955; Thu, 24 Feb
 2022 01:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20220224060448.1856091-1-keescook@chromium.org>
 <CAMuHMdVioQLy_T2LimgWdfWM=j=fomfpayuS1mbXnBLZj4gGQA@mail.gmail.com>
 <d75f1259c3e64387a161ebcb0448d594@AcuMS.aculab.com> <CAMuHMdWtQ+B-01ZOwZNvgQ7pndNsP3V90_jHdR=RS4K7O3Vk9g@mail.gmail.com>
 <95b9c3e8227a4892b26cc0384d1782c2@AcuMS.aculab.com>
In-Reply-To: <95b9c3e8227a4892b26cc0384d1782c2@AcuMS.aculab.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:56:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6msvi0j=mS28GFYbm+uMRk7PkYe+zOM4sDmOVxeibLQ@mail.gmail.com>
Message-ID: <CAMuHMdU6msvi0j=mS28GFYbm+uMRk7PkYe+zOM4sDmOVxeibLQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement "current_stack_pointer"
To:     David Laight <David.Laight@aculab.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi David, Kees,

On Thu, Feb 24, 2022 at 10:54 AM David Laight <David.Laight@aculab.com> wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 24 February 2022 09:17
> >
> > On Thu, Feb 24, 2022 at 10:12 AM David Laight <David.Laight@aculab.com> wrote:
> > > From: Geert Uytterhoeven
> > > > Sent: 24 February 2022 08:59
> > > ...
> > > > > +register unsigned long current_stack_pointer __asm__("sp");
> > > >
> > > > I don't know what HARDENED_USERCOPY does, so I don't know if you need
> > > > "usp" (see rdusp()) or "sp"?
> > >
> > > HARDENED_USERCOPY significantly slows down some systems calls
> > > (especially things like sendmsg()) by trying to run-time verify
> > > that the kernel buffer doesn't overrun a stack frame or kmalloc()ed
> >
> > Kernel stack frame of user stack frame?
>
> Kernel, the kernel doesn't care if the user stack gets trashed.

OK.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Kees: Do you want me to queue this in the m68k for-v5.18 branch, or do
you want to take it yourself, together with the HARDENED_USERCOPY work?
In case of the latter:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please let me know. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
