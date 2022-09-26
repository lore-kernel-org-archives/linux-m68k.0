Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21CCC07E9D
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 10:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbiIZKGb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbiIZKGY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 06:06:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED56A37FB3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:06:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57A9260AB8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 10:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66799C433D6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 10:06:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="McsYbKM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664186769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MTbDAGtdQOyjwr3VuUNM3DoGtToFj5T4CqFl3/zr8u0=;
        b=McsYbKM28gBwvCorerQPM9GQ49ewfnPnXPOfKLQFHihpyhA85IwdjB/VbjDY9+dSfJ/jNo
        UWsoHoBoDByVcefWTwb+yK9mhm47uRv/fK49jmMVeCBACNV4/ebMUSBd1SSUD9vV5H1A0F
        RCwrT8a4Rb7UtVLmNh7q30+tHq6jrCM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db41d957 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 10:06:08 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id u189so6033941vsb.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:06:08 -0700 (PDT)
X-Gm-Message-State: ACrzQf2SWz9hhc7XmUPYsuWQIDK64m/A3yPscxOx+YVPj1KF1wSboSBO
        nk4xOtpyF5UdHdQT/Qs5MqTIMyI5sUk+iQ+cB1c=
X-Google-Smtp-Source: AMsMyM79BUdnq28YnmRh8VHtHeqr2C1KNXc8JZxpkzJmj5FiEtY+ce7Ei0cxHbTNZscwCnmz+gQTxvmuwRVAW+qgjlo=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr6526004vsb.55.1664186767749; Mon, 26
 Sep 2022 03:06:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2ea6:0:b0:3ae:9878:9be with HTTP; Mon, 26 Sep 2022
 03:06:07 -0700 (PDT)
In-Reply-To: <CAMuHMdVJoocGUugnhv=pbgu7z6MFexmRGH1JkQCjm9g-=HiowQ@mail.gmail.com>
References: <20220923170340.4099226-1-Jason@zx2c4.com> <CAMuHMdVJoocGUugnhv=pbgu7z6MFexmRGH1JkQCjm9g-=HiowQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 12:06:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9qnsaUq4PvXM-BW63B=gvgzR3gV6zszEy2VFgzCx=B=wQ@mail.gmail.com>
Message-ID: <CAHmME9qnsaUq4PvXM-BW63B=gvgzR3gV6zszEy2VFgzCx=B=wQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] m68k: process bootinfo records before saving them
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 9/26/22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> The RNG seed boot record is memzeroed after processing, in order to
>> preserve forward secrecy. By saving the bootinfo for procfs prior to
>> that, forward secrecy is violated, since it becomes possible to recover
>> past states. So, save the bootinfo block only after first processing
>> them.
>>
>> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the review.

Did you intend to take these 3 patches through your m68k tree, or did
you want me to take them for some reason instead?

Jason
