Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA19C55179
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30DBD20878
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603468393;
	bh=mriDfNZeSOsY3E7iF8bTx6Iue1eFMbjdN4unfPYRSRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=lJUkCRSTuHuWctFXt3AuJSdgDtRBsy3tvwdF9JgUK1kwMfoCnXQbeVQeIK5wBruMg
	 rs0QGlr5+z7H3dgzzx1l0nfFB0fYcxvriN4mOQQOz/PkWN3ga0ikFDZMocigaNBrSH
	 Ugh5BpsPqirH4i9I8BvGY5havU2eB3a1vLx2sF6U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464148AbgJWPxM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 11:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464128AbgJWPxL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 11:53:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F5EC0613CE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:53:11 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d24so2066886ljg.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=So975owvkkTFfYXQ470Q4DlssmIVIFu2QdqnJrTF8xg=;
        b=TzWUN3CTm+h3r1g9oyCsI8lQvw43xzR9vIG57jNVIMScon9dkhOPSHSU0YuPTCTEbW
         xSUTXNkTa/xHcxjOZm+H+owVFWXNWx30+II0u/JJDBaUgnHNJQKAZRQgLvSR8UT7JBoq
         5hUnMcwfEz4zN7MfPmgGe/s+oSgXWn8ttaA2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=So975owvkkTFfYXQ470Q4DlssmIVIFu2QdqnJrTF8xg=;
        b=kWHCveqbGSRzjm3gvS6m6Xg2yZ8wwgmGKIkFRd4yAiFDrT9tlrYGu151JovnK9NvcC
         F6dxexBULf5xNuuUO21jRt58ABkgrS2Ovt2KapcHZQktsdBAchSsFgeDjeL4ypsQbUvA
         5R4tSuzEN+j60bxoxnD+UkGAZj22pYmymPzNIowbeKDynQ9MO8c7G9x62LdxK2wbTqJw
         7rHMBuNSKUR4leItCvXsWQP29OTm0yXMSY4e826rrOf5zwDG1NXwLUOnc88sSKumvsQO
         3lWK5/0fuHruzk8ySF2FytuiEifGa3eLIdMCodb9elTQwQGO2CjaBF033BZ69sA+txJr
         rmPA==
X-Gm-Message-State: AOAM532PtvrR5JVvfCSvNKjXS7+hgJOX9aTlGP4gpCCupb1ZSo6a+2BA
        gf/Pkm1V2fDT3AUMsvuj5HMLj31PFrmEjA==
X-Google-Smtp-Source: ABdhPJzwmjBiBdWI5MDF8Xt3JrkXQ33hoYUmmhTdEb42UfaM1KJgxbVJYzxqVFzfMJRBL16/jpWmVg==
X-Received: by 2002:a2e:54f:: with SMTP id 76mr1108447ljf.73.1603468389360;
        Fri, 23 Oct 2020 08:53:09 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id n2sm173634lfa.24.2020.10.23.08.53.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 08:53:07 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id h20so2076954lji.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:53:06 -0700 (PDT)
X-Received: by 2002:a2e:898c:: with SMTP id c12mr1248002lji.285.1603468386475;
 Fri, 23 Oct 2020 08:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com> <20201023050214.GG23681@linux.intel.com>
In-Reply-To: <20201023050214.GG23681@linux.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 08:52:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBjUvjN_Mw2Oo5XMUJFSREi3d9AHTSFmgp-a42ZH_K_w@mail.gmail.com>
Message-ID: <CAHk-=wjBjUvjN_Mw2Oo5XMUJFSREi3d9AHTSFmgp-a42ZH_K_w@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 22, 2020 at 10:02 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> I haven't reproduced the crash, but I did find a smoking gun that confirms the
> "register shenanigans are evil shenanigans" theory.  I ran into a similar thing
> recently where a seemingly innocuous line of code after loading a value into a
> register variable wreaked havoc because it clobbered the input register.

Yup, that certainly looks like the smoking gun.

Thanks for finding an example of this, clearly I'll have to either go
back to the "conditionally use 'A' or 'a' depending on size" model, or
perhaps try Rasmus' patch.

              Linus
