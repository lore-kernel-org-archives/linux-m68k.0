Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24529C433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E10C561074
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Apr 2021 07:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhDLHYj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:24:39 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:36848 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhDLHYg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Apr 2021 03:24:36 -0400
Received: by mail-vs1-f45.google.com with SMTP id k124so6162357vsk.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Apr 2021 00:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FmbDoSu36cdmvIZoh4wOCjXx71TJWIKmYq1MspstesE=;
        b=ijm7VDnO59dgzV4+6zGtxSIjhm526NTr6rSoIkHpVvoqJsbD03ZF4UfWvERbhT/O7X
         2zE4ktcG6f42IcDEYKbflZWFpi6g1M2thDykeS9EtIbdFcCmTTrhTi/GLkqgz8Y0enfD
         erC3DV4QguY3JYdDyfC0Lu/3zZKS8Zt85wY6wKgy2DHq53y4Z/OrZOHa0AOZVXwM1sR1
         DfAEYq6nMqoi1F8RvIoFM0RYgkwfCnGFZUnyfTXWBzOFZb+ZKLvW4nspgnFlmZF9Zth1
         Zq33j03cYYwtRWJlvNSlbdoxQmJ61j7mhePGUC8iBR416pJAj/m5R+eyD9f7X3yrI0/i
         /DTw==
X-Gm-Message-State: AOAM530kKhF0Cin56BSpO1uf5u5fSBHEuoj7/trygC3Kq0Pf3GQ0KHVy
        fsDUQ8Zz706qe6rFNKIFisF65ZHeTlqtF/WAIzg=
X-Google-Smtp-Source: ABdhPJyXvju3Gh46hIymtaF0bLVlri9nme00VpTKYLyTfyTcneCf1cRs3OF/wpAAWpUyarp4Dr3Cfksto2s45SL1BDM=
X-Received: by 2002:a67:f5ca:: with SMTP id t10mr18164600vso.40.1618212258056;
 Mon, 12 Apr 2021 00:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210407200032.764445-1-Liam.Howlett@Oracle.com>
In-Reply-To: <20210407200032.764445-1-Liam.Howlett@Oracle.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 09:24:06 +0200
Message-ID: <CAMuHMdVM5XFnxbF=q2KH_1NRx5iyosb1xQ3co1VBakSmRgiNpw@mail.gmail.com>
Subject: Re: [PATCH] arch/m68k/kernel/sys_m68k: Add missing mmap_read_lock()
 to sys_cacheflush()
To:     Liam Howlett <liam.howlett@oracle.com>
Cc:     "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 7, 2021 at 10:00 PM Liam Howlett <liam.howlett@oracle.com> wrote:
> When the superuser flushes the entire cache, the mmap_read_lock() is not
> taken, but mmap_read_unlock() is called.  Add the missing
> mmap_read_lock() call.
>
> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.13 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
