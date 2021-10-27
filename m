Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D95C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 06:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50E66610CA
	for <linux-m68k@archiver.kernel.org>; Wed, 27 Oct 2021 06:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240068AbhJ0Gsx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 Oct 2021 02:48:53 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:36413 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240056AbhJ0Gsw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 Oct 2021 02:48:52 -0400
Received: by mail-ua1-f46.google.com with SMTP id e10so3040539uab.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 23:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3OYuluJJxgLVvFCzRNdVWcBJVm4Oc75q+PDZtzI47A=;
        b=THNYA0iHymNjRj7+2CIh4ssmbdevjFDjwGewufsMKLYweaHwX1E+0AnOOys9C1WsqD
         pd3ZEzSG9MSXSRVQNSfqdyN4HLMzellVamhtxP+/Urvz35NCvfZ8VF7NN3Mz38iyIoqd
         Goy+zz4sfaocOPgJDEsN0+itRoPpBlNJ5j2k7qJoYaJmXSjIyeCC+wGgCz7OBPA5r1s0
         opz/hUkMDt86SSc/Pk/lcsVIL7HcMx2/1dX/pohETayEoD/DX7UlD/YMNTTi+zj4csWz
         Mo4+HVwcoU1ro+d2QVadGLf4myY2NY4l5EGQ4KmAHMxQlXDy/Qrv0dxwGJi7X9At4nMA
         XJOg==
X-Gm-Message-State: AOAM53084at1jsSJhBzCXWyaV4OEHhGCQlsrY4XAgw4dM6r0sFgHLao9
        PILrvtZcv5CL/KuNebrqJEj7/ec2Dq8VXQ==
X-Google-Smtp-Source: ABdhPJx8gK4uMx8cRUXSfKlpBQZLP63GafGSmu/Vkz/GRWpCHr/DQuyMyuTjJ2FzZH8q728CYeHMLw==
X-Received: by 2002:ab0:2a06:: with SMTP id o6mr28560149uar.113.1635317186325;
        Tue, 26 Oct 2021 23:46:26 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 3sm3758198vsq.1.2021.10.26.23.46.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 23:46:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id e2so2983582uax.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 23:46:25 -0700 (PDT)
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr29056379vsl.9.1635317185074;
 Tue, 26 Oct 2021 23:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026173822.502506-1-pasha.tatashin@soleen.com> <20211026173822.502506-7-pasha.tatashin@soleen.com>
In-Reply-To: <20211026173822.502506-7-pasha.tatashin@soleen.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Oct 2021 08:46:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWKY=R8=RGfHosSq_YcvsB1Ub8VURJ=uwHCJidAJN5EA@mail.gmail.com>
Message-ID: <CAMuHMdWWKY=R8=RGfHosSq_YcvsB1Ub8VURJ=uwHCJidAJN5EA@mail.gmail.com>
Subject: Re: [RFC 6/8] mm: rename init_page_count() -> page_ref_init()
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        william.kucharski@oracle.com,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 7:38 PM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
> Now, that set_page_count() is not called from outside anymore and about
> to be removed, init_page_count() is the only function that is going to
> be used to unconditionally set _refcount, however it is restricted to set
> it only to 1.
>
> Make init_page_count() aligned with the other page_ref_*
> functions by renaming it.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

>  arch/m68k/mm/motorola.c  |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
