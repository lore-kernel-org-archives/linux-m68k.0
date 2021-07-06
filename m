Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E5C07E96
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 20:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98DB161C98
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 20:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGFUuJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Jul 2021 16:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhGFUuH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Jul 2021 16:50:07 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D290C061574
        for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jul 2021 13:47:27 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g24so180413pji.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=co2qrQTlElPxps+6BllypCWmJtOEpUlJ6yvE8cOluNs=;
        b=nnhYflP0aZ307+CauKP43cYcd09WbbKpQ5HeC7oJMlHGPLnrsmAqclKeq6ubPsM+cE
         l3rjmSyP0Rt1f+vx9vhxigsonD9e6lNzx4hApfUt3kMRd68MJ42VBjg8bfdCeWw6CvV4
         zYHjjiczSu4+X/L1xXtI9LikwGuxJAFh+lStiOcUvf6fTSPz8xjU/ug3Xu97CSwhZWoE
         9pp+x7LSrazZlgVp6PAYRGbk66Gn5wpVulEEsQhStAChRWQK+GGa8Piztwq2/8G3i5WV
         cVJA9KYxVsRf7ZzLC84l/0WgG8JXXRO7GyIZBkSofWc+aZN8LpMwov5xeNAWlRaFfdgH
         yUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=co2qrQTlElPxps+6BllypCWmJtOEpUlJ6yvE8cOluNs=;
        b=UCQgvojwhrfYyV/YxQsjks4FZSjyVbo6AAGv8Iq+mFPLbxSbDD1bc5PPkQlMp8BgSR
         Wa+zRaFqE8lQRUkNQxOZIken/BVFxWGXAdXt4am4RpdSMDoFcNAQBOOX9jfWHrg0egPG
         9pmFpVDSdEpnyp9TTQpgqLc0FY7/eG++fXju1zyLrg+/NH5JtOjad+RrpsIYd2gtbxFZ
         8yDH2sYmnLCd9xhfcRotacgLvX5U7fv0ycNtVKi3g+s+jdRYV8hJD+9qiP+4E5mQWMVb
         OP1UkoCqlEtgzk/9Yx8IXiRPnJAKmioBU2g014zYxOUjj20RSQK9i6hu0noBscKxO7FA
         D4MQ==
X-Gm-Message-State: AOAM531mrPO6ojKteIUP6ivcvrXCnYciQvSzzbFUF1xsh//uVQ3WR2SN
        y4TgjGSEE7Lvlr821+GtU/b55xjohLw=
X-Google-Smtp-Source: ABdhPJyFeUxnrwQ8y5S+eV6IT9YwACWgU/KzxJKujsr0X4DrdqrhQ0g6cxqQUSJBlNH6xseYv5ixSQ==
X-Received: by 2002:a17:90a:8992:: with SMTP id v18mr22034743pjn.109.1625604446734;
        Tue, 06 Jul 2021 13:47:26 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:8cab:1d4:3057:e819? ([2001:df0:0:200c:8cab:1d4:3057:e819])
        by smtp.gmail.com with ESMTPSA id nr12sm3597400pjb.1.2021.07.06.13.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 13:47:25 -0700 (PDT)
Subject: Re: [PATCH RFC] Fixes to Linus' 'remove set_fs patch'
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <1625527229-3224-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=wjokOnXnth3jw1d9yOnOFMaYNhOftTC+qm2XVh9Pe+7=Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <56f17d9d-ba15-be0e-1ee0-a2ddcff8a612@gmail.com>
Date:   Wed, 7 Jul 2021 08:47:20 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjokOnXnth3jw1d9yOnOFMaYNhOftTC+qm2XVh9Pe+7=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On 7/07/21 6:47 am, Linus Torvalds wrote:
> On Mon, Jul 5, 2021 at 4:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Linus' patch didn't compile out of the box. I'm a little
>> worried that I had to patch mm/maccess.c,
> Yeah, that's not the right way to do it.
>
> See the other thread where Christoph rightly points out that the
> problem is that m68k needs __{get,put}_kernel_nofault() and then just
> enable CONFIG_HAVE_GET_KERNEL_NOFAULT.
Yep, saw that late yesterday and started implementing those.
>
> __{get,put}_kernel_nofault() is basically the similar to
> __get_user/__put_user, except for
>
>   (a) it uses kernel addresses (so in m68k parlance, "move" rather than "moves")
Thanks for reminding me ... after backing out the mm/maccess.c changes, 
new __get/put_kernel_asm() macros and basically copying the 
__get/put_kernel_nofault() framework from mips, I still have a working 
kernel. I'd like to test those changes on actual hardware though (and 
will need help from someone with a 040 or 060 machine for that).
>
>   (b) it uses the "goto err_label" approach instead of being an
> expression that returns an error value
>
> That (b) is what allows the use of "asm goto" to implement the
> exception case much more efficiently (but you can avoid having to
> convert to that model by just doing something like
>
>          if (unlikely(__gu_err)) goto err_label;
>
> inside the macro instead - even architectures that use the "asm goto"
> do that for old compilers that don't support "asm goto" with output
> values.
>
> It shouldn't be too hard to implement on m68k - you'd likely want to
> make the helper macros in <asm/uaccess.h> take that "MOVES" thing as a
> new argument, so that you can generate code for the "move" vs "moves"
> cases using the same helper macros, just with different arguments.

True - let's get some test coverage first though.

Cheers,

     Michael


>
>              Linus
