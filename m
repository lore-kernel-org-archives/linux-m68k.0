Return-Path: <SRS0=GoaV=4F=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADC4C35242
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Feb 2020 07:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 943B62070B
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Feb 2020 07:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgBQHg2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Feb 2020 02:36:28 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43146 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgBQHg2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Feb 2020 02:36:28 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so15796183oif.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 16 Feb 2020 23:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuOiO3WgSyJKnxTjJOQN1meORdYh4/iYGl3q0xfpi6g=;
        b=SknpmTEaUEj6Bq1Q0tF18FqCAYm9i02FRXPjQo0oNA7dc8LE8XA5lGzUMUYDhg1gFQ
         rY4ik7c/rcHfXgQ6urKPdg9rfUfPgy2yYKcFmXhYXfq1cFEOCnST/NsgperTEIjHErV1
         4Bq7EMPa5+7hzHTraBO86B6kYZ+w7p40oFIaj/fFsjR+RSa+VvltZ1fYhUC1wCTIY0Yc
         ZqMxtjniszvMpzP+DMlcQjg7mVlG1IvacjHo2cCr27cE6CtHp8qEp/cuPl/yaO/0h4Ai
         cy/5TwOFATQTJukWeFeINj+e0JQtnSvESxlK+td6ZC/sHwlpj8UCdpVMVKPySxsiof4i
         cUBQ==
X-Gm-Message-State: APjAAAW8GtQKt0jhzeYBdn3evoG87iJEAdSWK7Sg1HSNOwQcMqkkCyN+
        A/XlQ79Kqk3LB5K1GdP5rhjtl+ZiRgf5dmQXLpdb1g==
X-Google-Smtp-Source: APXvYqxKa9A1iXEoFtvs2SQx0wwpyI+D+8O+BpCQT5TTiBwESFO3k3MigqRo69thtGMj1kz+e9do4m1f9fB6IxLYpJM=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr8802173oia.148.1581924987398;
 Sun, 16 Feb 2020 23:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com> <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Feb 2020 08:36:16 +0100
Message-ID: <CAMuHMdU0DSTZMn6akY8qZR3SDxVEruEsd3Q3sYf-tn_ooXDDBw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mm/vma: Make vma_is_accessible() available for
 general use
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mel Gorman <mgorman@suse.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Feb 17, 2020 at 6:04 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
> available for general use. While here, this replaces all remaining open
> encodings for VMA access check with vma_is_accessible().
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/mm/fault.c    | 2 +-

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
