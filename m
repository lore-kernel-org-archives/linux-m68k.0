Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A16C636CD
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Feb 2023 18:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBESwT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Feb 2023 13:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBESwR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Feb 2023 13:52:17 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC92C193CF
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 10:52:16 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ud5so28567915ejc.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 10:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=HW9XJWDNzeOCSuB6xjuHzGjlFrFpNWXt04d038AYbQHAwGjnEJnVJFaDX127TnFYpL
         ydEGn0SwgrZ26RVkS0s0lgFAxMQXSWztEh7hBcLvV0G2Q3rBSAhctrbX0nTU4l9fQ760
         cFueFrfradqcL9O/I0nJrdeB83AKu6+dYCVG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHO7GI+A1DWHNoRePsnR8I5+C4R4p3/7zIJvX3p+LUg=;
        b=tNeSJgUMs9pZApfx5Uz+YXQJWBK1nYZULHZlqQzk9hIxaIRtSlFaIJOpoeHS7zx4cg
         suikDZ17msP0QHWItd4zEzvSOeqyF8sgdKq5M6K1QCYcVjh/YCZxM9cUkOAh4ZgHBohe
         D4A/tTxnRybwTMCwkznMMSApqsCgCMeZI/K0yIDlTDaTfcnLFYXI3uzo6QyTRWNyQI4h
         YponjwrqgX/vaLYLXBoNrXKS5YyrYfTT4cJKPOHKbIgGqhQFPu4ycNFlfGRqUJIPPAje
         kzMRWyQydmgXKYcG0TiWhw+eybyqZUv5PB5rtPhnflLGedmB0aDXWxhSjyapvN86zOJv
         bhYA==
X-Gm-Message-State: AO0yUKVEjGXXQ8lb+oEv31t3VciFxQ0Zs0CgoIG4jyO7/M4bHDYexJSj
        Ud6UoixzJZswhAGX6RmFYzQWBBaz+NoXpGn5a4w=
X-Google-Smtp-Source: AK7set9u5ddKZSxx4iQTAUHreKOX1W/1dOUkNOt/IfhsTg/kfqhVK8tbPsRpEwPcCd4viq/mY1xdyg==
X-Received: by 2002:a17:906:6a1b:b0:88f:8ef7:c71e with SMTP id qw27-20020a1709066a1b00b0088f8ef7c71emr14629336ejc.14.1675623135377;
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id de48-20020a1709069bf000b0088cf92eb0e1sm4402035ejc.150.2023.02.05.10.52.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 10:52:15 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id hx15so28454004ejc.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 10:52:14 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4354270eje.78.1675623134603; Sun, 05
 Feb 2023 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV> <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
In-Reply-To: <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 10:51:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Message-ID: <CAHk-=wirpn8qX5hCyeS0a4GCQH5p-2ACXgzJTj7zjZ5rGux_Bw@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Feb 4, 2023 at 10:16 PM Finn Thain <fthain@linux-m68k.org> wrote:
>
> That could be a bug I was chasing back in 2021 but never found. The mmap
> stressors in stress-ng were triggering a crash on a Mac Quadras, though
> only rarely. Sometimes it would run all day without a failure.
>
> Last year when I started using GCC 12 to build the kernel, I saw the same
> workload fail again but the failure mode had become a silent hang/livelock
> instead of the oopses I got with GCC 6.
>
> When I press the NMI button after the livelock I always see
> do_page_fault() in the backtrace. So I've been testing your patch. I've
> been running the same stress-ng reproducer for about 12 hours now with no
> failures which looks promising.
>
> In case that stress-ng testing is of use:
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Could you test the thing that Mark Rutland pointed to? He had an
actual test-case for this for the arm64 fixes some years ago.

See

   https://lore.kernel.org/all/Y9pD+TMP+%2FSyfeJm@FVFF77S0Q05N/

for his email with links to his old test-case?

                Linus
