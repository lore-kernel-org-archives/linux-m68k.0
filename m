Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B82DC11F64
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:42:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C55161CF6
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235708AbhF1XpC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235667AbhF1Xov (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Jun 2021 19:44:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED204C061766
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jun 2021 16:42:24 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g21so13903995pfc.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jun 2021 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MnOd9iaFXNVD5FJdstRfyB3AFTdce3B7edCsrT/B65c=;
        b=pqa8SXQ/hrN3EE8tWnQaXTgQQ3IZBW/4UPp07rsEpJERt1vDmlBqwfOVQJuTRyq0Am
         H/71eemQRinvfC1+TvsMm3hta9jb1/e0qATCWojjxQKaLzr4Oml0uSu5Xq0jVZVXJqER
         MDi/VtgB+XdWcx9atuL8LQkkSpJ0xM/te+EfGO7nhhSi9Mhs8zUsnBMZEpBTkGIA4Fpk
         3pUjAvMP3WS/7h60szKRz131Yf2UsqM8p6CgL0/4ZV5qJrWEmM56TyOTQZFHm/pbrDd7
         L/MwUK09uULPkJsmlecXAHPFUVAJaGDsqbKUmRTCqPFtorFVPxlMJpH98IJ4wEi9vvlQ
         LPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MnOd9iaFXNVD5FJdstRfyB3AFTdce3B7edCsrT/B65c=;
        b=tl3+BPF63ATgdLtsZpQf3QUOQGI0NHvr6t4VXLIK3TuKmAUYdUmkADPfYW06ZfKBNj
         9EmKC9VYYsEdB0LmCnkVpmTi58JoIDFxww9IkV80TLsg2xK4LVqgFWx2jCQcmn75BTsC
         jsH0p4boVxxWI/bq1mIJ05CPvZ4Zc77opixCMEhQpRLyIhu80qHofkFj14LwyYZRV1h2
         ihNYIpav16yUE4V/LCd1cNmK+/GQwDFb0NyJZOYk90/EfNWmSIPp9cjDREo5NZPBwAoj
         lhIQSCN5kjhBQ6ycFqeA1/obaeSm5cRoftPMaLao6bCoTw9YHxMOTYoOonEPk+I92MTz
         3EtQ==
X-Gm-Message-State: AOAM531vqkPAarAGpn1BmxV3JXzAUoz/B38NJW0fRE6WrbPreWXbBxQF
        omRQNZ1lQR+OXfjturmJ6TY=
X-Google-Smtp-Source: ABdhPJz/f2/QHZHxYzQmy+94Nkod9KHgsQwGFSUCdzNUYFhI6D1IVCfUxlSeGgG7NhfUSC7zGxB1OQ==
X-Received: by 2002:a05:6a00:23d0:b029:2de:c1a2:f1e with SMTP id g16-20020a056a0023d0b02902dec1a20f1emr27465201pfc.60.1624923744460;
        Mon, 28 Jun 2021 16:42:24 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:1c9b:7d7f:b312:1fae? ([2001:df0:0:200c:1c9b:7d7f:b312:1fae])
        by smtp.gmail.com with ESMTPSA id m21sm15768932pfa.99.2021.06.28.16.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:42:24 -0700 (PDT)
Subject: Re: [PATCH 0/9] Refactoring exit
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>,
        Kees Cook <keescook@chromium.org>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
 <YNULA+Ff+eB66bcP@zeniv-ca.linux.org.uk>
 <YNj4DItToR8FphxC@zeniv-ca.linux.org.uk>
 <6e283d24-7121-ae7c-d5ad-558f85858a09@gmail.com>
 <CAMuHMdXSU6_98NbC1UWTT_kmwxD=6Ha5LJxFAtbSuD=y78nASg@mail.gmail.com>
 <7ad6c3a9-b983-46a5-fc95-f961b636d3fe@gmail.com>
 <CAMuHMdUi5Ri=GmWzS8hb7dkfPyAE=HpQHg6OsKSLDse_364E=g@mail.gmail.com>
 <dbb4ca2d-a857-84f0-f167-5ad4e06aa52b@gmail.com>
 <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <36123b5d-daa0-6c2b-f2d4-a942f069fd54@gmail.com>
Date:   Tue, 29 Jun 2021 11:42:16 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVKdZNBU-cTUY0zotA5DmtQ=dxH+iFY0_GX=4DzqpycZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 29/06/21 9:18 am, Geert Uytterhoeven wrote:
>
>>>> The question then is - will bdflush fail gracefully, or spin retrying
>>>> the syscall?
>>> Will add to my todo list...
>>> BTW, you can boot this ramdisk on ARAnyM, too.
>> True. I can't find that ramdisk image anywhere - if you can point me to
>> some archive, I'll give that a try.
> http://ftp.mac.linux-m68k.org/pub/linux-mac68k/initrd/

Thanks - removing the if (func==1) do_exit(0); part does give similar 
behaviour as before - kernel warns five times, then shuts up (without 
change, warns twice only, and /sbin/update no longer runs).

Removing the syscall from the m68k syscall table altogether still gives 
a working ramdisk. /sbin/update is still running, so evidently doesn't 
care about the invalid syscall result ...

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
