Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E9EC6FA99
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Mar 2023 20:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCEUo0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Mar 2023 15:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjCEUoZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Mar 2023 15:44:25 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79EDBDD9
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Mar 2023 12:44:23 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y11so8191931plg.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 12:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQEhAEnCoSqPNLqIdWFb7wfcuPxRiAiR2KEKFk8XhXg=;
        b=XsgLdLib5YxD3UoqpUHhBtiMXrRSCSRmpOEeXQH70qS3WFbdWPt1QYhHdkVRA9Gj21
         mEDZTI0L9f5gUoHNGUz8dYsJKIca+pLBKlsRCwlYQKvVTuWV6OlYHhFz17PFlGmk2qai
         w48jZGK8k3O71v2p3Ca68xusJCiIKgpGuvqnOrH57yLfgW4OTASVw0mgHUaeGODiWwxk
         x10bxn2cw3B9cZ28kNFwxInwQIFf7GHfVfivx+Mb0UN+PaMJzNLbgbuQI61l0y63Tqnq
         f43J6fG1L58LZBfsbeLd8oQiz0acVMwoTIHqcI0gtuJJD7VWsi/T2hq99QSLOBlqWZNa
         wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQEhAEnCoSqPNLqIdWFb7wfcuPxRiAiR2KEKFk8XhXg=;
        b=kVgqiQD/BV7ZtalWO0hPqTYpsQgd5TtVTt5b4URS+YcpsJIkKcJsr0cyg3iFTvllzA
         fwUENIkDbnvrd5y3EB5xhtiBdMUIrZeIQf2HSzqS2DOO7uMDCRoJIhAxvhnlMJPcK1Ee
         tsbFT8bpZj07EZCkx60i15THo6p0XexHckqlZg1xvQ/+9KpSV/9yK2hBtciswF6X+uBo
         nWbJSlrFRd5utbcrWT8VEB5qx4pHUJxVhJoTXlF1OP06O2QG5tyinQxkHMBYE7BmVzez
         gDaaEIr74K5CFDclr3SdxubpVwpNX3EZlLiZi6qA3GxYteDT5XOoeHKyo/z/9+qfaOqZ
         7WSg==
X-Gm-Message-State: AO0yUKXq7oks7Rma1BqJF9ARfVt/21QsUCylJP5/wZpJkjd03FX495mk
        FAZ3nzW+3mWPX1OcYJ3yvXI=
X-Google-Smtp-Source: AK7set/RbEx9jtFCpRX+pR8Y+f6oCnVFm4mqzGAENK55LPzQH1+61UY9MM+V+7mTev/dOMa3U25bEQ==
X-Received: by 2002:a17:903:41ca:b0:19c:be63:a9ce with SMTP id u10-20020a17090341ca00b0019cbe63a9cemr9066698ple.4.1678049063223;
        Sun, 05 Mar 2023 12:44:23 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:c02f:c6b5:6aff:ae1d? ([2001:df0:0:200c:c02f:c6b5:6aff:ae1d])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902690700b001991942dde7sm5106140plk.125.2023.03.05.12.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 12:44:22 -0800 (PST)
Message-ID: <0b00a30e-cb7f-d42b-7d16-0ae8d50ed916@gmail.com>
Date:   Mon, 6 Mar 2023 09:44:17 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 13/34] m68k: Implement the new page table range API
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20230228213738.272178-1-willy@infradead.org>
 <20230228213738.272178-14-willy@infradead.org>
 <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com>
 <ZAS1Lq6//oO/0PXe@casper.infradead.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZAS1Lq6//oO/0PXe@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew, Geert,

sorry, I missed that one when it got posted ...

On 6/03/23 04:28, Matthew Wilcox wrote:
> On Sun, Mar 05, 2023 at 11:16:13AM +0100, Geert Uytterhoeven wrote:
>>> +               while (nr--) {
>>> +                       __asm__ __volatile__("nop\n\t"
>>> +                                            ".chip 68040\n\t"
>>> +                                            "cpushp %%bc,(%0)\n\t"
>>> +                                            ".chip 68k"
>>> +                                            : : "a" (paddr + nr * PAGE_SIZE));
>> As gcc (9.5.0) keeps on calculating "paddr + nr * PAGE_SIZE"
>> inside the loop (albeit using a shift instead of a multiplication),
>> please use "paddr" here, followed by "paddr += PAGE_SIZE;".

Are we certain that contiguous vaddr always maps to contiguous paddr?

If not, I'd suggest we increment vaddr inside the loop, and use __pa() 
each time:

> +++ b/arch/m68k/include/asm/cacheflush_mm.h
> @@ -235,13 +235,14 @@ static inline void __flush_pages_to_ram(void *vaddr, unsigned int nr)
>          } else if (CPU_IS_040_OR_060) {
>   
> -               while (nr--) {
> +               do {
>                          __asm__ __volatile__("nop\n\t"
>                                               ".chip 68040\n\t"
>                                               "cpushp %%bc,(%0)\n\t"
>                                               ".chip 68k"
> -                                            : : "a" (paddr + nr * PAGE_SIZE));
> -               }
> +                                            : : "a" __pa(vaddr));
> +                       vaddr += PAGE_SIZE;
> +               } while (--nr);
>          } else {
>                  unsigned long _tmp;
>                  __asm__ __volatile__("movec %%cacr,%0\n\t"
>
(just edited Matthew's patch in the mail editor, untested, may not apply 
cleanly ...)

Cheers,

     Michael


