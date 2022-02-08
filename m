Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096E9C47085
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349811AbiBHNQH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239015AbiBHMej (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Feb 2022 07:34:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C481C03FEC0
        for <linux-m68k@vger.kernel.org>; Tue,  8 Feb 2022 04:34:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2D7F9B81AE0
        for <linux-m68k@vger.kernel.org>; Tue,  8 Feb 2022 12:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E74C340EE;
        Tue,  8 Feb 2022 12:34:35 +0000 (UTC)
Message-ID: <67ece8fb-680e-8e40-7e6f-4d830bad139a@linux-m68k.org>
Date:   Tue, 8 Feb 2022 22:34:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND] m68k: m5441x: remove erroneous clock disable
Content-Language: en-US
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <20220202194700.289942-1-angelo.dureghello@timesys.com>
 <90cd4311-c30d-94b5-f24a-35ff5aba61fe@linux-m68k.org>
 <CALJHbkA0LAR-vi5SO7zx0PMahqt1R2oKDRqg=1_J+eked6+gYw@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CALJHbkA0LAR-vi5SO7zx0PMahqt1R2oKDRqg=1_J+eked6+gYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 8/2/22 22:14, Angelo Dureghello wrote:
> Hi Greg,
> 
> yes, first was an error.

No problem. Applied to for-next branch of the m68knommu git tree.

Regards
Greg


> Thanks a lot,
> angelo
> 
> On Thu, Feb 3, 2022 at 1:00 AM Greg Ungerer <gerg@linux-m68k.org <mailto:gerg@linux-m68k.org>> wrote:
> 
>     Hi Angelo,
> 
>     So it is clear for me this is the correct (and only) patch to apply?
> 
>     Regards
>     Greg
> 
> 
>     On 3/2/22 5:47 am, Angelo Dureghello wrote:
>      > Remove erroneous esdhc clock disable.
>      >
>      > Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com <mailto:angelo.dureghello@timesys.com>>
>      > ---
>      >   arch/m68k/coldfire/m5441x.c | 1 -
>      >   1 file changed, 1 deletion(-)
>      >
>      > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
>      > index 02922ced19cb..b13fb3d8a14e 100644
>      > --- a/arch/m68k/coldfire/m5441x.c
>      > +++ b/arch/m68k/coldfire/m5441x.c
>      > @@ -181,7 +181,6 @@ static struct clk * const disable_clks[] __initconst = {
>      >       &__clk_0_47, /* ssi.0 */
>      >       &__clk_0_49, /* rng */
>      >       &__clk_0_50, /* ssi.1 */
>      > -     &__clk_0_51, /* eSDHC */
>      >       &__clk_0_53, /* enet-fec */
>      >       &__clk_0_54, /* enet-fec */
>      >       &__clk_0_55, /* switch.0 */
>      >
> 
> 
> 
> -- 
> Angelo Dureghello
> *Timesys*
> e. angelo.dureghello@timesys.com <mailto:angelo.dureghello@timesys.com>
> 
