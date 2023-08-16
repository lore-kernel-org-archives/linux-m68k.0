Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32370C001E0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 07:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242470AbjHPHlu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 03:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242507AbjHPHld (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 03:41:33 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00FB198C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 00:41:30 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-645181e1eaeso23771536d6.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 00:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692171689; x=1692776489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkTNstwI73s4YFo3/SQhtE6/OXSa9yBSjbdY7mJiIyI=;
        b=Lj05ZF5RORaah6osI7xWZLlJPhEfHABr3pYEAVOs3uSSBP2sM0yzaT/KCJQTHRty+9
         gM/VKAdWeh3Fl3CSjx8S8CgxI/ApG6lPMmpd7z9mq2m2RDDqMxNhq0xvUHVlgP/NcDZv
         dfQE/oC/Lpkop9EGsUx8Twqrz8fsUUSr+mCT5YFiqGKlRCadWAP/0XlQclgQkR919ist
         bRqNHzDGb0CEHabYyToDqx1Bgzmekm4msHuemIGy7+tdNKZLYUXOcDZAbMki94zjSJbE
         fH+1hnnEmvRfsh9EoOW1AF2o/LFG7vmNRh/KjwJDhv1AzBgIRuJTAlWcys0xIgQszXE2
         t52g==
X-Gm-Message-State: AOJu0Yx1eNKol6FI8Vu5335Kq8C5zVGSGA1rqKYlRCCEQ5JLyHIiJUIJ
        l1HvCKKDEbuTEhvVchYPVihS2eAba8gWTw==
X-Google-Smtp-Source: AGHT+IGv78xlEvY7gHoAjJjmfOu4icUfxeFzdXPZZ2zwbjD1CEOoguxRMiTz3RiLhfL+K0suS5u4rw==
X-Received: by 2002:a0c:ab5b:0:b0:63f:5ef6:df5f with SMTP id i27-20020a0cab5b000000b0063f5ef6df5fmr944993qvb.43.1692171689461;
        Wed, 16 Aug 2023 00:41:29 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id x8-20020a0ce0c8000000b0064906cfe430sm302171qvk.135.2023.08.16.00.41.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:41:28 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76ad842d12fso422738785a.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 00:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:76c:5715:b4a3 with SMTP id
 de17-20020a05620a371100b0076c5715b4a3mr1484328qkb.13.1692171688197; Wed, 16
 Aug 2023 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 09:41:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
        linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>,
        Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Wed, Aug 16, 2023 at 7:50 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Makes perfect sense to me.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
