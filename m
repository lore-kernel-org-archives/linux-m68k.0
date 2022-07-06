Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29687C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiGFJqv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiGFJqu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:46:50 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE760BDC
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:46:49 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id z13so17441311qts.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8jOPstF035V3JBIGTjyEra8xnCZ4RAIho4NrHeIzoU=;
        b=G3kanFvhrr82sLejgIKK4nA+r9RQWbtJVXmtdLPV+j5Duv1D8BFuwAP+fnQRQSmpgo
         ilyX4z+nkStEPAqavgGlsxLVYGsA/2U1g5vzuq75gcDd/FA40ljkdluXE5NbMOxdsT4I
         VRvmGiksR/iFxZnONCgD7dNcC5c+P0ehGt7U7WUiCn9kEVAsl9cJZNFMrOSdOvvLnq0o
         vFDEJRrDOpW9RgTT5Zsf3jqQUobWlpuiF3uxB+QtrAITCoAz8C7kJrhoHr3doWMA/1uz
         vJdQWCr45HkyU8JPOODmi1QFXCTACYfvvLoEI5EIQEzuluLSpVqn2moMXyfaYKY//4O6
         tajA==
X-Gm-Message-State: AJIora9tbYctRvuO+QSfXm3llrCmk5nfdEpzyHsFj1P1cmQjMms3sROq
        bPQJfCLChq5f/wGWM9s2J31lfxutZWR9lVWT
X-Google-Smtp-Source: AGRyM1uEtGG/lbv/IBzs2mgZy+Wps54ToK40olROtrMvhJX54oHJV9kW7BW1qlVJmKuHs/erN/sE0Q==
X-Received: by 2002:a05:622a:109:b0:31d:23fe:7b4c with SMTP id u9-20020a05622a010900b0031d23fe7b4cmr31747273qtw.312.1657100808640;
        Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id b13-20020ac85bcd000000b00304ea0a86cesm26144748qtb.81.2022.07.06.02.46.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 64so17131445ybt.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
X-Received: by 2002:a05:6902:50e:b0:66e:7f55:7a66 with SMTP id
 x14-20020a056902050e00b0066e7f557a66mr6648581ybs.365.1657100796735; Wed, 06
 Jul 2022 02:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.124597382@infradead.org>
In-Reply-To: <20220608144517.124597382@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Subject: Re: [PATCH 19/36] objtool/idle: Validate __cpuidle code as noinstr
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, tony@atomide.com,
        khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
        kernel@xen0n.name, sammy@sammy.net, monstr@monstr.eu,
        tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se,
        stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
        amakhalov@vmware.com, pv-drivers@vmware.com,
        boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
        rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
        sudeep.holla@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, anup@brainfault.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
        linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
        senozhatsky@chromium.org, john.ogness@linutronix.de,
        paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
        josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
        jiangshanlai@gmail.com, joel@joelfernandes.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
        rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jun 8, 2022 at 4:46 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Idle code is very like entry code in that RCU isn't available. As
> such, add a little validation.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>  arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
>  arch/m68k/kernel/vmlinux-std.lds     |    1 -
>  arch/m68k/kernel/vmlinux-sun3.lds    |    1 -

FWIW
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
