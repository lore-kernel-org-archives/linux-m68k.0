Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294B8E7C4CE
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Oct 2023 15:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243104AbjJDPQd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242998AbjJDPQd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 4 Oct 2023 11:16:33 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F271C9
        for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Oct 2023 08:16:30 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a22eaafd72so27408137b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Oct 2023 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432589; x=1697037389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7G20iG4+lwdklDLeClOvf8KvH9MnEYm7S2jmZ9HxqQ=;
        b=jMAQUaO8SQOZqBiJwTR3At7n9iTW00x1eZc7Zye37bi+J4sHgtsT9a2JdheZtdVdAb
         72Y7HLpyYZxJG7sm13bwiNQ1coDImUIzQ00rYtfCloN1IK3OiXwxa5m888srRoTBPVhH
         JtRn8CSNmW3E8sM3LhV1fywgWiEQCdzhReyNtLjmrzwtYzvXgsPd+sVdCJ8BdGoQ63dX
         yiW2sOQIx6wWkcqHsrNPnY9YlOTtwuwZhp/jBmsOkCQcVjP8NrgmhWlRMdaWaeFKB2Od
         u4qc0Tw9SwitOyWo0eWYC0FIw3/Gvb47VLZT3qphF4nmoXsxltcNXDQMK/6avp02dEIh
         k8SQ==
X-Gm-Message-State: AOJu0Yx/ZVaUHESxLr4t/J+weUIW+lcFDgH4yTGyXxBo7D8qkV2N/ajl
        S7x+g6ubSY5Bl6o5V3Vzt6E95easvShrqQ==
X-Google-Smtp-Source: AGHT+IGh7eQMfq/D86tnVsKo1TF97qIZ0tSvDNpTLbJOKEMrstbXu7zaoTXkaLfGfgr4wLJX8Xl8kg==
X-Received: by 2002:a81:ee11:0:b0:5a5:798:4f0b with SMTP id l17-20020a81ee11000000b005a507984f0bmr24590ywm.52.1696432589050;
        Wed, 04 Oct 2023 08:16:29 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id r137-20020a0de88f000000b005a23a62a25csm1212616ywe.9.2023.10.04.08.16.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 08:16:28 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a200028437so27525447b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Oct 2023 08:16:28 -0700 (PDT)
X-Received: by 2002:a81:4ed1:0:b0:58f:c452:74da with SMTP id
 c200-20020a814ed1000000b0058fc45274damr2777522ywb.42.1696432588431; Wed, 04
 Oct 2023 08:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <5971770.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <5971770.lOV4Wx5bFT@eto.sf-tec.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Oct 2023 17:16:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP_GqT49hMWxz=oSOc8S5PcpYPuvAAOdae4rd1zWV6Ow@mail.gmail.com>
Message-ID: <CAMuHMdUP_GqT49hMWxz=oSOc8S5PcpYPuvAAOdae4rd1zWV6Ow@mail.gmail.com>
Subject: Re: [PATCH] m68k: add missing types to asm/irq.h
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     Simon Horman <horms@kernel.org>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Rolf,

Thanks for your patch!

On Sun, Sep 17, 2023 at 11:18 AM Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> As reported in f8b648bf6628 ("net: sunhme: move asm includes to below linux
> includes") when including this <asm/*> header before the needed <linux/*>
> headers the compilation will fail because of missing types.

    arch/m68k/include/asm/irq.h:66:20: warning: ‘struct pt_regs’
declared inside parameter list will not be visible outside of this
definition or declaration
       66 |             struct pt_regs *));
          |                    ^~~~~~~
    arch/m68k/include/asm/irq.h:78:11: error: expected ‘;’ before ‘void’
       78 | asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
          |           ^~~~~
          |           ;
    arch/m68k/include/asm/irq.h:78:40: warning: ‘struct pt_regs’
declared inside parameter list will not be visible outside of this
definition or declaration
       78 | asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
          |                                        ^~~~~~~
    arch/m68k/include/asm/irq.h:79:8: error: unknown type name ‘atomic_t’
       79 | extern atomic_t irq_err_count;
          |        ^~~~~~~~

> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

> --- a/arch/m68k/include/asm/irq.h
> +++ b/arch/m68k/include/asm/irq.h
> @@ -2,6 +2,8 @@
>  #ifndef _M68K_IRQ_H_
>  #define _M68K_IRQ_H_
>
> +#include <linux/types.h>

When just including this file, that still leads to:

    arch/m68k/include/asm/irq.h:82:11: error: expected ‘;’ before ‘void’
       82 | asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
          |           ^~~~~
          |           ;

Instead, you want:

    #include <linux/atomic.h>
    #include <linux/linkage.h>

> +
>  /*
>   * This should be the same as the max(NUM_X_SOURCES) for all the
>   * different m68k hosts compiled into the kernel.
> @@ -59,6 +61,7 @@
>  struct irq_data;
>  struct irq_chip;
>  struct irq_desc;
> +struct pt_regs;

OK

>  extern unsigned int m68k_irq_startup(struct irq_data *data);
>  extern unsigned int m68k_irq_startup_irq(unsigned int irq);
>  extern void m68k_irq_shutdown(struct irq_data *data);

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.7 branch, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
