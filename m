Return-Path: <SRS0=gqU9=6E=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9958AC54FCC
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Apr 2020 07:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AC642078A
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Apr 2020 07:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTHR2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Apr 2020 03:17:28 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38859 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgDTHR2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Apr 2020 03:17:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id q9so586794otf.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Apr 2020 00:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G3napZOIiOeELwzchvRdOdrsSpD1AM8O7v/VEufzELY=;
        b=OUg68jJ5d+U+vHDSkiqZTHFtWOcadQCcA7iBg7HrhN0zpSwFXELcgwqGai+JmjWU4G
         rOVzUWGG6bVHuZKkQcwBCzsg24CEpYe94HRNWwbu8dHkfkPyU4b+YMmqXqzSS/pBedc/
         vNAvyyhjyKksZ7/G7bn1RsLMDUfK41vdOp33Lc6e1lJ7ZpDtCyaxuO7sVZC9V1MHccha
         ugygcIPDN7zQOxKqzFoNvmnjLtpJ01KEEIV7iKg4exFVQfzSEJsvihOn5vnJADQTDotJ
         GOuNMb4cqHe9gW5eJ0Yz2q1IUygUgPKWcF4ZizxNaTaYBmeaeKqQjWtEx7wnbqQmx7ew
         JC6g==
X-Gm-Message-State: AGi0PuY7CGzTILKjKGvCF4gf7pDqRIDSCOpf9NV/YbUUBNt5QCjO0IMu
        bcsOHopDZcUK6Tg3Zb/dk6XUhoIUYuHlUwmCh6U=
X-Google-Smtp-Source: APiQypL3yJvEJ1ORa0rBSqiAogEf52f1uzA/DePnuFLo6bfN15Rej0ftXMj/yihJTMnfOzKrMkt869r6j631tPhZOKY=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr4938576ots.250.1587367047061;
 Mon, 20 Apr 2020 00:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585264062.git.gustavo@embeddedor.com> <14ff577604d25243c8a897f851b436ba87ae87cb.1585264062.git.gustavo@embeddedor.com>
In-Reply-To: <14ff577604d25243c8a897f851b436ba87ae87cb.1585264062.git.gustavo@embeddedor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Apr 2020 09:17:15 +0200
Message-ID: <CAMuHMdW4f-sPPY9sOU-xdVJ-0zsix4wcMTxUz48GopqnWDVTAg@mail.gmail.com>
Subject: Re: [PATCH 2/2][next] m68k: amiga: config: Mark expected switch fall-through
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Mar 27, 2020 at 12:25 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Mark switch cases where we are expecting to fall through.
>
> This patch fixes the following warning (Building: allmodconfig m68k):
>
> arch/m68k/amiga/config.c: In function ‘amiga_identify’:
> ./arch/m68k/include/asm/amigahw.h:42:50: warning: this statement may fall through [-Wimplicit-fallthrough=]
>  #define AMIGAHW_SET(name) (amiga_hw_present.name = 1)
>                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~
> arch/m68k/amiga/config.c:223:3: note: in expansion of macro ‘AMIGAHW_SET’
>    AMIGAHW_SET(PCMCIA);
>    ^~~~~~~~~~~
> arch/m68k/amiga/config.c:224:2: note: here
>   case AMI_500:
>   ^~~~
>
> Replace the existing /* fall through */ comments and fix the issue above
> by using the new pseudo-keyword fallthrough;
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.8 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
