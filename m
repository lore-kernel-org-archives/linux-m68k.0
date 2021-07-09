Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB5C07E96
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 00:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 397A661466
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 00:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhGIAIF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 20:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhGIAIC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 20:08:02 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03705C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 17:05:20 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id u14so8104270pga.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2xYoJd+u1uIn3m/T6hnVkqZGXIPpC6Bhp8QkHfzqepk=;
        b=PShLz/qlYiPAk7Q2ZPb96W6K/svGpctFVkEOHACNdiRWv8CVBN8gNG3m9Y7eOubr1p
         qPAusiQO/BC+eP2OGHQkplAThWDAPiqVtWWXuDArhtRicqoGLOrygwymyrniY+4hp8am
         Q3iR9fRSZhwQ/UrIpVT0RmFRdCkoulnF7Azirov3/NR1m9eusqzl436voIw517mCHG26
         j/HR2u1QbRjVZYJepi6yyix/vGIMZG84yMADJuYCwUQyjAUC04hp+5+/NPyx3at+OeKw
         qMaDepFBmcDgrFSe9D7tCvLGJdQ4dHQ68tp1kCuXqFZzJ0l+ViRoppdTuoHkLz7ZBWjy
         g6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2xYoJd+u1uIn3m/T6hnVkqZGXIPpC6Bhp8QkHfzqepk=;
        b=B4DhRYcHLRBzyc8Q+07re4rBrAobXpMUYe0o8x8PLuWIJOkAS7d7DFUN63f57PxcZa
         t9GGl1Bg6Y4MNPcVFtrbBWivc6zVj4k7860AZBPAGffF3e1g9UcwY6uWLT9JTfplE0/o
         B+Ea1YbDzr73FEoVuZS7eCfqF6lgbTMQbKwzF8RUdd3HZDIPYUch9UR8nkZAzBdznGNJ
         EDru+Yy8DCfkdNk4zVcMctm7pOUs44Y0YGQnf3AaVqmquIsAULjGn7FIs6sop0RUSSWz
         0EzOmP5pvdt8QdcFZBAvGU0SK6MSrQZq/gHMOrqZbn2lbVrGovmuxqQDcsh6odnWbRZI
         sqmA==
X-Gm-Message-State: AOAM5317jbJ6sAfI0hL9M5cNd6fndvkEW2RqqzC8Bl5xmc1F+UtzJZqH
        ropzmARGqMb2HWKDUaeC+4CZPDJltZI=
X-Google-Smtp-Source: ABdhPJxFEsVqz/AoPMrYmUJJKaODOdB6gLo9tGlf2oTeYsr+ZJzOCbjMVmm4E/hmbnLXgj8BCd3OQQ==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id t15-20020a62ea0f0000b02903198eef5ff1mr31949625pfh.74.1625789118985;
        Thu, 08 Jul 2021 17:05:18 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a5c1:bb20:811d:7b3b? ([2001:df0:0:200c:a5c1:bb20:811d:7b3b])
        by smtp.gmail.com with ESMTPSA id n24sm10819040pjq.51.2021.07.08.17.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 17:05:18 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <CAHk-=wj2j-9g_bkuGPNMfjcs=X1E74h0Zo+zghT86bva8H+5Ng@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5217860f-6574-24a3-2c6f-a827ccf3c123@gmail.com>
Date:   Fri, 9 Jul 2021 12:05:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj2j-9g_bkuGPNMfjcs=X1E74h0Zo+zghT86bva8H+5Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On 9/07/21 6:20 am, Linus Torvalds wrote:
> On Thu, Jul 8, 2021 at 5:57 AM Christoph Hellwig <hch@lst.de> wrote:
>> I've force pushed a new version to the branch, can you give it a spin?
> Please stop playing broken games with __constant_copy_to_user().
>
> Now you didn't just break the return value, you broke the actual copy
> too. When it is supposed to do a 4-byte copy, the code now does *two*
> 4-byte copies, because that's the way __constant_copy_to_user_asm()
> works - it always does at least two accesses, and then the third one
> is conditional.
>
> So that "6, l, l, )" in
>
>          case 4:
>                  __constant_copy_to_user_asm(res, to, from, tmp, 6, l, l,);
>                  break;
>
> literally means "try to do 2x 'l' sized moves (but not a third one),
> and return 6 if it fails". All of which is very wrong indeed.

In order to get the correct number of bytes copied, the patch would have 
to look like:

        switch (n) {
         case 1:
-               __put_user_asm(res, *(u8 *)from, (u8 __user *)to, b, d, 1);
+               __constant_copy_to_user_asm(res, to, from, tmp, 1, b, );
                 break;
         case 2:
-               __put_user_asm(res, *(u16 *)from, (u16 __user *)to, w, 
r, 2);
+               __constant_copy_to_user_asm(res, to, from, tmp, 2, w, );
                 break;
         case 3:
                 __constant_copy_to_user_asm(res, to, from, tmp, 3, w, b,);
                 break;
         case 4:
-               __put_user_asm(res, *(u32 *)from, (u32 __user *)to, l, 
r, 4);
+               __constant_copy_to_user_asm(res, to, from, tmp, 4, l, );
                 break;

and __constant_copy_to_user_asm() changed to deal with an empty s2 
parameter. Probably too much work.


>
> So commit d36105c942e0 ("m68k: simplify the __constant_copy_to_user
> implementation") is very very broken.

Doesn't appear to matter - though I'll back out those changes to be safe.

Note that in this version, faults in __put_user_asm used from 
__constant_copy_to_user will return -EFAULT, not the remaining number of 
bytes to be copied, which might get confusing for the caller.

Cheers,

     Michael

>
> But the rest looks good to me. Of course, I entirely missed the fact
> that Andreas pointed out - "instr" was inside a string - so who knows
> what I missed this time.
>
>                 Linus
