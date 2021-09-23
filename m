Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3601CC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10C5461216
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241806AbhIWOq4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:46:56 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:33622 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241752AbhIWOqz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:46:55 -0400
Received: by mail-vs1-f47.google.com with SMTP id 188so5777948vsv.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S3ucXHKaz0Rc++ad0uZxKyS05SChsJUfx3Hh2lMYmn4=;
        b=v4ADQvH4dnwbM0XxDoFfMMdIfppP8uzY0+HNgCs6nsQmCEQerwuhfAKG/M2nXWygmx
         v2x1cKf7vEE6TJakcoG4VbF0MDMPa/vtMcuW3ge/Ngp4ocmN3igI2m7fXuMX8iCfYTNz
         v/7SF8+iyBF0xhOJeJEBDfks+u9ihH2j7N37eGhPVzfOaSU1vS2VpfVHkaCStqpzYMsM
         k7j4uZeF0ocVzeBBR3Mayeeoj3j62Ljaqy1pELsUOL44TlYHGhcDBMkBOCNTumwLmRz0
         Pr1zfWzrM/pyTM/YhYegb4fFRLwgsDqgAmBGoB3exvEjZghCQpjvvj/XR5UTOiZQtXm3
         tmOA==
X-Gm-Message-State: AOAM533ImGl1VKwkkYvtELMWbewN3WAxnmLmCWRUo/tHRyAm2xRaOWAR
        jgFRtke0LbQK5BPftJte0rvM7WHbOfHkKemK4ww=
X-Google-Smtp-Source: ABdhPJycyPw0Z3wCTyupvlm6Je/yzgM2E9MAnxgje5sO6MKGsuy6PcrBBUp++1JNy3xgQ3TM3ZgYoOoHsUOwOzHhxhg=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr4390391vsl.37.1632408318973;
 Thu, 23 Sep 2021 07:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
In-Reply-To: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:45:07 +0200
Message-ID: <CAMuHMdU1DrwMAP4qRvK6tq5GV_c3bF5RmUR6ok2AqBXSbn7UBg@mail.gmail.com>
Subject: Re: [RFC][CFT] signal handling fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 25, 2021 at 7:18 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>         Back in 2012 or so I'd found a bunch of fun issues with multiple
> pending signals on a lot of architectures.  m68k looked scarier than
> usual (due to the combination of variable-sized exception frames with the
> way kernel stack pointer is handled by the hardware), but I'd convinced
> myself that it had been correct.
>
>         Unfortunately, I was wrong - handling of multiple pending signals
> does *not* work correctly there.

[...]

Thank you, queuing in the m68k branch as fixes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
