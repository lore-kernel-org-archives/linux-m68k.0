Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E005FC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Jan 2022 08:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351373AbiALIFm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 03:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237577AbiALIFl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Jan 2022 03:05:41 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A411C061748
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jan 2022 00:05:41 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id z3so2986445plg.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jan 2022 00:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=auwyob08IbwW94XZ4f2/DsmTnLD3tEUnrhYCGAW4mV0=;
        b=E7CZjNp8ew/pIigi8/9fGrQIVAoLQrh14ruflwowcQicZ4GkxWA8SdA/yuUPMnlaJM
         pXIe/8A62KQUNV7ITwg0TmIuUG6SBpjyQs4cmWgKVNZHcIGjtWG9G7I4slFXoLpGLLa0
         1ueDK/pm6PgGWpLoNoPngyoxdih2T8odceBi6oXniuUoAbB5V2OApVtgiWI/T1WOVxhc
         Tep/DfP9PlB8NC71xSYYizghYjBi+arCrSc84egFVvnTUMb95p+5Zy1YTI5Nm/Anm38o
         MJ1/qBmyHdou3lQjUnV17Xrv6X9mDFPGJf7KfLwhvXo1S9glIsaasLQ1oc1Ek4UZ6HWH
         CTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=auwyob08IbwW94XZ4f2/DsmTnLD3tEUnrhYCGAW4mV0=;
        b=xRNWhm9ac4fjWCzZKb1CNTa2qDyTE7mcF1316YPKJR/GWQ7AEU8IdGErIsWbapVYSi
         WOZnuzzFD5MjwvDJ7XVM88onxVTnAJtfiyIglJYP6F3Y5CaUL1UKwXNOmPBw1Uqjja6m
         9Yvs+Hdf4TH1MqZp5Zw/hUbwEvL2XUZThEClMofX42AV1cAtIYOWrdBFFcPlYnEG2jLo
         keOp/oBRWsUNmoiuFUFTNfsKSDaq/f5NWKbqbut70oR+RB0wWjsUG6a/RN7cm1x9S9J/
         F7ZDUWSrWzkdPe0Io8U610Zxwancdeq1aTWRxlAOmnooyrKM+elDWNlP2yD8CQPA72XK
         PWBg==
X-Gm-Message-State: AOAM533doOc12yQy0QcOa3g5Nv7ycRhsAtn+Ycl+5j+ZHyU3HKbO1ACu
        vzKYKC6jvfd4GvPOnXMJALiP/ch1502L1w==
X-Google-Smtp-Source: ABdhPJzD7+K8uKCTMJoKLJqSdgcxNQz56yyK1twt2mzjiP2zQ/JTpowXz/ezrXCHOxcVLhActIDfuQ==
X-Received: by 2002:a17:902:dac5:b0:14a:5f50:ed0f with SMTP id q5-20020a170902dac500b0014a5f50ed0fmr4286228plx.58.1641974740890;
        Wed, 12 Jan 2022 00:05:40 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id x2sm1666008pgo.2.2022.01.12.00.05.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jan 2022 00:05:40 -0800 (PST)
Subject: Re: [PATCH 08/17] ptrace/m68k: Stop open coding ptrace_report_syscall
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <87r19opkx1.fsf_-_@email.froward.int.ebiederm.org>
 <20220103213312.9144-8-ebiederm@xmission.com>
 <CAMuHMdWsNBjOJh0QEx9sppA9x3WoL8H2icqukNqECFhOPremjw@mail.gmail.com>
 <YdxcszwEslyQJSuF@zeniv-ca.linux.org.uk>
 <CAMuHMdX9nhUQe_jeQCUtXeQgcQ5MBiHpPiRexh86EssoHNtJ3Q@mail.gmail.com>
 <acf7b627-2dec-c76c-2aa0-6b4c6addd793@gmail.com>
 <d660267-ce4f-e598-9b40-5cdbb4566c7@linux-m68k.org>
 <6060f799-d0c5-e4c2-a81c-2bd872ce3d5a@gmail.com>
 <CAMuHMdXJLfOKk-+gMbzVvG50vn8RBVsCdJAaysYWph01Ef-WrA@mail.gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <98e43c68-0a4b-004a-bb1b-015fc80a1724@gmail.com>
Date:   Wed, 12 Jan 2022 21:05:32 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXJLfOKk-+gMbzVvG50vn8RBVsCdJAaysYWph01Ef-WrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 12.01.2022 um 20:55 schrieb Geert Uytterhoeven:
> Hi Michael,
>
>> What's the other reason these patches are still stuck, Geert? Did we
>> ever settle the dispute about what return code ought to abort a syscall
>> (in the seccomp context)?
>
> IIRC, some (self)tests were still failing?

Too true - but I don't think my way of building the testsuite was 
entirely according to the book. And I'm not sure I ran the testsuite 
with more than one of the return code options. In all honesty, I had 
been waiting for Adrian Glaubitz to test the patches with his seccomp 
library port instead of relying on the testsuite.

Still, reason enough to split off the removal of syscall_trace() from 
the seccomp stuff if it helps with Eric's patch series.

Cheers,

	Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
