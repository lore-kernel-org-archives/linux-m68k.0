Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A595C4332F
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Nov 2022 08:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiKHIkN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Nov 2022 03:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKHIkM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Nov 2022 03:40:12 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC192DFE
        for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Nov 2022 00:40:08 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id z6so8307197qtv.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Nov 2022 00:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tFUsRL3FpgdBzxiQy/rXwlRUGlmMU62XkzHAixYMBY=;
        b=kJ2iXFqR5ZNxjnWNGjZBOARChooBhun6971FaHgUL97kJmWeIT75mam5SN59snkxn5
         +NT3+R9kouVHTHyJRnDt7ri0CXLugf/Ux8qM5gnlmwWeBY/YCbMJcEH02Ot/L8000IbS
         kEo5U0dtRYhUNIFbkvNAUn7JLt2VkAHzIFZR1X20PO6o6gCN5hGMIwZjHLgUoFH9lNOP
         JND5QcmUCZwaH+XOV/yFny/fYtUKS6rdzePzc/on8ppmltDLobfiOg8NtztZ8gfhh1HM
         hDx7kSIGbkDsVcxAJ6eAVL4Shwy/kjqIzb2xAzcZsVWs4H2aX98lOvvBMeZpWrXpz8HW
         uBlg==
X-Gm-Message-State: ACrzQf2c8ASpUbpvW3W4cZRldKPDOlPobynUTrEWIlC/XB+xWQklSL5Z
        eAvng4uWdSF5nI7NwsReEO46qnvsj+EX2K7G
X-Google-Smtp-Source: AMsMyM4MWEQFjmCCSUsg4LO86GPn3HOYk60VWIBGrE8LUgwTrUniY5Hyp9B6VgJRBTzTB2W0X5QQDw==
X-Received: by 2002:ac8:4916:0:b0:3a5:283b:22c7 with SMTP id e22-20020ac84916000000b003a5283b22c7mr34964617qtq.64.1667896807596;
        Tue, 08 Nov 2022 00:40:07 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id u127-20020a379285000000b006faeecef56fsm3213754qkd.68.2022.11.08.00.40.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 00:40:06 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id o70so16546297yba.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Nov 2022 00:40:05 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr41313897ybc.89.1667896805081; Tue, 08
 Nov 2022 00:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20221107141638.3790965-1-john.ogness@linutronix.de> <20221107141638.3790965-25-john.ogness@linutronix.de>
In-Reply-To: <20221107141638.3790965-25-john.ogness@linutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Nov 2022 09:39:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEZ2pKM=RJu1NuVarsPSuOw1=R2E6OVQpeO0TqC2tMrA@mail.gmail.com>
Message-ID: <CAMuHMdUEZ2pKM=RJu1NuVarsPSuOw1=R2E6OVQpeO0TqC2tMrA@mail.gmail.com>
Subject: Re: [PATCH printk v3 24/40] tty: nfcon: use console_is_registered()
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

Hi John,

On Mon, Nov 7, 2022 at 3:16 PM John Ogness <john.ogness@linutronix.de> wrote:
> Currently CON_ENABLED is being (mis)used to identify if the console
> has been registered. This is not reliable because it can be set even
> though registration failed or it can be unset, even though the console
> is registered.
>
> Instead, use console_is_registered().
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
