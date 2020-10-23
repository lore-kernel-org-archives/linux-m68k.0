Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870C2C388F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 16:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B9D6208C3
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603471268;
	bh=YTbvqlYcmdQGz0rhIsWqBFzs48/QWKDmqbdbV3Ww6Gk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=NmEh7bIDlPYccfiU8S5xwrAjjctl9pYvRW5p4Fq5LVXbqcGbNqyO5JxNUOXCA6u97
	 757/HuuH7gPVYSHClAPZ24lk7c3uZBxPB14uzqeNVhyiiwM89Y0ML49COUjUQ3RQ62
	 Wf9ZHiJF4YXwl8F02EZqRCX32eM2jQIXqS68cZEI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751629AbgJWQlG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750718AbgJWQlF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 12:41:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69883C0613CE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 09:41:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m16so2246653ljo.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
        b=bKJlp5Zi29qle5D9opf4NXlbOWJhqSLbkPTTzs3cyEfB6yY5yL2nVp+B2qxgDBuenW
         Ld6FBX1RcXCS8NhhbFgQYSvjxx2DmHG9Bt0hUX7JvJOKxhXXzfzBAxggPWaZ91DMIf/e
         dpBAABcXoHgqg2SosGBxhJHT4bBdoCmPY82fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
        b=qvy6uix/5WXAdtVwtxRK2J/P0V8muymTCRNpEyQHop4jM3qnKN06Mrunhb5EqURoXp
         9AiLFgoHA4blNrN8KkYfe/aSmcmzu37e85lXmtrstVtitBeBCsjwOepG5hNk0jW0T9Kj
         WxS14D+K462d7aSx8CMMFQPG+hywu2I4dsHduvBVF7dlSa+s4Djl9z0sUXXQGsAC2GfW
         hX7AsyfH6dB134StYUROYTj08oGVIIRmpXbF4S3XXNu32Pg9skf2n8wrY+ysNjPDWCj2
         0XdUVSmE/hSgSSKr2BX/v9/J/XadouEjQKMExn9RWsSbCc/x8iylsa3/Q6W3jTzb7hX3
         1K8A==
X-Gm-Message-State: AOAM533osDyF0lA+whFpY0QBBFwXmT3c6IjiUN221wQz2GhYfqlc4ONT
        NqaEwe+MP/LxKxUBwSqrCbbEMzAuOiMElQ==
X-Google-Smtp-Source: ABdhPJz6sXzvivPmCYwXdeC+HpWl+edAcEx+PqB1S5DVf6sMFSfyjzJJytxOC+OT9eMtqssIPPz3Hw==
X-Received: by 2002:a2e:9dd1:: with SMTP id x17mr1140328ljj.219.1603471261581;
        Fri, 23 Oct 2020 09:41:01 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id m10sm213054ljj.70.2020.10.23.09.41.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 09:41:01 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id a4so2220811lji.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 09:41:00 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr971141lff.105.1603470790607;
 Fri, 23 Oct 2020 09:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com> <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
 <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
In-Reply-To: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 09:32:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
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
Content-Type: multipart/mixed; boundary="000000000000e2112705b259227d"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

--000000000000e2112705b259227d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2020 at 8:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> >
> > That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> > could break something else), but the obvious first step of rearranging
> > so that the ptr argument is evaluated before the assignment to __val_pu
>
> Ack. We could do that.
>
> I'm more inclined to just bite the bullet and go back to the ugly
> conditional on the size that I had hoped to avoid, but if that turns
> out too ugly, mind signing off on your patch and I'll have that as a
> fallback?

Actually, looking at that code, and the fact that we've used the
"register asm()" format forever for the get_user() side, I think your
approach is the right one.

I'd rename the internal ptr variable to "__ptr_pu", and make sure the
assignments happen just before the asm call (with the __val_pu
assignment being the final thing).

lso, it needs to be

        void __user *__ptr_pu;

instead of

        __typeof__(ptr) __ptr = (ptr);

because "ptr" may actually be an array, and we need to have the usual
C "array to pointer" conversions happen, rather than try to make
__ptr_pu be an array too.

So the patch would become something like the appended instead, but I'd
still like your sign-off (and I'd put you as author of the fix).

Narest, can you confirm that this patch fixes the issue for you?

                  Linus

--000000000000e2112705b259227d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kgmh3alt0>
X-Attachment-Id: f_kgmh3alt0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRl
eCBmMTM2NTk1MjMxMDguLmQwMDZhZjkxNWQ0YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAt
MjExLDEzICsyMTEsMTUgQEAgZXh0ZXJuIHZvaWQgX19wdXRfdXNlcl9ub2NoZWNrXzgodm9pZCk7
CiAjZGVmaW5lIGRvX3B1dF91c2VyX2NhbGwoZm4seCxwdHIpCQkJCQlcCiAoewkJCQkJCQkJCVwK
IAlpbnQgX19yZXRfcHU7CQkJCQkJCVwKKwl2b2lkIF9fdXNlciAqX19wdHJfcHU7CQkJCQkJXAog
CXJlZ2lzdGVyIF9fdHlwZW9mX18oKihwdHIpKSBfX3ZhbF9wdSBhc20oIiUiX0FTTV9BWCk7CQlc
CiAJX19jaGtfdXNlcl9wdHIocHRyKTsJCQkJCQlcCisJX19wdHJfcHUgPSAocHRyKTsJCQkJCQlc
CiAJX192YWxfcHUgPSAoeCk7CQkJCQkJCVwKIAlhc20gdm9sYXRpbGUoImNhbGwgX18iICNmbiAi
XyVQW3NpemVdIgkJCQlcCiAJCSAgICAgOiAiPWMiIChfX3JldF9wdSksCQkJCQlcCiAJCQlBU01f
Q0FMTF9DT05TVFJBSU5UCQkJCVwKLQkJICAgICA6ICIwIiAocHRyKSwJCQkJCVwKKwkJICAgICA6
ICIwIiAoX19wdHJfcHUpLAkJCQkJXAogCQkgICAgICAgInIiIChfX3ZhbF9wdSksCQkJCQlcCiAJ
CSAgICAgICBbc2l6ZV0gImkiIChzaXplb2YoKihwdHIpKSkJCQlcCiAJCSAgICAgOiJlYngiKTsJ
CQkJCQlcCg==
--000000000000e2112705b259227d--
