Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE73DC433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 23 Apr 2022 08:06:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbiDWIJC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 23 Apr 2022 04:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbiDWIJB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 23 Apr 2022 04:09:01 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D42B64720
        for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Apr 2022 01:06:05 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id s4so7457216qkh.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Apr 2022 01:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MnsKeIXdOWL+qzKGmeKdJ+/k4zo4q4coagprsKaIqao=;
        b=yc+2ZH/U9dWgpqBLexOSw7HVeKeJRO1DkfA0klO4hlwbhMXbCT4VaCtJTXSRk5yNFf
         I6oTRGqh/aM8PhBKgSLeXx4IFDJndMaXU31XNcYqjNZV19I2pm/2sOnGDYrZdKC9CLWx
         NWdSYelQEDakd098JtZk4gAUOR1K285ZXwsGe+5xlMZ84qUTYprVYiQghUqLn/MT0C2W
         fZSv5RFugY4eYEQcRfEh+0+TsiOU09whmesx4OR04lwTTZDhi59/TYPcu2OVYyhNTN2g
         eNzPjSz4sv7/8cQvHoiLF2PAO+toFiBxRBrP6fcfOsfuLB8tSN7wA/TPl5xvBA64yXEt
         6gNg==
X-Gm-Message-State: AOAM530WO16//HttpBBXoJl2xIpSPIK20r1zmKK1N/3lt8keMHp0j5Qj
        my3OfSWm039pBT5jFtp0a7szpPTEugXRSg==
X-Google-Smtp-Source: ABdhPJxfRH7GlVTpHrXfE/VXfyjtB2c4bOA1w0V1enwK5J2nhCXSQuMm8CoQDPKbdOXMdPVW1uNxRA==
X-Received: by 2002:a05:620a:444e:b0:69e:d240:9cd2 with SMTP id w14-20020a05620a444e00b0069ed2409cd2mr5015581qkp.72.1650701164288;
        Sat, 23 Apr 2022 01:06:04 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id d22-20020a05622a101600b002f1f139d83bsm2384083qte.84.2022.04.23.01.06.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 01:06:03 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id b95so18391785ybi.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 23 Apr 2022 01:06:03 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr8029426ybq.393.1650701163360; Sat, 23
 Apr 2022 01:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220421070440.1282704-1-hch@lst.de>
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 23 Apr 2022 10:05:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw6c-dEOJUyZaQqOj=udmk9X8pxyd-nyph4K4at7iaDQ@mail.gmail.com>
Message-ID: <CAMuHMdUw6c-dEOJUyZaQqOj=udmk9X8pxyd-nyph4K4at7iaDQ@mail.gmail.com>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Apr 22, 2022 at 11:14 PM Christoph Hellwig <hch@lst.de> wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/lib/checksum.c             | 2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
