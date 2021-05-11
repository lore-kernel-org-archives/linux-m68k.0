Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB88EC433B4
	for <linux-m68k@archiver.kernel.org>; Tue, 11 May 2021 12:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACF5461622
	for <linux-m68k@archiver.kernel.org>; Tue, 11 May 2021 12:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhEKMS2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 May 2021 08:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhEKMS1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 May 2021 08:18:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7105C06174A
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 May 2021 05:17:18 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x188so15933969pfd.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 May 2021 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oop2Ovp8EWOv+egH128OBsTcETSDonZFH/twdK2VyXQ=;
        b=CEz0RXbjwosGhH8hdR9o1C73Do4+xBRNtm/XvgetWpHK68FX2KTg+3wIg7/4SQR/L+
         7tdHgPWm5xG7gDh/iwRfrTZQdkDg4akoHewRUxXLhDzgG6vxiaY5Qo/89g9Pd9zEIwKu
         KCXXWabShDlt64TYCyGgQaMNImmytPy0uC6r242U3Ak9w7oR8iuvlhzqhP90BwdBmK2L
         lLrfLTLR2iCLAfAPQE2JmseVHupO/rmfGDWh/FjRLSMEzjtDsO3gtDDTz7o75v9uAoc9
         C9A8/mcK3UxZIgpR2/cW9B9f/OVj4A9LeNDzrTP4cQd/VH7t84+J7+9PzZi51rRVID+U
         Qhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oop2Ovp8EWOv+egH128OBsTcETSDonZFH/twdK2VyXQ=;
        b=pagaPOsYqVYpMq5czEy2gIZYfn+33BpHCbh/uNcK8xJSUGd2o/XZjZrO8mT+//5NkN
         A0Guyiqft+bfobu+WvallgPIP1eBU0ZNMK3lIqOce4Pntt0SlVX9r2ghioytVApYZGwb
         AF1S418Pmy/J1QGGJVSa7Ec6mgvSNm68l5j3FIJWbiswDWfIjXfU0M22SBf27PcAxrvx
         j4yXjvrevrH5wcA+UDMuYmlijlgKnmVFqJYGIwyrsvt60YtqgHt4uYhACJ5+uSHH5PRy
         HDSXk0dtn9KO1buquua/gFjIAM8FnDSCW8pjuKjPvakdF4gBx5QN9h2Paj5YwiQWamzM
         tL7Q==
X-Gm-Message-State: AOAM532NLVecV+x+anzsfanZyGS8xDWBXmD8sWM0PDeLmRnyD+Qh8OvH
        JgVWQSc8zE4rlHxJG8i8KrGiTpcsBC3+sgmVWa8=
X-Google-Smtp-Source: ABdhPJyVcbgqCaK23waa0/SMpPauuLaNO44XEidyEsBXv9sGVkGIp3uAGlSgcIvjQbj0U3XNk2TS5nfqmHHxZMXWIzg=
X-Received: by 2002:a63:4145:: with SMTP id o66mr7680949pga.4.1620735437892;
 Tue, 11 May 2021 05:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210401003153.97325-1-yury.norov@gmail.com> <20210401003153.97325-12-yury.norov@gmail.com>
 <1ac7bbc2-45d9-26ed-0b33-bf382b8d858b@I-love.SAKURA.ne.jp>
 <CAHp75Vea0Y_LfWC7LNDoDZqO4t+SVHV5HZMzErfyMPoBAjjk1g@mail.gmail.com>
 <YJm5Dpo+RspbAtye@rikard> <YJoyMrqRtB3GSAny@smile.fi.intel.com> <YJpePAHS3EDw6PK1@rikard>
In-Reply-To: <YJpePAHS3EDw6PK1@rikard>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 May 2021 15:17:01 +0300
Message-ID: <CAHp75VdVubL-_kLV80Z9cVDpjYb_HT4ivw3t-QUj0594whL=wQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] tools: sync lib/find_bit implementation
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Yury Norov <yury.norov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Alexey Klimov <aklimov@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
        Dennis Zhou <dennis@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jianpeng Ma <jianpeng.ma@intel.com>,
        Joe Perches <joe@perches.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rich Felker <dalias@libc.org>,
        Stefano Brivio <sbrivio@redhat.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 11, 2021 at 1:36 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:
>
> On Tue, May 11, 2021 at 10:28:50AM +0300, Andy Shevchenko wrote:
> > On Tue, May 11, 2021 at 12:51:58AM +0200, Rikard Falkeborn wrote:
> > > On Mon, May 10, 2021 at 06:44:44PM +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > Does the following work for you? For simplicity, I copied__is_constexpr from
> > > include/linux/minmax.h (which isn't available in tools/). A proper patch
> > > would reuse __is_constexpr (possibly refactoring it to a separate
> > > header since bits.h including minmax.h for that only seems smelly)
> >
> > I think we need to have it in something like compiler.h (top level). Under
> > 'top level' I meant something with the function as of compiler.h but with
> > Linuxisms rather than compiler attributes or so.
>
> Right. Will you send a patch, or do you want me to?

Please, go ahead!
I'm in a vacation mood (tomorrow it will start)

> It would be good to get confirmation that __is_constexpr solves the
> build failure.

-- 
With Best Regards,
Andy Shevchenko
