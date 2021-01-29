Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9805FC433E6
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 546E364DEC
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 20:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhA2UxS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 15:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbhA2Uw0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 15:52:26 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF53C06174A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 12:51:44 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id y5so9743753ilg.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mMkNpB7P7wAGZeelGpg3x5YT9WR7p90psVnGkZ1+cMI=;
        b=tf3Bddwgv9t9fxK9tg/yvd75F/KodcmXzau36lm2p8Shxwuvn/R/due/oPAfAukohu
         CidEl+RDPDSEhc9nAKSGBTK+cIMFEsZsOb7thH0pgEn0LJWSRylqOtNj9F2Atat+6evM
         hllUbgpv3RgDobsO0gru7aiJgDtJmU13WPl+fMDn2Fk7R25iiskMrX1pfLd/omznVclR
         BeXg+tJieTc8gCGfcG91Xfi0xm/btTUjpNi/19Fn3kBb4fbH7QULWOY0FQWheUlZDpjz
         muLa+dN0ynK2eF2qM2y9Gf+gFA5GPgPQfah62ujljUo0AAhXNTgX41zvo5FlIibLk1cO
         eRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMkNpB7P7wAGZeelGpg3x5YT9WR7p90psVnGkZ1+cMI=;
        b=ib4SkVuq6/uoNBrHc4WZMlaHw/6NxIwFgMJUMzGew0ElZpVK7TY7B/qLs3tyyfDMlD
         m/1Bih/RuYEKVaZAhf6aD0QOfvDVtpttUcYybPoCNtGeefrJsJQXxgYPSWnYCsOYNs2/
         cF1sL3lpd9V0G3xTkMyn1phMbwgEGtOsNj2sWELSaZ2tgp3QYiAb3pVtg4OlexX7iKgI
         GQcZd7WSjfUl/of+oDHvM9tnYQ2tOKr3DIWJg28gNy8HIYjBxD76Re8ga7ssduB6ZFx4
         0m7qPAJbPPHw0ySLdAl0LxMXLC2T+XX6uKwBmEBGSnzAtAGuSUuuwc9+Y2U0rlF3YRQU
         7Rwg==
X-Gm-Message-State: AOAM531DRGIcpswIB/oLS4etSuQtAWwJKSHGBtX2UFgbQhe4Sj3nkDco
        W2fKK4OBxMeOzfRtnArf6v/fkC2l13T/a1Ke4zUyjlurs4c2bg==
X-Google-Smtp-Source: ABdhPJw5Y5GTPIY1EISus1LdQ3B8aosCndj4hIpDKWbA8VFnRmkSAUW2Fj7uIN8KKLhwC/bnePlxrZV9SlFR+Ulem4c=
X-Received: by 2002:a05:6e02:cb:: with SMTP id r11mr5828814ilq.116.1611953503379;
 Fri, 29 Jan 2021 12:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20210129204528.2118168-1-yury.norov@gmail.com>
In-Reply-To: <20210129204528.2118168-1-yury.norov@gmail.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Fri, 29 Jan 2021 12:51:32 -0800
Message-ID: <CAAH8bW8cZYG0HxqVAK4HxZDP3abxkHXsqfhSzJ-amQ_S6yDY_w@mail.gmail.com>
Subject: Re: [PATCH 0/6] lib/find_bit: fast path for small bitmaps
To:     linux-m68k@lists.linux-m68k.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 29, 2021 at 12:45 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> Bitmap operations are much simpler and faster in case of small bitmaps, whicn
> fit into a single word. In linux/bitmap.h we have a machinery that allows
> compiler to replace actual function call with a few instructions if bitmaps
> passed into the function is small and its size is known at compile time.
>
> find_*_bit() API lacks this functionality; despite users will benefit from it
> a lot. One important example is cpumask subsystem, when NR_CPUS <= BITS_PER_LONG.
> In the very best case, the compiler may replace a find_*_bit() call for such a
> bitmap with a single ffs or ffz instruction.
>
> Tools is synchronized with new implementation where needed.

Sorry for the broken enumeration . If it's too confusing, please let me know
and I'll resend.
