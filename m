Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F4BC4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Dec 2022 11:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiLPL2j (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 16 Dec 2022 06:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiLPL2i (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 16 Dec 2022 06:28:38 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4C32A27A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Dec 2022 03:28:37 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id h10so1442922qvq.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Dec 2022 03:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpsh6MRE6XYtx9/rCflIcIbNFehaXSviVtyQLfJ5VOk=;
        b=xxNMMNKBBL7k9DH8OEvTYoiztVmJW5G1FkFhnVEyXp7/UIcgLIkSKNjRa5PrkpWhSh
         DKorn98HivwU36pvOp3L5up3BmTd80IYfHgWc7+ES0xmD4YP30qpKnDr+xCzEvvr2iZI
         /UvxaSgVtEVmMPOKMXyqvvAvT7Z20ARy7qTPrgZW8+SV9leuGHq4dgd336UHdO1sxlcw
         B+60DAyggnlil62KqkoLYqvPU39F6TWoZgw0cH+gv4kUZoiBobq3pmBTG7TemOruotRL
         lBaEnvhbYLfwRHtpjkf2Y9JWnEu4+viEZ1YSQKn4DJLyu9a8teMulCgUNgU8h1xTec+Z
         T/Tg==
X-Gm-Message-State: ANoB5pnZIVO6df+ClyAX/m/i+iPOQBGnQFUpcO8X9Ryhhwp5eMSKDstJ
        2+CsBwyGHaGOfX8yTmVHdmiIrbqyITax5Q==
X-Google-Smtp-Source: AA0mqf5w3AMRq5bqlMgc/RY4MP1ZOIvC0HYvvY/VG9E7gzTHvOUjmZfBtVP1ZXf2O+fXQIPDkXSexg==
X-Received: by 2002:ad4:5291:0:b0:4c6:e1ba:b1a with SMTP id v17-20020ad45291000000b004c6e1ba0b1amr38576934qvr.10.1671190115742;
        Fri, 16 Dec 2022 03:28:35 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id m9-20020a05620a290900b006fa8299b4d5sm1315030qkp.100.2022.12.16.03.28.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:28:35 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3b5d9050e48so29129797b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Dec 2022 03:28:34 -0800 (PST)
X-Received: by 2002:a0d:dd4b:0:b0:370:61f5:b19e with SMTP id
 g72-20020a0ddd4b000000b0037061f5b19emr28567896ywe.316.1671190114634; Fri, 16
 Dec 2022 03:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20221115083349.1662-1-thunder.leizhen@huawei.com>
 <CAMuHMdWM6+pC3yUqy+hHRrAf1BCz2sz1KQv2zxS+Wz-639X-aA@mail.gmail.com>
 <ad09966d-9357-1c32-e491-a402af8dac6e@huawei.com> <CAMuHMdW=KXfYc3Rqz6LizJcDxRX3BzUFTPpdTpDB68sw+QPJ=A@mail.gmail.com>
 <b00bcc04-0633-bac9-76ab-572f9470901c@huawei.com> <CAMuHMdWPSeieR-sGuozd3kWGjVw85EV40irqM9aErXufifzFNA@mail.gmail.com>
 <49070ac3-02bb-a3b3-b929-ede07e3b2c95@huawei.com> <e81710a9-2c45-0724-ec5f-727977202858@huawei.com>
 <CAMuHMdWAAQNJd21fhodDONb40LFMae3V_517iT22FykCqG90Og@mail.gmail.com>
 <4aaede14-8bd3-6071-f17b-7efcb5f0de42@huawei.com> <66ec4021-b633-09ba-73ee-b24cdb3fa25a@huawei.com>
In-Reply-To: <66ec4021-b633-09ba-73ee-b24cdb3fa25a@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Dec 2022 12:28:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUvPRvEvGNmB9WO0yg=w04g4q2_1hfOypqEnrYkFr6YQ@mail.gmail.com>
Message-ID: <CAMuHMdVUvPRvEvGNmB9WO0yg=w04g4q2_1hfOypqEnrYkFr6YQ@mail.gmail.com>
Subject: Re: [PATCH v9] kallsyms: Add self-test facility
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Josh Poimboeuf <jpoimboe@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        David Laight <David.Laight@aculab.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Zhen,

On Fri, Dec 16, 2022 at 10:43 AM Leizhen (ThunderTown)
<thunder.leizhen@huawei.com> wrote:
> On 2022/12/16 15:42, Leizhen (ThunderTown) wrote:
> > On 2022/12/15 22:51, Geert Uytterhoeven wrote:
> >> On 30f3bb09778de64 with your debug patch v2:
> > I've set up the qemu environment, and I'll try to solve it by tomorrow at the latest.
>
> It seems that the problem is still strcmp(). After I commented strcmp() in
> arch/m68k/include/asm/string.h, and force it to use the one in lib/string.c,
> it works well.

I can confirm that.

One difference is that the one in lib/string.c always return -1/0/1,
while the m68k version can return other negative or positive numbers.

However, adding:

       if (res < 0) return -1;
       if (res > 0) return 1;

to the m68k version doesn't make a difference.

Renaming the m68k version (changed to -1/0/1) to m68k_strcmp(), and
the generic version to lib_strcmp(), and adding a wrapper that calls
and compares both, shows that both functions do return the same value,
and the test succeeds.

Moving the m68k version inside lib/string.c makes the test pass, too.
So it must be related to the function being inline, and gcc making
(incorrect) assumptions...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
