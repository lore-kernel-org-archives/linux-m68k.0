Return-Path: <SRS0=gnDg=36=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F53C352A3
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE2F020842
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Feb 2020 11:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgBJLRE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Feb 2020 06:17:04 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44237 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbgBJLRD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Feb 2020 06:17:03 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so5893770otj.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2020 03:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y0UD3fxGboZ2WyqDcVlDsabzbnFPIihaoicayUreTVg=;
        b=DFFXq85iM6Er44+gDWh6aoVpBdNlm3kF0r2BdSnAqQQlqyqeM+qzW7KvScQmm9Nlsv
         +fbKpnSO3EaID61c6tdvTpnUPx2W7R3izHXh8cUYK/XmJbJq8T4pbcxbFDsoesES2O3p
         BtpV9Wn2NArBxonarg2YIjKWo4uuGMy+U7+R3CKiJmlvfNzO5RZV5jAvFWQd4BBOEnc9
         9YbaNLXs+3YvxeJZt9dgXm60aHkMUdJamByXrF2DxWZZ5zNIqdQio4XPfLncDh8o2hPi
         OvQYj47b5Odncs15jWbL0MVafISfW0wX04QpWIPSaR0B7/RdJV73jOWe7vBWQySsDJxd
         lIog==
X-Gm-Message-State: APjAAAXtfrCdZR6zRm28kgpKCYfpwHp+R675bEp6xW8Dz6Ow7Gzsy3uq
        y+l8JbPT9OqROZ6VMl3u63fjTCVe/C6lo5LjMcg=
X-Google-Smtp-Source: APXvYqzCVs32bgURSBMbsg+6XDD8UyxECagk6yMxU+gW2aLQrlWpc/JTi5OUAALgcPW5fn/275L4Q79SRVMmdSOd8ok=
X-Received: by 2002:a05:6830:1d55:: with SMTP id p21mr657723oth.145.1581333423145;
 Mon, 10 Feb 2020 03:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20200112174854.2726-1-geert@linux-m68k.org> <55c34fc6-cac0-0c53-37d7-d46658a327fc@linux-m68k.org>
In-Reply-To: <55c34fc6-cac0-0c53-37d7-d46658a327fc@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 12:16:52 +0100
Message-ID: <CAMuHMdVeRYtrPHZ=CFPpStUwKwG6w69a-9KVWZPg2Te0wFqmJg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Switch to asm-generic/hardirq.h
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jan 13, 2020 at 2:59 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 13/1/20 3:48 am, Geert Uytterhoeven wrote:
> > Classic m68k with MMU was converted to generic hardirqs a long time ago,
> > and there are no longer include dependency issues preventing the direct
> > use of asm-generic/hardirq.h.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Looks good.
>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks, applied and queued for v5.7.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
