Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C9BC38A2D
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Oct 2022 13:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbiJZNAC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Oct 2022 09:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbiJZM74 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Oct 2022 08:59:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AFD4A802
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 05:59:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 696E461EBB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 12:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68BFC43470
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 12:59:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ou9oF2yV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1666789193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Itg5PIT908DcDJYjrtj5/+x2CN8xk7dORlOQetDKB5I=;
        b=ou9oF2yVsVDmOhYyWzX23yQZNdQEH74igQdgBjllMGhnjcUUeS4GgHtKXboiKdmyfyuTxH
        ubMDmda59lJKhisuNiUcfGw+HT7x5pLmM9Ldz7x0n/Xc+3JYqIijcTWEfXqlzqfKREaiuN
        Y+7yw0D1ytxdXEztyCJZm64kwVN7GCw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0870e51b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Wed, 26 Oct 2022 12:59:53 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id y129so7807809vkg.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 05:59:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf1NgSAwfBRsVLUhy40crapnHBjzmYEwfx2+xM1pUxKEz5h4+JL4
        KoZNdBlq+jmes9RpMGq15mYAp+7oiQVTvwd40aQ=
X-Google-Smtp-Source: AMsMyM4hmCilci0NpT6nnnz/tl6mCn4lcZRY6JAcWAgmMUNmUbisWrKbaoQoVteERfwjTlJmtZsahWRTK0i5+TkK+D0=
X-Received: by 2002:a1f:ecc6:0:b0:3aa:a785:5e2f with SMTP id
 k189-20020a1fecc6000000b003aaa7855e2fmr23442428vkh.6.1666789191833; Wed, 26
 Oct 2022 05:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221026124801.1576326-1-Jason@zx2c4.com> <CAMuHMdXdR34JX3+=m8vuw=k_kOxT1jq3sGsW6yh_h9aFH+BP4A@mail.gmail.com>
In-Reply-To: <CAMuHMdXdR34JX3+=m8vuw=k_kOxT1jq3sGsW6yh_h9aFH+BP4A@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 26 Oct 2022 14:59:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9oGomHncF1c=LDXow=JwRQwieP0ohA=s9Y0jnzVhjE8YQ@mail.gmail.com>
Message-ID: <CAHmME9oGomHncF1c=LDXow=JwRQwieP0ohA=s9Y0jnzVhjE8YQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mac_via: use explicitly signed char
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 26, 2022 at 2:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Jason,
>
> On Wed, Oct 26, 2022 at 2:48 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > The `val` variable is set to -1 and compared against < 0, which means
> > it's assumed to be signed. However, soon char is to become unsigned
> > tree-wide. So explicitly mark `val` as signed to that it keeps working
> > the same way.
> >
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> > Geert - Linus asked me to consolidate all of the unsigned-char fixups in
> > one tree. So, unless you plan on taking this for 6.1, I'll queue it up
> > in that tree for 6.2, following your ack. -Jason
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/mac_via.h
> > +++ b/arch/m68k/include/asm/mac_via.h
> > @@ -269,7 +269,7 @@ extern int via2_scsi_drq_pending(void);
> >
> >  static inline int rbv_set_video_bpp(int bpp)
> >  {
> > -       char val = (bpp==1)?0:(bpp==2)?1:(bpp==4)?2:(bpp==8)?3:-1;
> > +       signed char val = (bpp==1)?0:(bpp==2)?1:(bpp==4)?2:(bpp==8)?3:-1;
> >         if (!rbv_present || val<0) return -1;
> >         via2[rMonP] = (via2[rMonP] & ~RBV_DEPTH) | val;
> >         return 0;
>
> LGTM, although this could just use "int" instead.
>
> Upon closer look, this function is not used, and seems to have never
> been used before.  Please just remove it instead.

Hah! Nice catch. Okay, will send you a removal patch (for you to take).

Jason
