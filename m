Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BD1EB64D9
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jun 2023 09:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbjFNJWt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jun 2023 05:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241378AbjFNJWt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Jun 2023 05:22:49 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263C01BC5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:22:48 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bc9782291f5so423982276.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734567; x=1689326567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0yjIX0KRuOC7G0fcJ6d1AuThz30GREhJw6MsawVV4o=;
        b=QHoCU5FAGwX+zOIDbLTR6t5Dk6IMULtwoAbCJl9Uj6C7ZED7tkqJya46nk4aJaJNTH
         SYI3WYOPXWcsqCpl5VsPvpjpsHXJkjiVrdFt3Gs3DKL6Z+sNGvnWtZiM2YrN3XbAVrYp
         DpJSA0QSWZ4GAar818vCIaByEGuIHAU3GCLiqE89kIflqelEhakUiUwnGj+jlTULni5x
         XffMcbHc7jIRXVMvUOjWLT0Jn7ewKz6EnKDj79SsSUW647pDN3bkpMr+6lsOZO4y06FH
         XK+LN4cazrmV+3FyFzTZQO2B1TNftKsFnoQ69PyXigJow6mfyQLWe4vg30fAvrhGneLN
         uXAw==
X-Gm-Message-State: AC+VfDwsBh4jrhORZC8a9xKk+43xQ88hNrKVwajnP4bKuK5Tz+1g113z
        k5qJUInEAWQylmfNrkwy+wyQygv1DGENNQ==
X-Google-Smtp-Source: ACHHUZ4gO5o+gAty44+jnsLqsurTOnl92Buv8oUpacaNhFZJHiIbJ3KIOqCZasqqTCbo7hJkarhOew==
X-Received: by 2002:a25:d496:0:b0:bb3:b6b5:8c6 with SMTP id m144-20020a25d496000000b00bb3b6b508c6mr1413942ybf.29.1686734566944;
        Wed, 14 Jun 2023 02:22:46 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id s7-20020a5b0447000000b00bd232859d10sm729170ybp.33.2023.06.14.02.22.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:22:46 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56fff21c2ebso5223137b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:22:46 -0700 (PDT)
X-Received: by 2002:a25:3249:0:b0:ba8:199b:9ec2 with SMTP id
 y70-20020a253249000000b00ba8199b9ec2mr1412111yby.31.1686734566067; Wed, 14
 Jun 2023 02:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230613223827.532680283@linutronix.de> <20230613224545.254342916@linutronix.de>
In-Reply-To: <20230613224545.254342916@linutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jun 2023 11:22:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbBs5dE_Yi+gX8MNCqduP87S+w+T4B_JjVynbDyE=Waw@mail.gmail.com>
Message-ID: <CAMuHMdUbBs5dE_Yi+gX8MNCqduP87S+w+T4B_JjVynbDyE=Waw@mail.gmail.com>
Subject: Re: [patch 06/17] m68k/cpu: Switch to arch_cpu_finalize_init()
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nikolay Borisov <nik.borisov@suse.com>,
        "Ahmed S. Darwish" <darwi@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-um@lists.infradead.org,
        Richard Henderson <richard.henderson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chris Zankel <chris@zankel.net>,
        Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jun 14, 2023 at 1:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> check_bugs() is about to be phased out. Switch over to the new
> arch_cpu_finalize_init() implementation.
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
