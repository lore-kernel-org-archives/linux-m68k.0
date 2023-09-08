Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F911EC875F
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Sep 2023 00:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbjIHAqW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 20:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjIHAqW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 20:46:22 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA131BD3
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 17:46:18 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso11466275ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Sep 2023 17:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694133978; x=1694738778; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBzMi7nuJEjnLrIfSvx0g5ii+P5l6wXDMWk+6BeTQpU=;
        b=o6dFEQnSfiUzMHdWNLMBmnS5Zn0X5w2erCzob/7Tg+KINMf7QILWDD0G+T/mOpsUhA
         iD6po3P577x1/Rp0sTutQ4UdLH5GYjqRLgDbK83LOgZb8E8bU0XQey8VGPO0gCLFTDyb
         nU2eFk197r1yGha3FJX8izH6eEyYoMbPLWWNoMsj9d/ciUt4ARiwfKo0tWxugrOEzvgn
         UHjS4EKgwUkUME4CvSh7bysyIgqORk69Vorm2NsEiobE/hgbsENuGsY2hGr1DMtHlDK6
         ykb3PZjaETr1HKfstTHd09C4iZgZ8HB9ZeRHLI5Z9Q3wgWOm2WyjCaqiqoHhCeYeUDQ1
         s2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694133978; x=1694738778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBzMi7nuJEjnLrIfSvx0g5ii+P5l6wXDMWk+6BeTQpU=;
        b=Xbkq5Ijasju8X5CkvJnmQAbux0nPCLvuSu4rKy3MyXa/qsquKnXoVS4i7YwcODzxob
         8WMtG3e+cbjCyHysD10irA87Cad/y4bqKlpxbG/Mw2bSJ5ANArNeaK3if3rWZjFF/nZV
         K/HB2Rm5t11FSj/YHAtJYoxCQtT28p7b7f4Fg1WM80S43BWQXFVeUCuVZn1t5iXd7F1q
         lIwWSf4RMTJUJEo0XuXOWkXaNur5WmkIgVeygx7P+t3FEXujP+L7pZVe1pvQ15UUllGJ
         7wH2J7AISNXr1ymFcVErxNvkstDb+GjN9oxxzGs5863Aqz2nTb0pdcQQHITr4N4y9kCL
         dPyg==
X-Gm-Message-State: AOJu0YycbMkd6DepvLsh2W9Mka+BBYet295XTMI6WbmaPCRMTKg25r9L
        gyi2viNHSoXBCOZMKwrYJ18=
X-Google-Smtp-Source: AGHT+IGWKVuAn9zIbN0xHNClqeExD/6A9pM1A1/2u5kzg1ko3yEMSGNowadf3wlGQwgR9C03fLLiDg==
X-Received: by 2002:a17:902:e741:b0:1b8:c580:5fb9 with SMTP id p1-20020a170902e74100b001b8c5805fb9mr1463386plf.14.1694133977980;
        Thu, 07 Sep 2023 17:46:17 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:1d9d:935e:2152:72e4? ([2001:df0:0:200c:1d9d:935e:2152:72e4])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902ee4600b001a6f7744a27sm340630plo.87.2023.09.07.17.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 17:46:17 -0700 (PDT)
Message-ID: <6ff868a4-d433-6e92-8bf2-573fee19ce2c@gmail.com>
Date:   Fri, 8 Sep 2023 12:46:11 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 22/52] m68k: atari: Add and use "atari.h"
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
References: <cover.1694093327.git.geert@linux-m68k.org>
 <0778d9dd186928666d760d5523c7d2311f781621.1694093327.git.geert@linux-m68k.org>
 <142e4eb5-b47e-e27c-1be3-bc6c5df889c0@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <142e4eb5-b47e-e27c-1be3-bc6c5df889c0@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 8/09/23 11:57, Finn Thain wrote:
> On Thu, 7 Sep 2023, Geert Uytterhoeven wrote:
>
>> diff --git a/arch/m68k/atari/atari.h b/arch/m68k/atari/atari.h
>> new file mode 100644
>> index 0000000000000000..494a03ddac3d16ae
>> --- /dev/null
>> +++ b/arch/m68k/atari/atari.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +struct rtc_time;
>> +
>> +/* ataints.c */
>> +void atari_init_IRQ(void);
>> +
>> +/* atasound.c */
>> +void atari_microwire_cmd(int cmd);
>> +void atari_mksound(unsigned int hz, unsigned int ticks);
>> +
>> +/* time.c */
>> +void atari_sched_init(void);
>> +int atari_mste_hwclk(int op, struct rtc_time *t);
>> +int atari_tt_hwclk(int op, struct rtc_time *t);
> Wouldn't atariints.h and atarihw.h be more appropriate places for some of
> these?

atariints.h already has some prototypes, so yes on that account.

atarihw.h only has inlines, but sound and time related prototypes could 
be added there, too.

Geert's intentions might have been avoiding inclusion of all the 
hardware specific data in those two files, but the only source file to 
benefit from this is config.c (the other three already include 
atariints.h and atarihw.h).

OTOH, considering this patch series adds a lot of other headers that 
only contain prototypes, it might be better to keep to that pattern 
everywhere.

Cheers,

     Michael


