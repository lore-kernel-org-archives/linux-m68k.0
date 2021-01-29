Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E4AC433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 21:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D6D764E02
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 21:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhA2VNF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 16:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbhA2VNC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 16:13:02 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762D3C061573
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 13:12:22 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id f63so6995267pfa.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Jan 2021 13:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vg06EYb42M3hpCfx5u7kHIys3A9k6t2mg9qHTWyzE3w=;
        b=uss+hVCZDE3oRNcwh9eYfuy7m6VRQNYdgkoDVQImrhh57a/UlNuWWuuDgaosrP8ciq
         +DwO0j1ysvGh4cUVVQ9CYyYjHZ4DZPQB5CBsDqi9mO6wbebhs6alezYxQHCVQzW9IFek
         Rp06X5zmEh3kGZ8SkaurfmrsL/Lm8u5X/pl6pCXcjMXj/klvxIG7ISbTgElODiWfTVJv
         yEFrgh0LoPRyxL4VnNIwminFNaJVpY6Tvjl2Bnc7jIoqk7cItGHZzr/w39c+0dgAUC2A
         6jq/fWWg6kNZP3tfNSxGlO9oBcYqA0/FePKfkHG5v0QZFeMmCw5B0COX5RbUoovgO/MN
         zSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vg06EYb42M3hpCfx5u7kHIys3A9k6t2mg9qHTWyzE3w=;
        b=CUYioN0PR5GuD4QbbM1PGCGtIPAQ3YyydDxxKbI0t5t/4LTtwkNQo47TZpYea7y6Ku
         Nkjaalf14ouObzI9oGfQ0QpcQXJqV6ihf9VzlYH87jfxtBaLbHtViHOQZdlsje06Srrx
         /FF5Z1oAQ36We0X1Owp4nXu0v9soGJGI7XZV273P78AEllQElF5AKOJ3fTjauJNlW4g+
         SOwFbExuzJkuUvTY45CVzjftsDIH3EBWB+fGAPlvFkthIQ9N7WOsESLtYhQk/m4nZBlx
         EUUYQsCeAj4eqVDymSR0CcAq48m/P0IhMnB5XP0C3DI3US1KgAPg2KJCnml8LMfGIljQ
         L2zA==
X-Gm-Message-State: AOAM532t1RBjlehmWMqIzUJphYRXQN6mRMxB5b5LvJ6D9N7yAiy2wLpq
        8boF6OwoIvDyJ3gGS1H10P71BzUovjhvZtzvqu+3ozmh27VzYK2d
X-Google-Smtp-Source: ABdhPJzhasacDYoAPPOBBF8yQuC912YJpL6AW+IIK81jaA5iP/L3pxdDxPg5ljkrbUC+zNtJxfkDyiQtXR2kowiCXsE=
X-Received: by 2002:a63:fc56:: with SMTP id r22mr6374949pgk.203.1611954742023;
 Fri, 29 Jan 2021 13:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20210129204528.2118168-1-yury.norov@gmail.com> <CAAH8bW8cZYG0HxqVAK4HxZDP3abxkHXsqfhSzJ-amQ_S6yDY_w@mail.gmail.com>
In-Reply-To: <CAAH8bW8cZYG0HxqVAK4HxZDP3abxkHXsqfhSzJ-amQ_S6yDY_w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jan 2021 23:12:06 +0200
Message-ID: <CAHp75VdkMGBKnyq4B+cckDUGh0ag3bGq26_SJp-K=jQd43pP-Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] lib/find_bit: fast path for small bitmaps
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Fri, Jan 29, 2021 at 10:54 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Jan 29, 2021 at 12:45 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Bitmap operations are much simpler and faster in case of small bitmaps, whicn
> > fit into a single word. In linux/bitmap.h we have a machinery that allows
> > compiler to replace actual function call with a few instructions if bitmaps
> > passed into the function is small and its size is known at compile time.
> >
> > find_*_bit() API lacks this functionality; despite users will benefit from it
> > a lot. One important example is cpumask subsystem, when NR_CPUS <= BITS_PER_LONG.
> > In the very best case, the compiler may replace a find_*_bit() call for such a
> > bitmap with a single ffs or ffz instruction.
> >
> > Tools is synchronized with new implementation where needed.
>
> Sorry for the broken enumeration . If it's too confusing, please let me know
> and I'll resend.

Yeah, please resend with a bumped version and respective changelog.

-- 
With Best Regards,
Andy Shevchenko
