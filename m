Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C1C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 21:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbiIZVki (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 17:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiIZVkg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 17:40:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C34278BF6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:40:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E37BBB80EF8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 21:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79755C433B5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 21:40:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OdKntwZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664228431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f5aU5u3Myy655MFFq3viGw7i4p24peoKpxpAuPXCo2c=;
        b=OdKntwZJmsNpujdWawrgQTPKXcund/LA6Lff5oGkKwxr1K5/6fLPuy/K09OIsxFagdkjb/
        UeGzzlc/ZugvSf7Ym3CT0BlYvcJWTockcvTa2JTVik9F4qxXSg7Ac4STRSox4a4Nr+WhkO
        kQ/5NnAfLNzCl1+9RbIodg6ZKVtU1qQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 008a5edc (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 21:40:31 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id 129so7902280vsi.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 14:40:31 -0700 (PDT)
X-Gm-Message-State: ACrzQf1SOcOOisvEXksXO4nRGjxHgKVzZuHCUQhgAHlcfS2raQW5uEii
        /yBtnBMTSw2ZF0Y404l0Rlq80bMFzkGCQP4u3U0=
X-Google-Smtp-Source: AMsMyM5DjiirOf7vDVF9J2wyRWm1Moy+VLllZ768pmWdZV809C59bQiuh9YBKXZQHA2qRxlMc0FRWUmTHPrdQtgGPGw=
X-Received: by 2002:a67:d81e:0:b0:398:2c98:229b with SMTP id
 e30-20020a67d81e000000b003982c98229bmr9502201vsj.73.1664228430344; Mon, 26
 Sep 2022 14:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220926113900.1256630-1-Jason@zx2c4.com> <20220926113900.1256630-2-Jason@zx2c4.com>
 <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
In-Reply-To: <ad4c5a70-6226-6be3-0049-65880170d8af@vivier.eu>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 23:40:19 +0200
X-Gmail-Original-Message-ID: <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
Message-ID: <CAHmME9r7sjUVOiQDp7WuzFe7Xss1riZBLg=wQeZ5uvWjONoO6Q@mail.gmail.com>
Subject: Re: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4 bytes
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     linux-m68k@lists.linux-m68k.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 26, 2022 at 11:37 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 26/09/2022 =C3=A0 13:39, Jason A. Donenfeld a =C3=A9crit :
> > Various tools, such as kexec-tools and m68k-bootinfo, expect each
> > bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
> > padding to fill this out as such.
> >
> > Also, break apart the padding additions from the other field length
> > additions, so that it's more clear why these magic numbers are being
> > added, and comment them too.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >   hw/m68k/bootinfo.h | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
>
> Applied to my m68k-for-7.2 branch

What about 1/2?

Jason
