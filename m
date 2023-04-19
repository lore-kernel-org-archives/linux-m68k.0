Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDF8C77B73
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Apr 2023 11:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbjDSL4g convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Apr 2023 07:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233143AbjDSL4V (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Apr 2023 07:56:21 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E867315451
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 04:55:19 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id t16so18640290ybi.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 04:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681905319; x=1684497319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDn9xxvsmyQAoLGgssiHdypSNVzAVM8EKnQ4Uk75lUE=;
        b=LEQ7rfIJsqm+Zc7K0vnQxrxDFuHbHHARQ/St/3dlq9+pCEzvAqrfZ/eoErE+v7mzv7
         64liTfVlyivgEigJWHCvzDZ3DGjFtytwGroUX5nFTZngHl0IMiGuzjQtiFSC5EkLysNW
         vhKoOP4cf4NbjcSIXiKG4e9tljUwoV2PUp61bHNF6JOWww34f048+LZG1dRFcoz01/n2
         CAn5IpdFdQ1fv9IrqmOJV3Yg/vmAxHYs/OGTTazqdBuoHNLu8uxJNn0Y2vJMlKRr2cwL
         mFJf6u0inMf4D3o1qViXgkxWq2NjblMKCLPtDADCTRny6yTd/UgU4D7VMO3N2KFdFQUK
         ZALA==
X-Gm-Message-State: AAQBX9dif9vntzbI1qiWU5RhOjP0maiZwUTHxfzh7Lp5osSG3LT5Zadt
        r7NYmOtYrep/4n43TbJNWzlmG2LHn12fxhsS
X-Google-Smtp-Source: AKy350YnOoS1jbawsjHP+ok0scKPgJcQhIJmHIbJ2Qxg5Q13zrxAnsMcSjqWKBFKDDEymfXi2bb3Kw==
X-Received: by 2002:a05:6902:10c2:b0:b8f:565b:b6c8 with SMTP id w2-20020a05690210c200b00b8f565bb6c8mr23338419ybu.62.1681905318836;
        Wed, 19 Apr 2023 04:55:18 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id eh22-20020a05690c299600b00545b02d4af5sm4436853ywb.48.2023.04.19.04.55.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 04:55:18 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-555bc7f6746so52337937b3.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Apr 2023 04:55:17 -0700 (PDT)
X-Received: by 2002:a0d:ed06:0:b0:541:7e07:ed65 with SMTP id
 w6-20020a0ded06000000b005417e07ed65mr3162561ywe.5.1681905317711; Wed, 19 Apr
 2023 04:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com> <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
In-Reply-To: <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Apr 2023 13:55:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo-qDuX7ob9iBuALZnLetgdS5c59cZ7Q-47QvrUcsM7Q@mail.gmail.com>
Message-ID: <CAMuHMdUo-qDuX7ob9iBuALZnLetgdS5c59cZ7Q-47QvrUcsM7Q@mail.gmail.com>
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Wed, Apr 19, 2023 at 12:53 PM Finn Thain <fthain@linux-m68k.org> wrote:
> Inspired by your observation about the page fault and stack growth, I
> wrote a small test program (given below) that just pushes registers onto
> the stack recursively while forking processes and collecting the SIGCHLD
> signals.
>
> On a Motorola '030 the stack grows to about 7 MiB before it gets
> corrupted. The program detects the stack corruption and terminates
> immediately with an illegal instruction. Oddly, the program never detects
> any stack corruption when run on the QEMU '040.

Nice! (the reproducer, not the bug ;-)

Does it also fail on a very old kernel image you still have lying around?
Just to rule out a recent kernel bug.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
