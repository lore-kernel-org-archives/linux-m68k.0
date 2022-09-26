Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962EAC6FA90
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 10:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiIZK3c (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbiIZK2v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 06:28:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2454E841
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:19:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45A8160B60
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 10:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BE1C433C1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 10:18:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ca8kz+NX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664187506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KPitCDjljE+1/cKCHIXEIuBG6dg931Jal6pxfbqJG50=;
        b=Ca8kz+NXjpnQovPaxTTBjGz8Lj06+Oq17OYzAa4a+p25uD2a9uyo3y3OqdICYJaida5sdR
        PfxENh1ciNBemkT3h0d85SJmZ0WLo4yCjIm9ZQCiNQE9371yD1lVv0BJgtGwLkuJGGhKiY
        Wze94iSACKZCJ0AM3tbWIodTA+x5B98=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ce78d8f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 26 Sep 2022 10:18:26 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id s12so3140557vkn.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 03:18:26 -0700 (PDT)
X-Gm-Message-State: ACrzQf02rKI5ij6twYqzJ5+QRFSp119eo+WKyUmxQnOSR+Br4C9X/+W3
        gd/srg1kzIbCTNOXvPGAj5s83ITPp2HM2SRtG/s=
X-Google-Smtp-Source: AMsMyM6BZnql+7X0HEuy+6hfAj0blSq1TS/9NzbFmJG3Ns3/H3UwXMEUG4S4g07rNj25WyM63nicfTD8gT+JIWmH3is=
X-Received: by 2002:ac5:c7a6:0:b0:3a2:7f3c:8170 with SMTP id
 d6-20020ac5c7a6000000b003a27f3c8170mr8275071vkn.6.1664187506008; Mon, 26 Sep
 2022 03:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2ea6:0:b0:3ae:9878:9be with HTTP; Mon, 26 Sep 2022
 03:18:25 -0700 (PDT)
In-Reply-To: <CAMuHMdWT8dhre5TGjYRnEwn_jCZ6CXxvMpLmKp3KKo_CjPOXRQ@mail.gmail.com>
References: <20220923170340.4099226-1-Jason@zx2c4.com> <20220923170340.4099226-2-Jason@zx2c4.com>
 <CAMuHMdWT8dhre5TGjYRnEwn_jCZ6CXxvMpLmKp3KKo_CjPOXRQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 26 Sep 2022 12:18:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9oTKp=cw9QFHOU6FKT5qSuQufO5Vo+XPELYGoaQK2fPoA@mail.gmail.com>
Message-ID: <CAHmME9oTKp=cw9QFHOU6FKT5qSuQufO5Vo+XPELYGoaQK2fPoA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] m68k: virt: generate new RNG seed on reboot
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 9/26/22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jason,
>
> On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> Rather than rebooting into a system with no entropy, regenerate the RNG
>> seed before rebooting, so that the new system has a fresh seed.
>>
>> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Thanks for your patch!
>
> I still doubt this is actually guaranteed to work, as the memory containing
> the bootinfo might be overwritten during normal operation.

Thus far, I'm unable to make it *not* work. So this seems like
actually an improvement?

Jason
