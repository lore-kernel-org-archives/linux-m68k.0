Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC78C64EC4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Mar 2023 23:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjCFXB4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 18:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCFXBz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Mar 2023 18:01:55 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F3B65043
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Mar 2023 15:01:54 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id i3so12232129plg.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Mar 2023 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678143714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFvaNQYUtK3/GzIRP4wfkaFrx608yYNRKbg0aOKiIdo=;
        b=jGkX9bczrnZfe7qhlgEPntSvlGYcNl02gax5qBYne5xhtKngRdLaJmPmXiwD1QlT9H
         /EVVKqr1PZp/QIr4pCnwXHP8IoycaduQqu6gi7WqGTQcod4mL6xPdLIm3htDAh05tfrD
         lrmZyiBao7+zc1XOd7hZY6ECaHr2Oj18Sc4jzlO/oPOAXnPRxe2YGdFd/wHEsff0c1ml
         pXcBCTHTWidAsi0DdPZ14b4oAZZ7XYo8CXvyo5q1+Q5H+I9K5/Dy2JdXHkCgZ6ccqEDR
         Mcjj+lyZkZZAIj78DuPSpESgbjOsziTSttLugaXHz6PhBAcsPjtpGJZOF6zNy3Tnjbys
         SIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678143714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFvaNQYUtK3/GzIRP4wfkaFrx608yYNRKbg0aOKiIdo=;
        b=27SDtOflQGw2PCmImDoPU/1J3xXNUJ1V1L9fQQP+pTdz+A74e4uXExEAF+O2zAlv6g
         AShcO9K6+dDg1fFKxrcLrSe5eYaOmgSgPW4q9jKKhJPliuRgP7B5e96XzjdUey/jiB1X
         UfHYghN4Cvw4UHMP8xIMeAn6+tzEv50S7An/uyy7HmKo0hM0z0A3QnWCsiMeNtrp6JM6
         3GiSMgbIVw6iiuzrCs5XVRLrIe9PGaHNA4YwD18Sz5e+Dpc12uKl6GZEDgH36br+sd0S
         cPq+ChuX2T9NnEQMGfaWpOHV7N1Ku6+6uHvkPSJxRC3Y9Fo+dE6MQDJd+TTIYJEbKkuE
         jlAg==
X-Gm-Message-State: AO0yUKXDjs95X07k0o992rYEWUpAjH4mKYlQi/eJWHooWDyODglgD5I/
        qhyP4VQ5ypU6hu05W4M1pZU=
X-Google-Smtp-Source: AK7set/Vj8UXjS8rj40zM4+sO9o7q139gb3UfaWLkIHkIeZPS3jYCAzX7WkSDGyNppSvZ6bUWJZOZQ==
X-Received: by 2002:a05:6a21:33a8:b0:bf:58d1:ce98 with SMTP id yy40-20020a056a2133a800b000bf58d1ce98mr14277840pzb.23.1678143713866;
        Mon, 06 Mar 2023 15:01:53 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:30b0:fa2a:478a:23d8? ([2001:df0:0:200c:30b0:fa2a:478a:23d8])
        by smtp.gmail.com with ESMTPSA id n1-20020a6546c1000000b0050301745a5dsm6754962pgr.50.2023.03.06.15.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 15:01:53 -0800 (PST)
Message-ID: <5f556597-5f09-6baa-80bb-aef7337ae869@gmail.com>
Date:   Tue, 7 Mar 2023 12:01:47 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 13/34] m68k: Implement the new page table range API
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
References: <20230228213738.272178-1-willy@infradead.org>
 <20230228213738.272178-14-willy@infradead.org>
 <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com>
 <ZAS1Lq6//oO/0PXe@casper.infradead.org>
 <0b00a30e-cb7f-d42b-7d16-0ae8d50ed916@gmail.com>
 <CAMuHMdUDrOD3DezbvxaJH6CXxDFRNC7G-8uU7mqVHxZcG6GNBA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdUDrOD3DezbvxaJH6CXxDFRNC7G-8uU7mqVHxZcG6GNBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 6/03/23 20:21, Geert Uytterhoeven wrote:
>> Are we certain that contiguous vaddr always maps to contiguous paddr?
> For a general __flush_pages_to_ram() function, that would not be
> guaranteed. But as this is meant for folios, it must be true:
> https://elixir.bootlin.com/linux/latest/source/include/linux/mm_types.h#L320

Thanks for explaining - that just leaves the problem of cowboys like 
myself abusing __flush_pages_to_ram(addr, nr) with nr > 1 for something 
that isn't a folio. Maybe a comment 'nr > 1 only valid on folios' would 
help ...

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
