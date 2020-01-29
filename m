Return-Path: <SRS0=o3Zs=3S=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AE4C2D0DB
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Jan 2020 18:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 202D4206D4
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Jan 2020 18:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FirLSuHe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgA2SwX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Jan 2020 13:52:23 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41927 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgA2SwX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Jan 2020 13:52:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id x8so245524pgk.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Jan 2020 10:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8T8iaT/9dcdgkVWV4KcYEe5+1niEPL2//rL6DhuX7E=;
        b=FirLSuHerGCJSe7z5FOZqzRomPN+EttEFvo2q1BiyKiqhfbS9rzxQFJP2SrJ+lrc8s
         XALXNrRRNsUUjXZn1VmAqFV0AC0nJJvZwFLbZwuNmZBlDHRc6IrxEU8Btm2gcTtdXZ3i
         RVBdAsWIGpk/T5vFUx6YoFE1LHWgHtive6/8Sc7Z0M8B1TNiQaWMZ/19xee71kzQkWaN
         ddG3ECwmKuJeMqGU7S+DnrO3FZ7p+i6BqkWIUx3JgPGLrHYiDoCAFg7SLqdb+ewwQHPb
         qyZB+JXmEACcy2/M503SxGoJFYXqPheNiyy4TlWyeBGf9grl4toTCOhUTy9vdTivp4w9
         LoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8T8iaT/9dcdgkVWV4KcYEe5+1niEPL2//rL6DhuX7E=;
        b=YwM3KJo4R33xT0hKHZsWqn2pBoB7Nz6Rj6GiH84rfv+g/DnhW70dnuXDUq4pedEqoU
         9V8MMnVz+JaFTMBXIMhmVCMlrFgb/cXciC6VQWtHSV43X4OxlEkKZmvgF8LG7iIaCQ8E
         iB/WNThr5nYlugNt94BgoRcYZfqo/0rvvD20llylfc7+Ps+BflcDCXtKoE2lEiy/3CdG
         jDsskDsroXIE3kfn07ImprhJBaeZyxfJlLt1OLVghMXRpHfman+49T0hMJYPc4WE4vGX
         ZiJLJ6mCNxwBSrGXQeUht7PAvxpqniNotc/e/oFNRaCo4W9sEAnmEwvjPCTWJNEK8L/x
         f/6g==
X-Gm-Message-State: APjAAAU4Eo/JoLD+RC3vJ1V4LYPjmaYcAw6LJRYj1QVDkonahdwNNAXL
        +Y/gw+Y8lHf3etlu9tOBMYmGO1I+dwFHtpO4ZNA=
X-Google-Smtp-Source: APXvYqyPUQJrzS3e03pacFDz7wtZseXkq9L9K6nTK5EGpJrWAGje1oz9PzUIo678zw6OsALKVVUZAnt1/uiuV/RXw8M=
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr405466pgk.99.1580323943017;
 Wed, 29 Jan 2020 10:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20200129103941.304769381@infradead.org> <bbdb9596-583e-5d26-ac1c-4775440059b9@physik.fu-berlin.de>
 <20200129115412.GN14914@hirez.programming.kicks-ass.net>
In-Reply-To: <20200129115412.GN14914@hirez.programming.kicks-ass.net>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Thu, 30 Jan 2020 07:52:11 +1300
Message-ID: <CAOmrzkJ8dsuSnomcE7uhyY9ip6T9ADLT7LhjydvY-hizpikBiA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rewrite Motorola MMU page-table layout
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Development <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Peter,

On Thu, Jan 30, 2020 at 12:54 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Jan 29, 2020 at 11:49:13AM +0100, John Paul Adrian Glaubitz wrote:
>
> > > [1] https://wiki.debian.org/M68k/QemuSystemM68k
>
> Now, if only debian would actually ship that :/
>
> AFAICT that emulates a q800 which is another 68040 and should thus not
> differ from ARAnyM.
>
> I'm fairly confident in the 040 bits, it's the 020/030 things that need
> coverage.

I'll take a look - unless this eats up way more kernel memory for page
tables, it should still boot on my Falcon.

Cheers,

  Michael
