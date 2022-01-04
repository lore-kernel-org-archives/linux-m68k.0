Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A85C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Jan 2022 02:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiADC3j (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Jan 2022 21:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiADC3j (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Jan 2022 21:29:39 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05744C061761
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Jan 2022 18:29:38 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id j83so85190200ybg.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Jan 2022 18:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwE8JmVaZMVjGKtYTKzHg5oYnNTcXLM3eaPcCyNjzP0=;
        b=clKFPcLbJzKiUhKx+beJMiRJztw8LmSWxSvsesJ0+aN7u4+UHuNYrFIQv0lmrTOeTt
         450lXNQn9XcybOpCzfzJkYil2anwiKGEbydTQeDQrph925qvo+gZi2ghUQcQUEUL9ggN
         hALWM0V5HzkcSppyWvgNIN6DA4k3SqOEPgJe11R4PQR5QdVUxUDcQKikNcAgjMgFRD3k
         adRNR92tpi0SFsDd5Dq0DSnc7hBjHi7tSd8mtIScOlGuhC6OqM1SeDk6EEqVOBz/LTql
         YQ2o8fAAa+rGWyJO3d12NH8nj2+uU0iR4byv5SWeVcTOiRlvOYb06p9geGIHKY3VHAxl
         z60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwE8JmVaZMVjGKtYTKzHg5oYnNTcXLM3eaPcCyNjzP0=;
        b=hj0TKPgy94S3g3KOMcAfd6l63+tJ2fw5xd/79Z7GrhFLvrmf9m9ZzpjgjpufO8ufcx
         WRwIwdIHrZYd/SCdMtOAqJRPexuFFwWdXIcp+dgAbSElqCEk3QmDskZ7yKv7SWlRvomo
         Hbh6KrXQY4s9+g+z51hYxXDBvqzvoT7v68rts1ByYyZ8xVsiW9Y+A3mEwB3RuSqrvWus
         4IjiNJV8evAdiW5lI3N2x5KfOL5TbeMTbkBsvyxdwqFvYwEsddShE2YPLY384dscGJ36
         5MwADFub44QzFcTz0RbEzxNMTME7DgbQfUJQ2830yObfkDt/9Gvu5AU/hzcmZoc6QnOk
         qfGA==
X-Gm-Message-State: AOAM533Tj9Y7Fgrl6gBv9MJ3sqcvTGCFVZEgUTYdQ4chqK9tc306/KuB
        hOnxVDqgVcdzY1+MKRpZ/dXN/86dByu6W/dARMo=
X-Google-Smtp-Source: ABdhPJyr9R2K20doWqMFSm6oR6rPxsWteustiBykGyvjhzMQp6Rz9gnbTshpV2L8bmCl5t76qWsavsVixU2lNGD4ekk=
X-Received: by 2002:a25:1344:: with SMTP id 65mr57529351ybt.468.1641263378140;
 Mon, 03 Jan 2022 18:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20211228020611.6582-1-hbh25y@gmail.com> <CAMuHMdXYuH6kgWCPjQhmd6Xi2N=oiyCSoE8U4NMg3tOrJ9bwDw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYuH6kgWCPjQhmd6Xi2N=oiyCSoE8U4NMg3tOrJ9bwDw@mail.gmail.com>
From:   Hangyu Hua <hbh25y@gmail.com>
Date:   Tue, 4 Jan 2022 10:29:27 +0800
Message-ID: <CAOo-nLK3Coda+YPqy1eH=MKyrm36kTG+Uj2KZ5NL-002STzMUg@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/kernel: array out of bound access in process_uboot_commandline
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi, I think this patch may be forgotten. So I send this e-mail. And I
cc Andreas
who helped me fix the initial version of this patch.

Happy new year.

On Tue, Dec 28, 2021 at 4:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> CC greg
>
> On Tue, Dec 28, 2021 at 3:06 AM Hangyu Hua <hbh25y@gmail.com> wrote:
> >
> > When the size of commandp >= size, array out of bound write occurs because
> > len == 0.
> >
> > Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> > ---
> >  arch/m68k/kernel/uboot.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> > index 928dbd33fc4a..63eaf3c3ddcd 100644
> > --- a/arch/m68k/kernel/uboot.c
> > +++ b/arch/m68k/kernel/uboot.c
> > @@ -101,5 +101,6 @@ __init void process_uboot_commandline(char *commandp, int size)
> >         }
> >
> >         parse_uboot_commandline(commandp, len);
> > -       commandp[len - 1] = 0;
> > +       if (len > 0)
> > +               commandp[len - 1] = 0;
> >  }
> > --
> > 2.25.1
