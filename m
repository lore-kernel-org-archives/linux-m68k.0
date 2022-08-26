Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DF1ECAAA3
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Aug 2022 07:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244859AbiHZHif (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Aug 2022 03:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245253AbiHZHie (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 26 Aug 2022 03:38:34 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CCB9C8CE
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:38:32 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id h12so495653qvs.3
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OU39+gxQZkZZ1TPJH3Zy6Os5dpUI+tEg7/Nxd3iSEkY=;
        b=74+egzKIVowa6tFStEQ7AdDHS/uMploKKYoIuaimEy1lAGUz1YhsFP2iwher+4QR3I
         XfPNir0w5xBdn/35nr0hXzcW90OvxFlEUKQWPHO02v2f/NFrFpNqBKc9PJU9yL4IhzYY
         GKWqQtPAqAuEMyYYsqqwUIK6UuYyif4vemz9b+xSdIXzafI967IENSjlocQN2YfoGlM3
         A1SsTjJ0Ivru+AK3ojP+g2B9AQWD0mmKTCRlZJvCsFg3ddNspO7YPISlv6nUhjEevHrJ
         cmXmoJeyjwxmLVaOuI37hdFkJKQ51BxzNALCenZPBkhri7pvtr4MIZ+17qNmQ0v+JQ8E
         Cqgw==
X-Gm-Message-State: ACgBeo3VYTbW3a/GbJy8dmMtxuPBHusiEOFDoBWB01WCM4YkZp3Ng4Sq
        lLoMo1GKe+51aNmnfj+dabGTCsZ3qEkl4A==
X-Google-Smtp-Source: AA6agR6h8lsKmhyeWuro+yijIBXC7vKbj3dY99qAV9scdG5CKmYoqxBLln7VU8G8ynDcr/VWzNA75g==
X-Received: by 2002:a05:6214:3013:b0:496:dbfa:ab0f with SMTP id ke19-20020a056214301300b00496dbfaab0fmr6884767qvb.118.1661499511011;
        Fri, 26 Aug 2022 00:38:31 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x7-20020a05620a448700b006b60d5a7205sm1376494qkp.51.2022.08.26.00.38.30
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:38:30 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-324ec5a9e97so16063587b3.7
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:38:30 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr6476190ybe.36.1661499510322;
 Fri, 26 Aug 2022 00:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220826040302.3455339-1-gerg@linux-m68k.org>
In-Reply-To: <20220826040302.3455339-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 09:38:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWV8bWY+_V_P2HBu4pHKO0YgJb5V+M33OksfD0LWVwhNw@mail.gmail.com>
Message-ID: <CAMuHMdWV8bWY+_V_P2HBu4pHKO0YgJb5V+M33OksfD0LWVwhNw@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68knommu: fix non-specific 68328 choice interrupt
 build failure
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Aug 26, 2022 at 6:08 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> Compiling for a classic m68k non-MMU target with no specific CPU
> selected fails with the following error:
>
>    arch/m68k/68000/ints.c: In function 'process_int':
> >> arch/m68k/68000/ints.c:82:30: error: 'ISR' undeclared (first use in this function)
>       82 |         unsigned long pend = ISR;
>          |                              ^~~
>
> This interrupt handling code is specific to the 68328 family of 68000
> parts. There is a couple of variants (68EZ328, 68VZ328) and the common
> ancestor of them the strait 68328.
>
> The code here includes a specific header for each variant type. But if
> none is selected then nothing is included to supply the appropriate
> register and bit flags defines.
>
> Rearrange the includes so that at least one type is always included.
> At the very least the 68328 base type should be the fallback, so make
> that true.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
