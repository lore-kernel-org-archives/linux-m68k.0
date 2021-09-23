Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E21C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ECFC61164
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241661AbhIWOtp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:49:45 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:39565 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241707AbhIWOtm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:49:42 -0400
Received: by mail-ua1-f43.google.com with SMTP id o13so4409578uat.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4xP9L2cLDK0aq+efN1FLZRwl97RqX/C4sxbEMHakGY=;
        b=d4GkY+xZgDkjPgnUXN6kCKQBTJEzc71uC/5DZTBd4H+PgPXaE67oFwhfMMEunX0mpB
         L0wCM7SIbqFLbnUN0Dnv/CkZQEz4DJvV/aiHG0vvSsWdIsgw6AozlHmZLdyni3cXcMui
         OkHrLSC4CgS/XtCECoRMpxXvAPLL2JUsKiRUJeeyTQBccWsmCajG7b8yV73nVawJiav3
         JrP3m9qvzWa2UVXBfEiT3TILVvv6fJtBCsd6ojSCG0e/nqnUUZPElFHajp6nQE1BWTIv
         t+J/8te/NKvb+mSWrsYWXetfToOxu7GSeqcAShwrmpmyAHZyTna+3PEliTVGbQx2dDGD
         cAuQ==
X-Gm-Message-State: AOAM532tF6NWK4/3TsGX85bS/EeG05lkFGqxNflFWoNzjMqjZQzvVfUZ
        gXJ3bWcEegTpDKyGxTIeAadFD8vpTQPTDDv7W9I=
X-Google-Smtp-Source: ABdhPJx44Pk+LtMq3W48bl+iSP5KDlYa6wDZT8AreV0LhqtfnJlGFjWYCS2kPuxNxuIgi+kcZDRKIAAizykPqi4r8JM=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr4550088uaf.114.1632408490857;
 Thu, 23 Sep 2021 07:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210916070405.52750-1-hch@lst.de> <20210916070405.52750-6-hch@lst.de>
In-Reply-To: <20210916070405.52750-6-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:47:59 +0200
Message-ID: <CAMuHMdUfvktqu+KPDxPbS8Zg7snniq37WSh=nARj-LfcESz6Uw@mail.gmail.com>
Subject: Re: [PATCH 5/6] m68k: provide __{get,put}_kernel_nofault
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 9:07 AM Christoph Hellwig <hch@lst.de> wrote:
> Allow non-faulting access to kernel addresses without overriding the
> address space.  Implemented by passing the instruction name to the
> low-level assembly macros as an argument, and force the use of the
> normal move instructions for kernel access.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
