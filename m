Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1275C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 17:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83E206136F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 17:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhHWSAW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 14:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhHWSAW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Aug 2021 14:00:22 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA8BC061760
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 10:59:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z2so39672681lft.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 10:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QC+P+xUuOsvGBxnVsCQiqmSwa93R/V8iL/qpRmGMKRM=;
        b=FUInLeFKVi9dwYp/peP2q4pq4gURqOhUtIN98rwYgBKEOwUHgSRkoOMUHNxKMzlpHx
         d/e7AaLc1ZNmmoPpb2nMeZRu+e5wqHn0l8yg2yrur+YGmxKWH2FY2Hcd/QkWBEJ8xPcc
         nAt/k/usMmJ/PN3QU/pWShJBDmadSTy4+t4OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QC+P+xUuOsvGBxnVsCQiqmSwa93R/V8iL/qpRmGMKRM=;
        b=JsggDZpSVkCcmZXkqClHFjnGi8oSk81mKzBzgFePUfEjsDZZAAckA37DOFb1Y8xxel
         GL4+gXzL4zM2Jjs8qH8eAQ/BiRxBAWnIqX6ghCb19ds2hxZCn+O400lorA/kTpzUS0KH
         fJpfgtaF7SJR16M0tQWS8MG5JxhU5y0dVZ28m4IDX99C+/T4LTPBYGR+ltBRkzn/qDzZ
         gH6DACO6mTbh3AneIDl9Xsr+5kx1pHSknIFOma/moICoWuSDsgxdsBVyhcMQ8aGhT73y
         XRM4cZC2vt4+gFZuYBC6xVco9y35jygLH82LiRQZIN4p+RhZjxdtNudhMgLW6TANgXyA
         u4tA==
X-Gm-Message-State: AOAM5329PS2M9+nh1UGaK4SGT6mc2j+3vKhEkhkoOjGwDw3JEa2YSJur
        fZbzAVnJ+t3JFcSqC5b9ulc3Hchm5lJ0goNMZ8Q=
X-Google-Smtp-Source: ABdhPJwAYJ5+mdNshkx82k7raNehrlWtMkyCH2cJBbUj8FOeF2ZleadNEYBrKw0WfpVdgAFLiGNBDw==
X-Received: by 2002:a05:6512:152a:: with SMTP id bq42mr25467891lfb.68.1629741577010;
        Mon, 23 Aug 2021 10:59:37 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 7sm1508094lfp.108.2021.08.23.10.59.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 10:59:36 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id v19so14385299lfo.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 10:59:36 -0700 (PDT)
X-Received: by 2002:a05:6512:2091:: with SMTP id t17mr25886450lfr.253.1629741575767;
 Mon, 23 Aug 2021 10:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com> <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
In-Reply-To: <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Aug 2021 10:59:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
Message-ID: <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Got this overnight:
>
> > [536154.200000] *** FORMAT ERROR ***   FORMAT=0
> > [536154.210000] Current process id is 4656
> > [536154.230000] BAD KERNEL TRAP: 00000000
> > [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
> > [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> > [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
> > [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
> > [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
> > [536154.320000] Process savelog (pid: 4656, task=e49aa246)
> > [536154.330000] Frame format=0
> > [536154.340000] Stack from 00cc5fa4:
> > [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
> > [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
> > [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001

Strange. If I read that stack frame correctly, that seems to be an
exception frame of type 0xb ("Long Bus Cycle").

Plus the frame content is then apparently corrupted enough that the
rte causes an exception on trying to restore it.

None of which makes sense or seems to have much at all to do with any
of these patches. Yes, we mess with the exception frame, but only for
fork(), and while "copy_process()" doesn't set any frame type, I see
only two cases:

 - the kernel thread one does a "memset()" to clear it, so you should
end up with frame type 0

 - the user thread case copies the original frame format (which I
think is just the system call frame from the TRAP instruction).

Are you 100% sure your hardware is stable?

                  Linus
