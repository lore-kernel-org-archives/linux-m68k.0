Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98595C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 20:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjB0UTW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 15:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjB0UTW (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2023 15:19:22 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DF922023
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 12:19:20 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id ks17so5337146qvb.6
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 12:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqfB6u4DulnSRVK0e+Fw2bg14tKlwvVd1CLMbThZ798=;
        b=xt2MGwabxsi2FP0e4dngx26Tor3mi3oQ7yq08HHNgO6ILeZ0osc2BqRmyIKQ6Qy6Pi
         R5RPOJXsvh7hQRtQMwqXIhXSN6TbNYK8xJoI7zwqspgA+38dfURz74YY0trudKRdmBBx
         Jn7HahT55mf9YCY5nGSz345gWlZlpqPMTtDkRx3kAvoXxLZcZbrlAIy6ZgFhZrtM2p3B
         NHT2gtVJoCm/Gr96L29FUkXwGB4jGX2F7nXzKRdgzyZE+q8b6pX0JjotQHepPVrE39vv
         SnVqvCmZjl8q56fFqLEnkm//JbHjzPlsNeLQD1ILIN5soMtPH0Ab1JrU6rJs0vpzKILz
         tMHw==
X-Gm-Message-State: AO0yUKWcb294WdcUOnQuq7UpuajeWpfPO3ZzVdg8f0McSOym1myaBDl/
        SkF88RyC44jvuAPJ4K9aqbOylVyrh3Z6ew==
X-Google-Smtp-Source: AK7set+SiyNc7e8hI/XV5O0GlxiiqiUpPhWYou2kgqg+a8UOBr7gNHlrzzlmfw+RDmyJAQzDxFkfRw==
X-Received: by 2002:a05:6214:e89:b0:56f:728:19d4 with SMTP id hf9-20020a0562140e8900b0056f072819d4mr1370127qvb.26.1677529159802;
        Mon, 27 Feb 2023 12:19:19 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 70-20020a370449000000b00741a984943fsm5457818qke.40.2023.02.27.12.19.18
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:19:19 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-53852143afcso210344837b3.3
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 12:19:18 -0800 (PST)
X-Received: by 2002:a5b:d46:0:b0:a67:c976:c910 with SMTP id
 f6-20020a5b0d46000000b00a67c976c910mr3314364ybr.7.1677529158660; Mon, 27 Feb
 2023 12:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20230222195021.6683-1-schmitzmic@gmail.com>
In-Reply-To: <20230222195021.6683-1-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Feb 2023 21:19:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
Message-ID: <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Feb 22, 2023 at 8:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> __get_kernel_nofault() does copy data in supervisor mode when
> forcing a task backtrace dump through the sysrq trigger.
>
> Our 030 bus error handler is ill equipped to deal with this:
>
> Whenever ssw indicates a kernel mode access on a data fault,
> we don't even attempt to handle the fault and instead send
> a bus error signal (or panic). As a result, the check for
> exception handling at the fault PC (buried in send_sig_fault()
> which gets called from do_page_fault() eventually) is never
> used.
>
> Both 040 and 060 access error handlers do not care whether
> a fault happened on supervisor mode access, and will call
> do_page_fault() even on those.
>
> Add a check in bus_error030 to call do_page_fault() in case
> we do have an entry for the fault PC in our exception table.
>
> Tested on 030 Atari Falcon.

Thanks for your patch!

> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com># Please enter the commit message for your changes. Lines starting

Please remove the comment ;-)

> CC: Eero Tamminen <oak@helsinkinet.fi>
> CC: Finn Thain <ftain@linux-m68k.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> CC: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi

404

I assume that a message from debian-68k?
Do you have a https://lists.debian.org/debian-68k/ link?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
