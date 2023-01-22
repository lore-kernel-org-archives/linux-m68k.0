Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4CC25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 16:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjAVQde (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 11:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjAVQdd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 Jan 2023 11:33:33 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954CDFF07
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Jan 2023 08:33:32 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id h24so4030792qta.12
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Jan 2023 08:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOk3uYZcgTwBo+UdwPSOR5TRv4+Ddg6DJyCWwBKpSKA=;
        b=IErLKnGbo5gUEIQcNBHAoxdV5BGSXkgSi4zQuk/QzNdwVPHXwZIzexwmaiI1L4DLsl
         lgkYf4hzvfJYfze/3mouWzJgBRemqXPCBjqvXg/9Nj+x+ZlRMM0mfu1du9Jg6Q9X7FKi
         8zJwpONiYXXmJ1fVONXDcbzM5EBi1GBKSxHT+iKeG26zRJ8hCbt1Gna5JLjDFmxqVTTk
         j1uDWYArI3EwvojUa8++vuyAEUGFPAS9NrJo0kyhXYkpMbouszdl4EPWBQNwh/ervFce
         YItFBty2ug9+aoP/qAHzvyiqLTqlAB6tYXFaz1FUbbgRfZnr1uVsyK3YBrRB0g0qBrvN
         lsJA==
X-Gm-Message-State: AFqh2ko0WagI2/y1UqdMvYS8VeRjaBuCO4wdSCw73ReInX3e97FvnjAQ
        4l35xsys/Sc+fUXXWsR423sDzmHsknVagQ==
X-Google-Smtp-Source: AMrXdXuqtDL1nD7n34sXNKP2/svGhRb6H4OnKKYII7UJFBLmDUul5TXKHhignN7Jas+Y5QfzT/qxlg==
X-Received: by 2002:ac8:5a95:0:b0:3b2:39ee:dcf3 with SMTP id c21-20020ac85a95000000b003b239eedcf3mr41774107qtc.25.1674405211488;
        Sun, 22 Jan 2023 08:33:31 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r3-20020ac87943000000b003a82562c90fsm9450996qtt.62.2023.01.22.08.33.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 08:33:30 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id t16so7537062ybk.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Jan 2023 08:33:30 -0800 (PST)
X-Received: by 2002:a25:d505:0:b0:7bf:d201:60cb with SMTP id
 r5-20020a25d505000000b007bfd20160cbmr1777981ybe.365.1674405210694; Sun, 22
 Jan 2023 08:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20220718105553.6529-1-gaoxin@cdjrlc.com>
In-Reply-To: <20220718105553.6529-1-gaoxin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 22 Jan 2023 17:33:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtD29w1Utw0VvAC1SrE47x-o+bOcp6=fOGsfWLQHBsUQ@mail.gmail.com>
Message-ID: <CAMuHMdWtD29w1Utw0VvAC1SrE47x-o+bOcp6=fOGsfWLQHBsUQ@mail.gmail.com>
Subject: Re: [PATCH] m68k:do not initialise statics to 0.
To:     gaoxin@cdjrlc.com
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xin,

On Mon, Jul 18, 2022 at 12:56 PM Xin Gao <gaoxin@cdjrlc.com> wrote:
> Delete static variables initialized to 0.
>
> Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -201,8 +201,8 @@ static int ccleirq=60;    /* ISA dev IRQs*/
>  #define DEBUG_Q40INT
>  /*#define IP_USE_DISABLE *//* would be nice, but crashes ???? */
>
> -static int mext_disabled=0;  /* ext irq disabled by master chip? */
> -static int aliased_irq=0;  /* how many times inside handler ?*/
> +static int mext_disabled;  /* ext irq disabled by master chip? */
> +static int aliased_irq;  /* how many times inside handler ?*/
>
>
>  /* got interrupt, dispatch to ISA or keyboard/timer IRQs */

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.3 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
