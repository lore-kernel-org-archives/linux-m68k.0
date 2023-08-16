Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E33C001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 15:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344183AbjHPPeH convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344192AbjHPPeE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 11:34:04 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4719E210E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:34:03 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d712d86eb96so1482616276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692200042; x=1692804842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaVSsPNBIbXa98DG/iHuB0Knmq9R+zqUhYDbkrJc/CM=;
        b=eqKpdmPwjYUzbPuc+m+EG7pHWdEHmD3O5eZHOWHr2HePoqr8k/4f/fCGqWTQNE0KTR
         CXTY+eJv64tNsJpkzkbL5LKg47em/PB6Gy9y/jKv1tcFhd9vhU4iCWK0H0AVulwhZuGv
         ki9mnPvTyim4LzJeb81eqg+5Cqhj7dDYjqaoeMClb+m+l3QT4mkk/eGgumh1UUyjsZeJ
         hmf4Zck6CNkLd07AOHZsfOawCOhIJ5hxrhXpBUX/yv9LqanorcsSAQhIwXG3234wIVur
         AtL30jvd4qYF474vamGVrf0mMUziVUr8dEi6CyW0owBtfCQlRhZH53J0Y0exRjZubnAT
         DGQQ==
X-Gm-Message-State: AOJu0YwElZ6hAELQisCAJBVfkQohS3H0ecd7nz43HpOMgn/Kku9dVdEi
        ECcMVWeI7NWW8QEI2ea+LLPZLjd4HI8GIw==
X-Google-Smtp-Source: AGHT+IERdPN+I0CFC3HgZlBIyOU06qCtb6Yqvxa27MKLDxfbB4/EfaELMb+DgOWiErxOaqHrjW3CFA==
X-Received: by 2002:a5b:403:0:b0:d6b:75e5:f2fd with SMTP id m3-20020a5b0403000000b00d6b75e5f2fdmr1763232ybp.37.1692200041794;
        Wed, 16 Aug 2023 08:34:01 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id o124-20020a254182000000b00d1f0204c1b6sm3552684yba.27.2023.08.16.08.34.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:34:01 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d712d86eb96so1482596276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:34:01 -0700 (PDT)
X-Received: by 2002:a25:d20d:0:b0:d1c:6a5e:463e with SMTP id
 j13-20020a25d20d000000b00d1c6a5e463emr2111588ybg.28.1692200041383; Wed, 16
 Aug 2023 08:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230809211057.60514-1-arnd@kernel.org>
In-Reply-To: <20230809211057.60514-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 17:33:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFRhBT4iNMQpzjspBR20s700FZbhq+NZ_f9HyV1Ztcqg@mail.gmail.com>
Message-ID: <CAMuHMdUFRhBT4iNMQpzjspBR20s700FZbhq+NZ_f9HyV1Ztcqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k: define __div64_32() to avoid a warning
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 9, 2023 at 11:11 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The generic __div64_32() definition is built on all architectures that don't
> provide this as a macro. m68k however neither defines nor requires __div64_32,
> so it should define an empty one to avoid the warning:
>
> lib/math/div64.c:31:32: error: no previous prototype for '__div64_32' [-Werror=missing-prototypes]
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nice! 142 bytes saved (which do not show up with bloat-o-meter,
as it does not count weak symbols; patch sent).

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.6 branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
