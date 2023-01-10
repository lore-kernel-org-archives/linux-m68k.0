Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13418C46467
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 19:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238817AbjAJTM5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 14:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbjAJTMp (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 14:12:45 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8FCCCA
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 11:12:44 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id jn22so14191185plb.13
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsE3VTd3G2LgCbcs0feibuYdfcA0eUnqZOTZom0OX6Y=;
        b=IUS/T4DwbSC96qQtTiTGCBjB5pjne9V1ezpnqoLeE6iY4f0uNGDIw+gybTwhuSRwUa
         YPpiBrVnWy+/VeuxA5JddvdwyE+ZFbYPS6XVkuekEOGf9z44ku/KdzPJ+lOHGSXaDTAb
         QSVto9+d64g9VtNWRVWLwTNJtpnNlJVq+kP4DzLQP3S1NQsOHqx5iZPR12pShvsCLgU/
         UztfDWHEFHLKQ1ckKxOmwsnOHzrB9YfyHSrlf0vvhQHLUEtF7uQwLSl+jNhLl2iAOpnB
         ZKkoMxPVOrpiTHa/IalYryCxTcSTBgd7ndEsSYVM3geCVPWMjjO4WhhZObLgL5/NdrEX
         npNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsE3VTd3G2LgCbcs0feibuYdfcA0eUnqZOTZom0OX6Y=;
        b=nkl8ASuSIgxdNsaZFBnIWVfD5vkfLD1BLe/CHQoyf5dErU7kmCvzRkf1efUJUJlJ5C
         8v3KoqGXa3HlMyO6CU/l4/6mbtH0Zyj0m0EUSpDlUTwax/4J5D0R74Cn8OWiOOghwK/B
         QvnYSUc56XLijWY2hTehtYOvJoW9j/TqKSb16m/0SuP3X6a7SttRk692o3V7QKWd9DbT
         UdCJIcvXrAiMOXcR5R94GUY0x+CGqoQA0svHe8IqQhWTIoQHX5a0RhpsC34iE9tpfUC3
         HNvlvzFZ+PUnHfXGmO72Si789iKUSgPh8qXpp/29WH4j609XuVF2fDI+DTIdqfOBHjxn
         +i5w==
X-Gm-Message-State: AFqh2kp/fGGf0FhVtfN+MD0mNR2DwE3OGhlKPSdG96yczkeWrh74qN47
        7nGlGzRwcFH5gFctfEBZgK4=
X-Google-Smtp-Source: AMrXdXvcZKAc+K75fad91YLg6U+VeqMwXhcPWz28F1pGDK6heIi0d9kRA4prWOeUKKOjf7Y+bYH8aQ==
X-Received: by 2002:a17:902:6b4c:b0:18f:9cfb:42aa with SMTP id g12-20020a1709026b4c00b0018f9cfb42aamr68323285plt.10.1673377963629;
        Tue, 10 Jan 2023 11:12:43 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ce8700b0018685257c0dsm8531387plg.58.2023.01.10.11.12.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 11:12:43 -0800 (PST)
Subject: Re: [PATCH v11 2/3] m68k: add kernel seccomp support
To:     Josh Juran <jjuran@gmail.com>
References: <20230110004504.20292-1-schmitzmic@gmail.com>
 <20230110004504.20292-3-schmitzmic@gmail.com>
 <10FF42FA-120C-4A67-AD2E-188ABE7C4AA3@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <5d879eee-7170-cc2a-707a-ce85880fbbd9@gmail.com>
Date:   Wed, 11 Jan 2023 08:12:37 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <10FF42FA-120C-4A67-AD2E-188ABE7C4AA3@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Josh,

Thanks - that's a merge conflict I overlooked, fixed in the resent version.

But, as Geert points out this breaks patch management tools. I'll resend 
as v12 later.

Cheers,

	Michael

Am 11.01.2023 um 06:00 schrieb Josh Juran:
> On Jan 9, 2023, at 7:45 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>
>> Add necessary arch Kconfig options, define TIF_SECCOMP trace
>> flag and provide basic seccomp filter support in asm/syscall.h
>
> ...
>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>
>> --
>> Changes from v10:
>>
>> - fix merge conflicts
>
> ...
>
> The patch below adds, rather than removes, merge conflict markers.  Am I missing something?
>
>> diff --git a/Documentation/features/seccomp/seccomp-filter/arch-support.txt b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
>> index dc71bf7b1a7e..0c2ac424094d 100644
>> --- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
>> +++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
>> @@ -13,8 +13,12 @@
>>     |        csky: |  ok  |
>>     |     hexagon: | TODO |
>>     |        ia64: | TODO |
>> +<<<<<<< HEAD
>>     |   loongarch: |  ok  |
>>     |        m68k: | TODO |
>> +=======
>> +    |        m68k: |  ok  |
>> +>>>>>>> 596095b777b9... m68k: add kernel seccomp support
>>     |  microblaze: | TODO |
>>     |        mips: |  ok  |
>>     |       nios2: | TODO |
>
> Cheers,
> Josh
>
