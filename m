Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A4BCA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 20:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 002892054F
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 20:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFQi/6YU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfJ2UUs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 16:20:48 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:37084 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfJ2UUs (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 16:20:48 -0400
Received: by mail-pf1-f170.google.com with SMTP id u9so5700623pfn.4
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 13:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=W2qU+fUUEZXfL+n65CDRg7ffVeO+t5HF4vLpTlse5CE=;
        b=lFQi/6YUoUVswyDqY5F+uzIqsB2WdWZoiViAK4g+nolrwu3dM/2/mzP5pOww3JTU/V
         zYxzZWCTPE2owQXwzAueVMzmq+58RyG+ixEtqffuriduFhxBmN4Rw2mrMMXSikGbZDD3
         LnMgwRN3eSectxUEbNGhUPX8BQgqAJc8hCEFTEhREIYzIPx5fgcJy0AoYLojKuhyJqil
         yXyO2QcWCszALSBZoSv7X6celF/giWnljF2IhvkfON6j1XsdaFo1IKrDhcSKTs7Knhsp
         LTWDls94MC0Xwhm90FEO2SmNSCLl241tb5xmcJAbpQdGNe8XKD9rhnraKKk1nIw61gZ3
         sNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=W2qU+fUUEZXfL+n65CDRg7ffVeO+t5HF4vLpTlse5CE=;
        b=ISIByMZCf/zXAKNHqStQXhvLsgN9ZTz2x3dBRPeHxyJNFcwLk0/9iDPxcOhL6SDCje
         1RBCjwD5QQPkYMYTMBJEgHTJ5ysRgTrGwa7FQT0DsEwWmeUnPdXga1c8g+DFYJvipjOu
         nJxQgACaKswzQOWbvMFORz0irTaPXfPn6/vTjuPVLTCNSOfpW7WUZinER+pBd6ncTvGx
         4hhi9K9EETX7eljsB9S6DZh1heiIKRwrEzaYR9JR6u9KDfod+7ZVtVtaujPp1SoKJEGP
         iCho+GVdg18Ho3Qv/QcEFIZNW6Z7ia1g63nZdjvm00tx9RfexQjbAthw6ZDlusvSaLZE
         3ANQ==
X-Gm-Message-State: APjAAAVhZ8+HAt3Seblw77Lxd1opF6izY1HhiUi1Sc5KRjTT2C8fvlC1
        uCvKv3qAJGmQtF04kRI4w+4wqrVF
X-Google-Smtp-Source: APXvYqxNl0gJpRS5N3j2c1Mq8PG/5vkD8U/LJg6+t8rpWdi/mnCh0tCnrKsfEGSAcE+1nKlNesc+jw==
X-Received: by 2002:a62:75c5:: with SMTP id q188mr27338224pfc.132.1572380447217;
        Tue, 29 Oct 2019 13:20:47 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:11df:7631:1f59:7f58? ([2001:df0:0:200c:11df:7631:1f59:7f58])
        by smtp.gmail.com with ESMTPSA id o27sm75191pgn.12.2019.10.29.13.20.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 13:20:46 -0700 (PDT)
Subject: Re: ESP SCSI driver
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de>
 <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
 <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
 <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
 <CAOmrzk+SNfmS0-H6C29Lqbebm3Bkpm-kQO9rfdve_ojy2a6Kcw@mail.gmail.com>
 <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dd2b77c1-3f91-c616-d80c-fba0ab055d06@gmail.com>
Date:   Wed, 30 Oct 2019 09:20:43 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On 29/10/19 10:37 PM, Kars de Jong wrote:
> Hi Michael,
>
> Op ma 28 okt. 2019 om 19:32 schreef Michael Schmitz <schmitzmic@gmail.com>:
>> Don't mess with CONFIG3 - we've tried all that, and in the end had to
>> use PIO to transfer message bytes. Problems with tagged queueing in
>> the ESP driver are usually all due to the DMA not transferring single
>> bytes on Amiga. The additional message byte required to see a reselect
>> for a tagged command complete remains stuck in the ESP fifo. Can't see
>> how this would be affected by the driver mis-identifying the chip as
>> FAS100A.
> And yet that was exactly what caused the issue. It was setting bit 1
> of CONFIG3 - ESP_CONFIG3_FAST (FAS100A) instead of bit 3 -
> ESP_CONFIG3_FCLK (FAS236 and also FSC). Bit 1 means ESP_CONFIG3_ADMA

I'd expect chip config settings to go awry if the chip version is not 
detected correctly. What I meant to say, attempts at somehow enabling 
additonal SCSI features in CONFIG3 haven't got us anywhere with the 
reselection interrupt issue.

Your hang may be due to something entirely different yet.

> on the FSC, and having bit 0 cleared and bit 1 set is actually an
> illegal combination on the FSC (marked "Reserved" in the data manual).
>
>> Regardig mis-detection of the chip revision - can you print the
>> 'version' and 'family_code' variables in the esp->rev == FAST branch
>> of esp_reset_esp() please?
> Family code 0x14, version 2. That's what was also used in the old driver.
Family code 0x14 would imply version 0xa2 (or possibly 0xa0). That's 
revision 'fsc' in the old driver?
>
>>> I will try out some things this evening, I naively added the FSC to
>>> the end of the enum, but the code does things like "if (esp->rev >=
>>> FAS100A)" which break horribly then.
>>>
>>> It looks like it might work if I add my chip type between FAS236 and
>>> FAS100A in the esp_rev enum.
> And that indeed fixed it. I ran "fsck -n" on both partitions on the
> SCSI disk without issues.
> I also want to enable Active Negation and perhaps also "Back-to-Back
> Transfer Enable" in CONFIG4 for this chip (see also the data manual
> http://www.bitsavers.org/components/ncr/scsi/53CF94_96-2_Fast_SCSI_Controller_Data_Manual_Apr1993.pdf
> if you are interested, at home I have an even newer one for the
> Symbios Logic version).
>
> I will prepare a patch. Oh, I also noticed some issues in the comments
> in the driver, I'll see if I can fix those too.

By all means, go ahead with a patch. My knowledge of the Amiga ESP 
boards is limited to what I could glean from the old driver source. I 
haven't seen an Amiga computer in over a decade.

Cheers,

     Michael


>
> Kind regards,
>
> Kars.
