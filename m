Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFE2C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C6EB611C6
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241731AbhIWOr6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:47:58 -0400
Received: from mail-vk1-f171.google.com ([209.85.221.171]:33516 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241710AbhIWOr6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:47:58 -0400
Received: by mail-vk1-f171.google.com with SMTP id t200so2728591vkt.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqaY63wLQkjGVchlsTPy8eoJVOD0kUUe8+eJx3riRCc=;
        b=CCnr3rlXMcAd1EGO9ESFPqPwoa9u8SiVq9GkFpJyoBbZw5XMAdiJZ5+iQ9YJ6IE6dj
         oDPhC3oIkPguOgwsM8CPTbuBTA3qQBd1lgW70WdkubRqZfZvvuSWdx3YRvGKhCHcs49P
         /Vbh7W6ZutqTDPacDSZBUUhTsE5sePl+iVrNmcLQfrt4+ktSzRGCIHx66qv/2L6WRr3y
         vX3PQ3XXBZI4iVFzYQY/OlqhpIB6hjmyS3cX2K37lebGauSu9V38pC8nKgEh/eVPQuyB
         nig3H+hAhBVSxkNNMECJN5n4by6wCQpMKkytjjLLlFa8kJdo6vZJWB4RUt862PocoYlF
         Wzuw==
X-Gm-Message-State: AOAM531mcZAQ9EPkjsTYRbjkSdSCoH60MmqLLb4ZStdAMTLIboL+cmFj
        CaVJjQ39p6ODBGVm1CGO2e2jizDR0y/gAldj/NY=
X-Google-Smtp-Source: ABdhPJzJRl/CfdeTAuJi2tM/LhVG0B4ZkulnI7E0Inib/uM+U7PV+ekKLfrx4zJ0NbLcdAbt1lR1/N8aWrkUgZiuyu0=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr3603364vkj.11.1632408386446;
 Thu, 23 Sep 2021 07:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210916070405.52750-1-hch@lst.de> <20210916070405.52750-4-hch@lst.de>
In-Reply-To: <20210916070405.52750-4-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:46:15 +0200
Message-ID: <CAMuHMdWa0ZfaToY=82iaH19oTnPy0MrL+CoASPPnnnMOS4+VYg@mail.gmail.com>
Subject: Re: [PATCH 3/6] m68k: use BUILD_BUG for passing invalid sizes to get_user/put_user
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 16, 2021 at 9:06 AM Christoph Hellwig <hch@lst.de> wrote:
> Simplify the handling a bit by using the common helper instead of
> referencing undefined symbols.
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
