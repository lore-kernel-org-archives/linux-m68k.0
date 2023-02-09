Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED49C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Feb 2023 13:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjBIN5G (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Feb 2023 08:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjBIN5F (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Feb 2023 08:57:05 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A8355AE
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Feb 2023 05:57:01 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id h24so1964001qtr.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 05:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqwgBNgfNhKkNqMMtrvACk5DcOIAbHYzACYlkaulAAE=;
        b=kuE30NMNnAnuKOf1bcP/xlj6vlCUyn4BBCJ0CdhmjnPwREucKlcfQcUKqHMdTekEGk
         Cybz5d5lnjuVMRbdBWRpy/p1lFFJpfioyjFSURNaJPFlw3vSOvXMyy+GfSuXDFzVrI2w
         JxKMLrURxP5MpN9kg+2xFjQ98Sfi2FIUIFvFwjEhEr6bVhdzejmgZveM2Z9v+IT7sCCW
         2Uf5uuTicYCI/R8gPItF+A+78nfOJqNcU4zEvVKIUN0PDd0XlbOCI+VLGLCS2JcuwRiB
         /QgmcrPJj2e8qUDzsVmFf/rEC756GCV/R2JuwZRISjxj04LHexw/y0CFIah4HmShWsW8
         5reA==
X-Gm-Message-State: AO0yUKXbJ0QMOj/oXo9LXDNkgFLuoEeaFMAYEs51agd2xuqkTHvncepU
        3DNztd0uYwN5fDtbVeCssmIbejD2yOhHqw==
X-Google-Smtp-Source: AK7set+CerkxFO9J22L34yT55qVcCkxW9FdF7A1drKKNkM8eNJVUzQLtlFqPFkoKTT5OAq4qykyAQA==
X-Received: by 2002:a05:622a:20e:b0:3b9:bb27:e11a with SMTP id b14-20020a05622a020e00b003b9bb27e11amr18574382qtx.0.1675951019836;
        Thu, 09 Feb 2023 05:56:59 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id z12-20020ac87cac000000b003b9bc00c2f1sm1213101qtv.94.2023.02.09.05.56.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 05:56:59 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-52bfa3dfd95so25815517b3.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 05:56:59 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr1053564ywe.316.1675951018992; Thu, 09
 Feb 2023 05:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20230209010125.23690-1-rdunlap@infradead.org>
In-Reply-To: <20230209010125.23690-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 14:56:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWLAbXFUHg+TT45AqVq6kHxK=FN=5wEHnpdiR0dn2L_g@mail.gmail.com>
Message-ID: <CAMuHMdXWLAbXFUHg+TT45AqVq6kHxK=FN=5wEHnpdiR0dn2L_g@mail.gmail.com>
Subject: Re: [PATCH] input/misc: hp_sdc_rtc: mark an unused function as __maybe_unused
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Helge Deller <deller@gmx.de>, linux-m68k@lists.linux-m68k.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-parisc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Feb 9, 2023 at 2:04 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When CONFIG_PROC_FS is not set, one procfs-related function is not
> used, causing a build error or warning.
> Mark this function as __maybe_unused to quieten the build.
>
> ../drivers/input/misc/hp_sdc_rtc.c:268:12: warning: 'hp_sdc_rtc_proc_show' defined but not used [-Wunused-function]
>   268 | static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
>       |            ^~~~~~~~~~~~~~~~~~~~
>
> Fixes: c18bd9a1ff47 ("hp_sdc_rtc: Don't use create_proc_read_entry()")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
