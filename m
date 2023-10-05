Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB6E92702
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Oct 2023 14:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjJEOPO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbjJEONb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 Oct 2023 10:13:31 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF33272B4
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Oct 2023 00:04:39 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-59f7f2b1036so6968767b3.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Oct 2023 00:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696489475; x=1697094275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6mFdT5hm2mOqBvwHoxIz4JiKXhiI2jnJLJqeibpXmw=;
        b=Ip2q9R+TBz6rFMNMgd3Oe7eTQAKgRhDiYwiz4QEUi0AbruTBg40D3NqIzCoTRNjOc2
         kF0gOdA6hdYvb4bH4Tag0c5HkvisB1q+3anmkDGtSlE4Z+mYyHBQ7Lq+TB6HjILp+GZK
         HKBRw0moPtlxusvo0sXwrpyHs9MqZKVY/YE4jk5CAkJSilvrgvcJgT8wrhHs4l/I98Mk
         kvCtasHtNP5B5rHkD8sJBbwjLzJxWVcpWJeKYVMGt+En3Jk8s88JS5DYCEju29d7NMLz
         uCWrNJgcLNJ5VwbM9Y2L7StZw9uZq6TDMIl0/u8qDdGh5g4Qzxtn9cHKYD1tbgtSjipQ
         80eQ==
X-Gm-Message-State: AOJu0Yx0534ckZjoQlnA/T2l1OO5ZmMOX8y3cHO544IOs5GVHBY561Qu
        s+J+6rTG+tgs3R3oZ0+1NFGI+wkerBlBYg==
X-Google-Smtp-Source: AGHT+IHtALoaEpiNvqbjWX+EhCbjL3+GiWUcbhA7690TLoJ0Qza8EJHoCXH9GctbMykI8nWieytf/g==
X-Received: by 2002:a0d:cac5:0:b0:59f:5895:6e38 with SMTP id m188-20020a0dcac5000000b0059f58956e38mr5064970ywd.4.1696489475480;
        Thu, 05 Oct 2023 00:04:35 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id e5-20020a816905000000b00585f60e970esm314294ywc.134.2023.10.05.00.04.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 00:04:35 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59b5484fbe6so7065867b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Oct 2023 00:04:35 -0700 (PDT)
X-Received: by 2002:a0d:e001:0:b0:59e:7fc1:dba0 with SMTP id
 j1-20020a0de001000000b0059e7fc1dba0mr4153189ywe.44.1696489474923; Thu, 05 Oct
 2023 00:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230913071350.1939818-1-gerg@kernel.org> <CAMuHMdXT6+UfUY_1GKefQ7-9a+a1QcX7spBJk6+qY6yUXyNQkA@mail.gmail.com>
 <f9dc98e1-83b0-4345-b4e8-f833f0e73e58@linux-m68k.org>
In-Reply-To: <f9dc98e1-83b0-4345-b4e8-f833f0e73e58@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Oct 2023 09:04:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7yi-qmNh=CqCc8-O1u3Kj89kC--P66N8-tH3ombPPrg@mail.gmail.com>
Message-ID: <CAMuHMdW7yi-qmNh=CqCc8-O1u3Kj89kC--P66N8-tH3ombPPrg@mail.gmail.com>
Subject: Re: [PATCH] m68k: use kernel's generic libgcc functions
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Thu, Oct 5, 2023 at 2:49 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 5/10/23 00:52, Geert Uytterhoeven wrote:
> > I guess we can select GENERIC_LIB_MULDI3 if CPU_HAS_NO_MULDIV64
> > and clean up arch/m68k/lib/muldi3.c, too?
>
> Yes, that is true.
>
> I was hoping we might be able to do something a little more clever.
> The common muldi3.c is almost identical except our local macro for
> umul_ppmm(). But looking at the common lib/muldi3.c code it has been
> setup to handle an arch local definition of that. I didn't spend too much
> time looking at it yet, not sure where we could put that for the whole
> mechanism to work though.

For floating point, there are <math-emu/soft-fp.h> and <asm/sfp-machine.h>,
but abusing that for integer feels wrong.

'git grep "#\s*define\s*umul_ppmm"' shows there are already plenty of
definitions for umul_ppmm(), so moving these to arch-specific header
files can clean that up in the process.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
