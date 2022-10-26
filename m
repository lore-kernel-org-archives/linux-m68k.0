Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA3C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Oct 2022 12:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbiJZM5X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Oct 2022 08:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbiJZM5U (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Oct 2022 08:57:20 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8CADAC6B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 05:57:18 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id g11so9783068qts.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 05:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHPnwGcL07S/3HxkQcxmtCdbU4/35neUEzbYrWqymaQ=;
        b=UOYpol/wVGgzjVF0ICzp8xwzVVbo5FcZs2XMV2q6+VlstZ8lp34A3krtNsAW3kO0fM
         h0JISNy3JO5LMy2K8pJF4vYarHez7V1isIanxzQ3OT8X4hMFeA+d/e80/BetNm/eWrnb
         XxvmD1XyaKhMxu66fVnDRCktIf2e6lE59HXjbKFHDb4y0Z7/FxcbxUREDPnkFbeW+Hzj
         NpVXOnOaQ08HR7kn/+H/sNNKTe/jiDPof4pWXyLLu1AW0nx9KfWKx3zKiAi6ZlTZ05RM
         20aZZH2PyFQmX/JZ7VKnTTir3PDW6WMAD3chQJbcRzLJ6u1/vAqv1nkwAouRYeqiyea1
         07vw==
X-Gm-Message-State: ACrzQf39g/Zf4CsMkrMc7yIfLySuPzoMicWdvM3YWblMb05yQ44kM5vA
        b1IPb36UTOYYVPh3nfrUdvrDjlYNkhLbdg==
X-Google-Smtp-Source: AMsMyM5ILPd5Y/fwypK+8WL1vibraa0SVSYlq2OryRVyQeVK/YC3bkPV/0qP8WTZR70MssfBvbgkFQ==
X-Received: by 2002:ac8:7d49:0:b0:399:d201:840b with SMTP id h9-20020ac87d49000000b00399d201840bmr36972263qtb.309.1666789037490;
        Wed, 26 Oct 2022 05:57:17 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x11-20020a05620a258b00b006ceb933a9fesm3956627qko.81.2022.10.26.05.57.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 05:57:17 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id r3so18701508yba.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 05:57:17 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr36837059ybb.604.1666789036883; Wed, 26
 Oct 2022 05:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221026124801.1576326-1-Jason@zx2c4.com>
In-Reply-To: <20221026124801.1576326-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Oct 2022 14:57:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdR34JX3+=m8vuw=k_kOxT1jq3sGsW6yh_h9aFH+BP4A@mail.gmail.com>
Message-ID: <CAMuHMdXdR34JX3+=m8vuw=k_kOxT1jq3sGsW6yh_h9aFH+BP4A@mail.gmail.com>
Subject: Re: [PATCH] m68k: mac_via: use explicitly signed char
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Wed, Oct 26, 2022 at 2:48 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The `val` variable is set to -1 and compared against < 0, which means
> it's assumed to be signed. However, soon char is to become unsigned
> tree-wide. So explicitly mark `val` as signed to that it keeps working
> the same way.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Geert - Linus asked me to consolidate all of the unsigned-char fixups in
> one tree. So, unless you plan on taking this for 6.1, I'll queue it up
> in that tree for 6.2, following your ack. -Jason

Thanks for your patch!

> --- a/arch/m68k/include/asm/mac_via.h
> +++ b/arch/m68k/include/asm/mac_via.h
> @@ -269,7 +269,7 @@ extern int via2_scsi_drq_pending(void);
>
>  static inline int rbv_set_video_bpp(int bpp)
>  {
> -       char val = (bpp==1)?0:(bpp==2)?1:(bpp==4)?2:(bpp==8)?3:-1;
> +       signed char val = (bpp==1)?0:(bpp==2)?1:(bpp==4)?2:(bpp==8)?3:-1;
>         if (!rbv_present || val<0) return -1;
>         via2[rMonP] = (via2[rMonP] & ~RBV_DEPTH) | val;
>         return 0;

LGTM, although this could just use "int" instead.

Upon closer look, this function is not used, and seems to have never
been used before.  Please just remove it instead.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
