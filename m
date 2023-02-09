Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA94C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Feb 2023 13:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjBINy6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Feb 2023 08:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjBINy5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Feb 2023 08:54:57 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74B311140
        for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Feb 2023 05:54:55 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id q10so1341122qvt.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 05:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CcV9wL3Ec1xOc4Cg0ZtCdpfu4ss4O9wCq9W1zoWAsE=;
        b=e5279CnlDGYLWPq+y//90pntvpqYreqf6IZaJD1soW3lhvnsGoALUmJ3uq1gM1K5d8
         sVvx8by2tH+GHsA+m/+m37/AYLiTNqsmu/Wxz/qvDuqeGT0VgWI4gUnVXF2HYamG9sn/
         MnWgYlkusl+K0HwJ7VEiBzEGVQK3llFoi5NeYafxH0Y8tYbYgXsICa/yQGvmd5uU6R9q
         1CrmYB8ZQ9hac3ybVVYJnczVy8csTMPKLSuTl4uXGtfgLs5ly6asf5eHYMxkjDGEUJIK
         GS1n5lBlFfQLvx8pars8SahCmY7D9SG1N9wK15s6vVbWq7l+zOraM6Ibb3E005qE0pkR
         +yXw==
X-Gm-Message-State: AO0yUKUgkCni6Z+YuaLpmPyH/KQ77JaVSh1vMBq9lHTo4RnuBQUOhUBK
        AADocTkeGV1BgAe92iP/nC9kfVWk/1ipAA==
X-Google-Smtp-Source: AK7set/RVvgn5c8ldfiVjDqMvW/cag0i5A1NlnoZ46OTIo4ZGkue20q+yDYbb44kiB+nFFVbd39INQ==
X-Received: by 2002:a05:6214:300c:b0:56b:ee60:42f2 with SMTP id ke12-20020a056214300c00b0056bee6042f2mr17592001qvb.45.1675950894512;
        Thu, 09 Feb 2023 05:54:54 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id z13-20020a37650d000000b006fef61300fesm1372202qkb.16.2023.02.09.05.54.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 05:54:54 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-520dad0a7d2so25956647b3.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Feb 2023 05:54:53 -0800 (PST)
X-Received: by 2002:a0d:e004:0:b0:52a:7505:84bc with SMTP id
 j4-20020a0de004000000b0052a750584bcmr1196453ywe.383.1675950893766; Thu, 09
 Feb 2023 05:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20230209010825.24136-1-rdunlap@infradead.org>
In-Reply-To: <20230209010825.24136-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 14:54:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVi8YQbf3HiCXkcvcttoqQdDJ+Zn5fdTanvwR3Hi9g+MA@mail.gmail.com>
Message-ID: <CAMuHMdVi8YQbf3HiCXkcvcttoqQdDJ+Zn5fdTanvwR3Hi9g+MA@mail.gmail.com>
Subject: Re: [PATCH] m68k: /proc/hardware depends on PROC_FS
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Thu, Feb 9, 2023 at 2:08 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When CONFIG_PROC_FS is not set, there is a build error for an unused
> function. Make PROC_HARDWARE depend on PROC_FS to prevent this error.
>
> In file included from ../arch/m68k/kernel/setup.c:3:
> ../arch/m68k/kernel/setup_mm.c:477:12: error: 'hardware_proc_show' defined but not used [-Werror=unused-function]
>   477 | static int hardware_proc_show(struct seq_file *m, void *v)
>       |            ^~~~~~~~~~~~~~~~~~
>
> Fixes: 66d857b08b8c ("m68k: merge m68k and m68knommu arch directories") # v3.0
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.3 branch.

> --- a/arch/m68k/Kconfig.devices
> +++ b/arch/m68k/Kconfig.devices
> @@ -18,6 +18,7 @@ config HEARTBEAT
>
>  # We have a dedicated heartbeat LED. :-)
>  config PROC_HARDWARE
> +       depends on PROC_FS

I'll move the "depends ..." line below the "bool ..." line while applying,
as that's where the dependencies are usually listed.

>         bool "/proc/hardware support"
>         help
>           Say Y here to support the /proc/hardware file, which gives you

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
