Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AFCC74A5B
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Mar 2023 16:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjCWQd2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Mar 2023 12:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbjCWQc4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Mar 2023 12:32:56 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6022C671
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 09:32:04 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso23203787fac.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7GNIdZ5wgfU6KCXGbmsavLHJtcjfO2exto0gDOFK7Q=;
        b=db/jW28RRFIJNPJl41PufZp1LGSl04rTBXkw/70FVSIUAQ4dKNoyusG5QXveW3ErqM
         ofurROOLDNF2tabrTQBdXmwpWRwarZ7UoC7x+FseRkfLJH8fAiT92PqPE7CrosxtNB9m
         o4SKU7gsIVI0ZdrO/1cOFkR3nvw2F4p4wTdaZVBNexz05jktG656xA8NCv1485usrmn/
         ktuGg+F7sEQC60oxPK2U0ry7Jm4EHvdbNwBGEMqPthbM1WT6cyJA59HRroWp1KFz+kBN
         Fi4ClpY17vCIeLCFWgfulq2cpUF+HHmgyUOb56jTsfX/99LDt6zWBw8oWxbETicEWnH5
         EDSA==
X-Gm-Message-State: AO0yUKVVz2nNjnolMpolud7KFoLF2o1pJr9cMwDqMn01vyaXBR4mOox0
        SIhoQaJwf4dsDeXDVath176wSW/y8o+NA2+J
X-Google-Smtp-Source: AKy350ZnisCO03s1ftFmfbtV2UC1A0eCxEBOq0dad49oS/L3xjPT+RMijtrJQJ2aWNI5v6rfdMXr0w==
X-Received: by 2002:a05:6870:d181:b0:177:b6ce:1e76 with SMTP id a1-20020a056870d18100b00177b6ce1e76mr2588936oac.55.1679589122993;
        Thu, 23 Mar 2023 09:32:02 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id vl9-20020a0568710e8900b0017ad7a5f57dsm6386291oab.11.2023.03.23.09.32.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 09:32:02 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id bo10so16604478oib.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 09:32:02 -0700 (PDT)
X-Received: by 2002:a05:6902:728:b0:a09:314f:a3ef with SMTP id
 l8-20020a056902072800b00a09314fa3efmr2593946ybt.12.1679588687557; Thu, 23 Mar
 2023 09:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230323092156.2545741-1-rppt@kernel.org> <20230323092156.2545741-7-rppt@kernel.org>
In-Reply-To: <20230323092156.2545741-7-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Mar 2023 17:24:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSE1OzYQfNx=cbP+yKZLkgv=nUS-Ddqk2ORv9qdWFahw@mail.gmail.com>
Message-ID: <CAMuHMdWSE1OzYQfNx=cbP+yKZLkgv=nUS-Ddqk2ORv9qdWFahw@mail.gmail.com>
Subject: Re: [PATCH 06/14] m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 23, 2023 at 10:23 AM Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
>
> Update both to actually describe what this option does.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
