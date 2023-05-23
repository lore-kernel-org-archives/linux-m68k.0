Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7571BC7EE23
	for <linux-m68k@archiver.kernel.org>; Tue, 23 May 2023 21:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238619AbjEWVaA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 23 May 2023 17:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238602AbjEWV34 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 23 May 2023 17:29:56 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845DDE5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 14:29:55 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so242442b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 May 2023 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877395; x=1687469395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkPuCO+Qaizbpf2iuhHAAHhVsFNh5BYt2QlC7ZAZrrE=;
        b=HGy8yxWwQpBJYUWMqfs/Dp2Lz0Pq/ltR+XCy9TfD0KI67TLD4zsXklRHGbeRftVsgl
         8OE8QU3zqTyUOi5+eMorYZ3Be78azJV9gJmejA+6eOAUm/sM1a++XK1e05xTe7+Iwh5t
         X8fDclAZpyRCJKYlb4RA8tal56VD7SJb5Io72YW5x5OzcBy+SANYTJeoehx1hh1Sb6GM
         uQaOl7y9rrsm19lPgi2tDnUn/irZ3TToeh5fBYvl84kOyunpatQ8cyCA3bIwx+Pnuacl
         96lqNtuSI43RmJqJ1V/kc8EQIuuL0bSiDGwOXV1X95VIonluweSf8MCB+mELS+vKVAbx
         R6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877395; x=1687469395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkPuCO+Qaizbpf2iuhHAAHhVsFNh5BYt2QlC7ZAZrrE=;
        b=ZxdeahT+F5DWB2WjaXldB7lleyAktaZ4ORYxHL3w6jzuQsXOh5IfKEItiX/So62/1H
         M9oJFZ8XXe2uKZNwWAXF1u+cyAbUyphOzve4yxosVkXuaN4q6zM0jDq3d+TIHwDuRz1c
         +m6rlz/ajVDmhrCe3JRRbq5j0Bp0RpvecM6zSZzpx0Dbs2BhXhbJN5RpkB7wQ9JiMZxw
         bI46up0D/j4uegIhpl/ZUVvzd0YteRMw/uLLiNTNF1LY/qXRGH7zmVvmEuhcFaSYGqR0
         KV0B1QbY/mO3TwzcGniaizAgHlgF2j2ULRQX9GdJxKDXW9oaE9uWgCW13N96dTz3amgJ
         y/EA==
X-Gm-Message-State: AC+VfDz686g7mpN0OyUildsoq1T6wODgQAx3gF7M4lTJLt2kOlAwU3P8
        4ER7+OeoFo+H7futgFjfEdA=
X-Google-Smtp-Source: ACHHUZ4abNzwFslzvkFzue8rbX1nqJp3XtjdthuJn+jybzmHwchKuQLOYEZTPwVaVHegtXnvUunSLg==
X-Received: by 2002:a05:6a20:4292:b0:10c:41a6:ac1b with SMTP id o18-20020a056a20429200b0010c41a6ac1bmr5607635pzj.38.1684877394580;
        Tue, 23 May 2023 14:29:54 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cc93:3691:d59:3309? ([2001:df0:0:200c:cc93:3691:d59:3309])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7874d000000b0063f2a5a59d1sm6206816pfo.190.2023.05.23.14.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 14:29:54 -0700 (PDT)
Message-ID: <069ad5fb-f09f-af67-e19e-b1e852634196@gmail.com>
Date:   Wed, 24 May 2023 09:29:49 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/1] m68k: Move signal frame following exception on
 68020/030
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eero Tamminen <oak@helsinkinet.fi>
Cc:     linux-m68k@lists.linux-m68k.org
References: <cover.1683365892.git.fthain@linux-m68k.org>
 <9e66262a754fcba50208aa424188896cc52a1dd1.1683365892.git.fthain@linux-m68k.org>
 <CAMuHMdX_0F0hSZKqBBCN3876BmfwbQb1_+N3h-V8xs5ouRXF=A@mail.gmail.com>
 <14e09781-6ffd-0834-fba4-427e5030f2be@gmail.com>
 <ee3cdd7b-c2b7-792e-e6ad-39fc6a1f817c@helsinkinet.fi>
 <CAMuHMdWmaw9J1TfawD_wkmpww1tDtGqA53wrnwsJyoZzSDUdSQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWmaw9J1TfawD_wkmpww1tDtGqA53wrnwsJyoZzSDUdSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 24/05/23 00:05, Geert Uytterhoeven wrote:
> Hi Eero,
>
> On Tue, May 23, 2023 at 1:40 PM Eero Tamminen <oak@helsinkinet.fi> wrote:
>> On 23.5.2023 4.11, Michael Schmitz wrote:
>>> On 22/05/23 23:41, Geert Uytterhoeven wrote:
>> ...
>>>> I plan to send this upstream later this week, so any additional
>>>> testing would be appreciated.
>>> I've given this some lengthy stress testing, and haven't seen it fail once.
>>>
>>> In contrast, various attempts of mine to improve on the concept (by only
>>> moving the signal frame away from the USP in case it's likely to clash)
>>> sometimes came up against a kernel bus error in setup_frame() when
>>> copying the signo to the signal frame. I must be making some incorrect
>>> assumptions still ...
>>>
>>> Limiting the signal frame shift to bus fault exceptions that happen
>>> mid-instruction is not too much of an overhead even in low memory
>>> settings, and using 256 bytes (the largest possible operand size, i.e.
>>> the largest adjustment to USP that might occur on completion of the
>>> interrupted instruction) did not seem to cause any issues with stack
>>> growth either.
>>>
>>> I can give this some more testing in ARAnyM (extending the stack shift
>>> to format 7 frames) but I'd say it's got as much testing on 030 hardware
>>> as we can do.
>> Aranym emulates only 040 (without CPU cache).
> Hence Michael's comment to extend the stack shift to format-7 frames,
> which is what is generated on '040 in case of an access error.

Precisely :-)

And I ought to add that this was Finn's idea, to give us more test coverage.

As far as I can remember, the cache isn't involved in this type of 
problem. And I might note that due to instruction restart on 040, any 
minor stack corruption we cause by the signal stack will be repaired on 
return from exception.

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
