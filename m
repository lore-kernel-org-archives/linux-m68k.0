Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04B8C07E9B
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 02:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9979361CD6
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 02:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhGHCyq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 22:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhGHCyp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 22:54:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D474C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 19:52:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p16so10405467lfc.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 19:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gn4DYTgk78SkzfR6qBL8w1yovIr2Em8zi5ZgKIqSYn4=;
        b=WKbhMlBUwW+kTqbGupPTzUQXHhPCozrYnPmyGDKs/k6dqinCcxMTtvqp99TjmZTH75
         sGfnpnSLmbfHVT31wVjk6CGPj9NKdSvQR5IfN4pfUUmfUkuES+rKN0AdThdHh181pq1x
         q99zJhBj/QXgi8Hr9xwdAxSADHDUhA2Yl/v+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gn4DYTgk78SkzfR6qBL8w1yovIr2Em8zi5ZgKIqSYn4=;
        b=OTLKsO6QL4Ma8uHjcJb/K2iSXCGpCH9nyM+hCe3Lx31oux15e9hTbMMaOV8W5iIrte
         /CGfry6cBrjbEBD/qB4Zd8bSHn8v2fzDSqZ6kMIQywu7z2SQgooaDGA5KdworXRivAj6
         5OsBYyICtGSoutTF/WKRTIL24o7BkYI+cpBJcYWUaF6YBSamR22JhI8S5Fm6ZDUvUfTf
         eBouF2kAJUefSfdenlhDX2hrxDalYS/skrxotbwZLbD+YjTfFoQQ+dAUkcFLyE9fVWwC
         QyvG/8FUeE7iHu0u0dimTwar6mcQoBYf3f7VfEt3B4umCTIKhqTRG6kK3DcogrLte6bh
         hCxw==
X-Gm-Message-State: AOAM533amrnc4T4q2umeBHVrzYReP6L+Swne1k15xHE9zdgJesYktuyh
        En0FZXYRUvifeMTgA6xXPCfNEy5P/IERxVS/iq4=
X-Google-Smtp-Source: ABdhPJyImHIbhbYzIeMxUCHgvW5URK1xHjyfcyOoq0F1c/GGpgUUirYVLECns2gPmZWQ52EsfDJuJw==
X-Received: by 2002:a2e:b5a6:: with SMTP id f6mr21576631ljn.198.1625712722321;
        Wed, 07 Jul 2021 19:52:02 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id h22sm88699ljk.133.2021.07.07.19.52.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 19:52:01 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p1so10295337lfr.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 19:52:01 -0700 (PDT)
X-Received: by 2002:a2e:50b:: with SMTP id 11mr22577437ljf.220.1625712721213;
 Wed, 07 Jul 2021 19:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 19:51:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
Message-ID: <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 6:48 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Followup to my patch "Fixes to Linus' 'remove set_fs patch'", with
> kernel mode copy macros used in __get/put_kernel_nofault().
> (As soon as I use the same __get/put_user_asm() macros with
> parameters, like in Christoph's patch, everything falls to pieces.)

Ok, strange. If this works for you, then the _concept_ is fine, and
there's something odd going on with the "macros with 'moves' vs 'move'
as a parameter" thing.

> The fact that I had to touch include/linux/uaccess.h at all means
> I got something horribly wrong in my use of MAKE_MM_SEG() to
> set the segments.

Oh, that's straightforward enough: the m68k segment code uses the same
'mm_segment_t' type that the geberic kernel just wants to make empty
for the non-CONFIG_SET_FS case.

So the m68k segment type should just use a different name.

In fact, the m68k manuals call them "alternate function code
registers", so maybe it shouldn't be about "mm_segment_t" at all, but
the type should really be named as such.

The "segment" naming is just legacy x86 nomenclature, so I suspect it
would be a good thing to really walk away from that and make it very
explicit about what this is on m68k.

So maybe it could be

    typedef struct {
        unsigned char val:3;
    } function_code_reg_t;

or something like that.

I suspect some real m68k person should make up the name, not me. The
alternate function code registers are all from after my time ;)

              Linus
