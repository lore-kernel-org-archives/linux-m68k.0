Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937A7C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Sep 2021 15:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 644FD60EE2
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Sep 2021 15:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235089AbhI0PVk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Sep 2021 11:21:40 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:33373 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbhI0PVk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Sep 2021 11:21:40 -0400
Received: by mail-vk1-f174.google.com with SMTP id t200so7137484vkt.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Sep 2021 08:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5wb4ZX9gwgasne0NhWUEprI9AwQOWamOuZRWGphiLM=;
        b=WajIgWveieJRsFmCRddVEm+vX/Mx1r33ZjcSb7KepSGhP58+tuhLwknTg2egOq18nB
         3A4YOQVxVjxPTp/ebK8fuVDO7JlO6uNLXmNu5eR7j1v3wAwS4XmNTfkppGH9bdksrE4b
         wMmiQdWYOUbQ7CGibEtvvIpzoqtHmLVWtfz3geh8rdSmuDvYe2n5rAChPurdKR59PDhT
         9McTijEfl5EaZzByGMMRvL8vwbdY9P0aca1/VN33e6kMMV0hZXN4fObWa3/D4BaLJaPq
         dHUJPFtFAj76gnQq2cBbP35vuRnpA3GZkaaFLyBTMvEiviy1WVEdO9/hQlkuBHamqhS0
         lHcA==
X-Gm-Message-State: AOAM532fNURNbemR6+kqb4hsWccBfsq7P1EcFErsjXzO4dElfBOdPv/f
        B7SqLnwXiBu2C6Cy5UtpIrUnfmx9BXe/60MBEek=
X-Google-Smtp-Source: ABdhPJxj2OeFkxklgcIGHyfFHROJ0kJKH8P7BoepnpioKOsPmd/3DG/ainzZgT/3Vd7Z0PN8a+SyRrxXemz3PM2L1AY=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr572707vkj.11.1632756001800;
 Mon, 27 Sep 2021 08:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210927150518.8607-1-david@redhat.com> <20210927150518.8607-3-david@redhat.com>
In-Reply-To: <20210927150518.8607-3-david@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 17:19:50 +0200
Message-ID: <CAMuHMdWuRtxwRCy-x63s9BkDKk+hkXhEfZYC5pmXomzCuDBrYg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with memblock_add_node()
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 27, 2021 at 5:05 PM David Hildenbrand <david@redhat.com> wrote:
> We want to specify flags when hotplugging memory. Let's prepare to pass
> flags to memblock_add_node() by adjusting all existing users.
>
> Note that when hotplugging memory the system is already up and running
> and we don't want to add the memory first and apply flags later: it
> should happen within one memblock call.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

>  arch/m68k/mm/mcfmmu.c            | 3 ++-
>  arch/m68k/mm/motorola.c          | 6 ++++--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
