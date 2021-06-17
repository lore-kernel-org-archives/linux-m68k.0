Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EA1C2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 21:42:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DBE261241
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 21:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFQVo2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 17:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhFQVo2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 17:44:28 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF9FC061574
        for <linux-m68k@vger.kernel.org>; Thu, 17 Jun 2021 14:42:20 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x16so6043511pfa.13
        for <linux-m68k@vger.kernel.org>; Thu, 17 Jun 2021 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wimRhWHFBrY5hP0K1VdViTCUIM83ng2w5PH4uTBAZb0=;
        b=HUJZw7QUhcPUVJhqn1vwZTKOsa5gV1koFNLLb6jsDL9DxY9fimBqaCfnA4BvrUgNX4
         YjGrvr/kLXq6wXet4uddQdqeg28K5QvSAh2poiYyUn+mgSrWGCtObFt9Amm8mi8Itd0E
         cdFv9LSz9xKwEXqDY9drVKPH6mvD/yC1x1TY5ErkDiVdF/D1HKaUOvySTuzSc6gaBEsF
         7X+HG91wfYTnq+Gli/Mk7BtG36oQuY2b2TGwPmh4miY+B5ZycCNNp0t+OOrrYvfPSi0G
         8nL+kftcMMKu8Z3u1MybWUU1fQfXdj32EqVRO2jFBl9d8zf7xC+hU83xPp+vMNY5JXJy
         SOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wimRhWHFBrY5hP0K1VdViTCUIM83ng2w5PH4uTBAZb0=;
        b=Du6AuTESIacc1R7piJdwds5KhhprHo67+CAaehgpDRuMh1oZeQyGqwKbijfJdMcajG
         MbC7y3zF1630cC4xNfIDhD4Vd+c8Lm9ZK1y7cniuK9WGMPm7BHnTdGaYe/2Ce8z/ZwpV
         dSbBYb+YBnzGVlsd2whSF9VzP7AwC6SPbSQ/SbGvMN2gNwJvE4WKTUAd1fudS0rH6gqp
         vp7cit0SgNbeKCEcafHtqG1KIQo95/8EGpxlVRRsTYGKTTuVBb8wnhXgNnMkwYu3hTRQ
         yW5zXWcMARZi9FID7zhbvLVtcjvtCYmDX005yKHnMH5YYRJzaroSTV49Sv/oHi2czvgM
         o4dw==
X-Gm-Message-State: AOAM530CcMZUJyPSs/3UmaxtcdOU811vFhU3LHJzpzd5dwcVyOCQmloe
        WJBh/UBUFNS8cnIGATI3MYWKtr2HLso=
X-Google-Smtp-Source: ABdhPJyi58GckhGjGRt1ZZHRMaXkUd1l7/Dz2Kv+J4U9NBuHDbOxaeygpY+J55XSAsSink9hEiigZw==
X-Received: by 2002:a63:b545:: with SMTP id u5mr6675627pgo.261.1623966139900;
        Thu, 17 Jun 2021 14:42:19 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:24ad:f001:d22a:9271? ([2001:df0:0:200c:24ad:f001:d22a:9271])
        by smtp.gmail.com with ESMTPSA id m2sm4921425pgv.40.2021.06.17.14.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 14:42:18 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] m68k: io_mm.h - add APNE 100 MBit support
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org, alex@kazik.de
References: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com>
 <1623907712-29366-2-git-send-email-schmitzmic@gmail.com>
 <8fad435e-e541-befe-8e3c-ccd75b3db0db@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <239d6b7c-f159-6efc-4ba7-0a9810840aff@gmail.com>
Date:   Fri, 18 Jun 2021 09:42:13 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8fad435e-e541-befe-8e3c-ccd75b3db0db@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

thanks for your comments!

On 17/06/21 6:58 pm, Finn Thain wrote:
>> -#define isa_inb(port)      in_8(isa_itb(port))
>>   #define isa_inw(port)      (ISA_SEX ? in_be16(isa_itw(port)) : in_le16(isa_itw(port)))
>>   #define isa_inl(port)      (ISA_SEX ? in_be32(isa_itl(port)) : in_le32(isa_itl(port)))
>>   #define isa_outb(val,port) out_8(isa_itb(port),(val))
>>   #define isa_outw(val,port) (ISA_SEX ? out_be16(isa_itw(port),(val)) : out_le16(isa_itw(port),(val)))
>>   #define isa_outl(val,port) (ISA_SEX ? out_be32(isa_itl(port),(val)) : out_le32(isa_itl(port),(val)))
>>   
>> +#define isa_inb(port)      ((ISA_TYPE == ISA_TYPE_AG16) ? ((port) & 1 ? isa_inw((port) - 1) & 0xff : isa_inw(port) >> 8) : in_8(isa_itb(port)))
>> +
>>   #define isa_readb(p)       in_8(isa_mtb((unsigned long)(p)))
>>   #define isa_readw(p)       \
>>   	(ISA_SEX ? in_be16(isa_mtw((unsigned long)(p)))	\
> Was the re-ordering of definitions deliberate?

Yes, it was. I remembered looking at a bug report for curl on the m68k 
kernel that was due to ordering of #defines.

On second thought, there is no prior definition of isa_inw in our case, 
so even this won't really be an issue.

>
>
>> @@ -270,6 +291,9 @@ static inline void isa_delay(void)
>>       case ISA_TYPE_Q40: isa_outb(0,0x80); break;
>>   #endif
>>   #ifdef CONFIG_AMIGA_PCMCIA
>> +#ifdef CONFIG_APNE100MBIT
>> +    case ISA_TYPE_AG16: break;
>> +#endif
>>       case ISA_TYPE_AG: break;
>>   #endif
>>   #ifdef CONFIG_ATARI_ROM_ISA
>>
> I think most of these "#ifdef CONFIG_APNE100MBIT" conditionals are
> redundant. case ISA_TYPE_AG16 should be optimized away as dead code in the
> MULTI_ISA == 0 configuration. And in the MULTI_ISA == 1 configuration, the
> logic used to assign isa_type already depends on
> defined(CONFIG_APNE100MBIT).

You're right there, too. I'll drop those.

Cheers,

     Michael


