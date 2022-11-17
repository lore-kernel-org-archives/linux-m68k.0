Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A75CC4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Nov 2022 08:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239445AbiKQISq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Nov 2022 03:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239280AbiKQISo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 17 Nov 2022 03:18:44 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477DC13EAB
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Nov 2022 00:18:43 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id h24so631708qta.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Nov 2022 00:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwpyMGSESHvVxZeQSW3cOqgu6i5GkbRlc3ir09h31MM=;
        b=Y4qWeFfLSuVKqOr8ocnMY3vmwNG2hK0sZSuVJdWRHyA0wWkVDMp0sjSKHuGDpV2V2u
         cBZyb9+sAmksWDlziH4OKTPeNELXHV/kgN3iaogO6g+RH3enrDofy1ZIj31i/u7t1ssk
         5l/T2Ki+3gg/XxkC+FyWSRH2nB7ssNdMKcC1fefmK1lPoNWc0bFk+D2vPPjU5I5Od9sX
         wlon4oaWDfJzxWf0ekvujQWaxVCdnqP7RvLlYJrRYMEB/5wBB5vZ9SbhK9y90oxqhepL
         R93Pp9KNhsdDMyK32kufZU//A2/R4FxXgn9ULN/Lo6nMKPMbGr0+ri25QUtp7fqlJAIs
         BANQ==
X-Gm-Message-State: ANoB5pkjqemqXXemLkFjU+EznFv5SJbruQN9bgQ5owMT2xr4ybonOIja
        Yrcx4AeLvm1t2u2w3mYGPKN/YJrgQtia1A==
X-Google-Smtp-Source: AA0mqf6/brkSNudq0lRZVriXgz2jn0AhEwvKqlRx7l0WtUUxmO3DKN4JrCKUIGP01tHbYNozJCVPWA==
X-Received: by 2002:ac8:6bd8:0:b0:3a5:2105:677e with SMTP id b24-20020ac86bd8000000b003a52105677emr1282631qtt.127.1668673122142;
        Thu, 17 Nov 2022 00:18:42 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g24-20020ac87758000000b003a611cb2a95sm54599qtu.9.2022.11.17.00.18.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 00:18:41 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 7so980391ybp.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Nov 2022 00:18:41 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr1234957ybq.89.1668673120788; Thu, 17 Nov
 2022 00:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20221116162152.193147-1-john.ogness@linutronix.de> <20221116162152.193147-24-john.ogness@linutronix.de>
In-Reply-To: <20221116162152.193147-24-john.ogness@linutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Nov 2022 09:18:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEkrVJNdHsvM00a+97Vsk8VYvd_Mxa61GAcSi1gH8=uQ@mail.gmail.com>
Message-ID: <CAMuHMdWEkrVJNdHsvM00a+97Vsk8VYvd_Mxa61GAcSi1gH8=uQ@mail.gmail.com>
Subject: Re: [PATCH printk v5 23/40] tty: nfcon: use console_is_registered()
To:     John Ogness <john.ogness@linutronix.de>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 16, 2022 at 5:22 PM John Ogness <john.ogness@linutronix.de> wrote:
> Currently CON_ENABLED is being (mis)used to identify if the console
> has been registered. This is not reliable because it can be set even
> though registration failed or it can be unset, even though the console
> is registered. Use console_is_registered() instead.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
