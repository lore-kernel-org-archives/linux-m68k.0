Return-Path: <SRS0=k2IZ=B5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF115C433E1
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Aug 2020 08:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D43ED207FF
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Aug 2020 08:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgHSIqB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Aug 2020 04:46:01 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43112 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgHSIqA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Aug 2020 04:46:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id r21so18429120ota.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Aug 2020 01:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdMqBN+JWRM3G+IheoRLVYzYd5VMn/6BP5p9HfMMJL0=;
        b=NiDpDxg+7GBM3pRzbOmYY09rPXsKfoBMSouTwulFlKBr4JgaF2/yjx7/xo2d4/HBzq
         Dfb7QtVmaSZUmOYEM3bmH95ZEOqsIO8qP0I8oBJoR+qbAET/zDKt8mDk2hVh4hJ60SOH
         OJTqZVmZgiGcQWsdPpzp+HboY7AcfatQ8I7Lag59CEAOtqA3HogJyCvMmAqat+5H+yh9
         hZtgcd7AbUvTqXybVS0b0w1R7K/Ei5w4MIs51QRSLjnEHzNyhxA/ImprUNd8nvb3wxlm
         k5NZz/JY9Twd93EXcpJk2ZxdJHi6DLRBAUWEWJjT/qmxudhxtKXKevaSyDFcaC8+Nbxo
         NkcA==
X-Gm-Message-State: AOAM532jAGJjA/iwpdN1975nIQrg/sIMQU+5cfgYOK6nIFQR/YoYHymm
        n8REn103eDMSYk+SR4wcvLw05BUJD/gotldNoEQ=
X-Google-Smtp-Source: ABdhPJxffhcpNuckQ4mnV1k375oB5tRtMtmjGJuWn9QXsoz5JxTE5b8Ui9kNypxBpadfClKdMNUuL/i01XobtQhnI0M=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr16575680ote.107.1597826759120;
 Wed, 19 Aug 2020 01:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200818173411.404104-1-christian.brauner@ubuntu.com> <20200818173411.404104-5-christian.brauner@ubuntu.com>
In-Reply-To: <20200818173411.404104-5-christian.brauner@ubuntu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Aug 2020 10:45:47 +0200
Message-ID: <CAMuHMdUPtAT_b72WT_SYWr-M7uq=RucgnbJghTUj+YU8PVdcYQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] m68k: switch to kernel_clone()
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Christoph Hewllig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Stafford Horne <shorne@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kars de Jong <jongk@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>,
        Greentime Hu <green.hu@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Xiao Yang <yangx.jy@cn.fujitsu.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        kgdb-bugreport@lists.sourceforge.net,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Aug 18, 2020 at 7:37 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
> The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
> The latter adheres to naming conventions for kernel internal syscall helpers.
>
> Cc: Kars de Jong <jongk@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
