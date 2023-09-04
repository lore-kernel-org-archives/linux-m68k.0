Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB453C71153
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Sep 2023 09:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237709AbjIDJ3g convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Sep 2023 05:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjIDJ3g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Sep 2023 05:29:36 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB9918D
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Sep 2023 02:29:33 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58dfe2d5b9aso16753917b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Sep 2023 02:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693819772; x=1694424572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhYY1jPPd4YIanKFTU2nWMCKlreWmIcOriE8C055zzM=;
        b=PqTripxzJ71MPQS5XdGNKEmiIub4cssM2taNDgyM/F4uP1Z8z6CxQluENVzUc++7+t
         zVtkRobPOA2epSKzDWDTGCd1xExL+M1loQsIcNrcY/z7KGH9LF1St4+jo/bARyyfjzJw
         1+dABT3bYEc3LRHqiEE7mrzLjlYiFBg9TjlA/9vDfgWtiyY4noq/c5wU/AglRBNfeYiZ
         YLVVMetKGT3l8d3jkBoSkNi16RWfxKSWqQZEwdjpoC82zb1yDsZpGjm5aIeolpMvOJhU
         lVpJMcq9wSbVvZbL3yixu/U5mhC8cLvSk1sNHsZPAG3lpg0jrLxqvXi5caK0TQxMQ0uv
         Ol+A==
X-Gm-Message-State: AOJu0Yx8SmQFOxrGYouvMHnQgvQofwCLn+iSL8IUvul1ziuFDG9pXj9v
        q0Vl9/F8qCWyYBe4WvmjRoecmB4u8iW9fQ==
X-Google-Smtp-Source: AGHT+IGqTk250K01CSdljDue857hdOuS/iQjlEynHxEyHaCIr69dAWS5r0/DjoGrWE66s7VXh99YBA==
X-Received: by 2002:a0d:dfd2:0:b0:586:b847:5ef0 with SMTP id i201-20020a0ddfd2000000b00586b8475ef0mr12803605ywe.4.1693819772401;
        Mon, 04 Sep 2023 02:29:32 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id n6-20020a0de406000000b00573898fb12bsm2556965ywe.82.2023.09.04.02.29.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 02:29:32 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7bae413275so2922221276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Sep 2023 02:29:32 -0700 (PDT)
X-Received: by 2002:a25:ae57:0:b0:d72:7cb8:21a1 with SMTP id
 g23-20020a25ae57000000b00d727cb821a1mr12231769ybe.4.1693819771988; Mon, 04
 Sep 2023 02:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230830185428.4109426-1-azeemshaikh38@gmail.com>
In-Reply-To: <20230830185428.4109426-1-azeemshaikh38@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Sep 2023 11:29:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW81k+hzHeT-CH7B5Vm3MxvicjB7+jRQf2W8ecMbk+eg@mail.gmail.com>
Message-ID: <CAMuHMdWW81k+hzHeT-CH7B5Vm3MxvicjB7+jRQf2W8ecMbk+eg@mail.gmail.com>
Subject: Re: [PATCH] m68k/atari: Replace strlcpy with strscpy
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     linux-hardening@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 30, 2023 at 8:54 PM Azeem Shaikh <azeemshaikh38@gmail.com> wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
>
> Direct replacement is safe here since return value of -errno
> is used to check for truncation instead of sizeof(dest).
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
>
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.7 branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
