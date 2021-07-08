Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C77DC07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 18:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1C7B61457
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 18:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhGHSXa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 14:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhGHSX3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 14:23:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1B4C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 11:20:46 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id t30so3874137ljo.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNTABECl8yBP2Txqxo3CI17gT0EJ/GlvgBDVZd8rs04=;
        b=SjNiefMvep8VJe2GHu2Sbks+nt1jZ/7B9O+GiNXfWN0HHJ+pmfsruQ10sEYuHvTLEs
         59AT3C9Ro594L7bjPd26iB7VbYe++cUv6fnDiH82xelseLT2NSHD9Ij0W3TucqLPVNA3
         ZFnjds1dUi3Gxu/lVt2FBqX5knR+3Xs9fDLog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNTABECl8yBP2Txqxo3CI17gT0EJ/GlvgBDVZd8rs04=;
        b=S1o5ySOeRCQj3DIk8dshPdcoLT0/m8dfeezAsULrc895ggPh8FVXlS2KdA3jKIFRww
         gw6w7F0/PcV4fISLXwhWgdegRpRpOB1R+Ioe5U9Co7pjRmudb7WuK5b/MT8/qyMkn786
         uHcp01UNIIeB15+iYsaGD+udmL99lbVXPzuBo3voYvMrvPhtVEW6ImjzyxpTm7xDES8/
         J1F87AzRTbnon3FALRyxuHAE7mOb4CjgLKxJG2kZPpm96zXw5VBua4eCqjjm4ZnmGBVG
         Hl0kQvI+BeuP27IvQqZpq6U4NKYhclCcSHswKTHmoJ/Sisv9APec/ESlIcL6R4Hzg1Um
         QovA==
X-Gm-Message-State: AOAM533Q0hsnGhdKtrWyH1U/Gf72MlOCzamm6rO1S1Su+ef72EkMs9Fb
        /ORHOsMrEpu1mHJLY7LjgL0dSFuEKLU9pQowOe0=
X-Google-Smtp-Source: ABdhPJzas3F+eIaMj2jbZ05ZsjjFkTLMAOS6mANHkJ4sQ0zp9kV2k/5t0RYgG1NMN7f/fV+UQe0rgQ==
X-Received: by 2002:a2e:9e52:: with SMTP id g18mr25159141ljk.167.1625768443843;
        Thu, 08 Jul 2021 11:20:43 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id z13sm281410lfb.40.2021.07.08.11.20.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 11:20:42 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id q18so18036354lfc.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 11:20:42 -0700 (PDT)
X-Received: by 2002:a05:6512:3585:: with SMTP id m5mr24705769lfr.253.1625768442437;
 Thu, 08 Jul 2021 11:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
In-Reply-To: <20210708125751.GA11898@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 8 Jul 2021 11:20:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2j-9g_bkuGPNMfjcs=X1E74h0Zo+zghT86bva8H+5Ng@mail.gmail.com>
Message-ID: <CAHk-=wj2j-9g_bkuGPNMfjcs=X1E74h0Zo+zghT86bva8H+5Ng@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jul 8, 2021 at 5:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I've force pushed a new version to the branch, can you give it a spin?

Please stop playing broken games with __constant_copy_to_user().

Now you didn't just break the return value, you broke the actual copy
too. When it is supposed to do a 4-byte copy, the code now does *two*
4-byte copies, because that's the way __constant_copy_to_user_asm()
works - it always does at least two accesses, and then the third one
is conditional.

So that "6, l, l, )" in

        case 4:
                __constant_copy_to_user_asm(res, to, from, tmp, 6, l, l,);
                break;

literally means "try to do 2x 'l' sized moves (but not a third one),
and return 6 if it fails". All of which is very wrong indeed.

So commit d36105c942e0 ("m68k: simplify the __constant_copy_to_user
implementation") is very very broken.

But the rest looks good to me. Of course, I entirely missed the fact
that Andreas pointed out - "instr" was inside a string - so who knows
what I missed this time.

               Linus
