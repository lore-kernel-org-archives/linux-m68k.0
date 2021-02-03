Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E675C433E6
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Feb 2021 03:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71BFA64E42
	for <linux-m68k@archiver.kernel.org>; Wed,  3 Feb 2021 03:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhBCDKR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Feb 2021 22:10:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:55970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232109AbhBCDKK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 2 Feb 2021 22:10:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 25F4664F74;
        Wed,  3 Feb 2021 03:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612321812;
        bh=ZuNRMEqHVCgEIVhQrJT8GR3Osiyjq+dayVDEsuj7mps=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sijHwVtsaWPVG8ePNiustuIftkK6zYgRqig9uBoWQ+RlRvcaTqLGHW7TzmZfJBUDz
         OnEjvsPN5QJtId+fgOGyux0rI7pIkxRY9c03qrQmE0tH1GOXa/hIbUA5WL8sz16Nr1
         07c1GRAvMMDrns1BND/coKuJp2tUOn6snNjLhjXFbL3Y/4lT1W5IbLi2pQvxkwU6JQ
         nRAf4BXtcd2/lN9Logwf8Cy1eaHjdDGlQaDr9Tk6G9Alw5e2bDUx769+geB6poEAUM
         lDobhORNWQvx40BGqWMXJGpK/6Ci0CQ4t4rJviooSOFywZoKtBEiCM9yjO0giTFY0t
         toFTlvyUI/VKA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: fec: Silence M5272 build warnings
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161232181210.32173.7064834379562903340.git-patchwork-notify@kernel.org>
Date:   Wed, 03 Feb 2021 03:10:12 +0000
References: <20210202130650.865023-1-geert@linux-m68k.org>
In-Reply-To: <20210202130650.865023-1-geert@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     fugang.duan@nxp.com, davem@davemloft.net, kuba@kernel.org,
        gerg@linux-m68k.org, linux@roeck-us.net, netdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue,  2 Feb 2021 14:06:50 +0100 you wrote:
> If CONFIG_M5272=y:
> 
>     drivers/net/ethernet/freescale/fec_main.c: In function ‘fec_restart’:
>     drivers/net/ethernet/freescale/fec_main.c:948:6: warning: unused variable ‘val’ [-Wunused-variable]
>       948 |  u32 val;
> 	  |      ^~~
>     drivers/net/ethernet/freescale/fec_main.c: In function ‘fec_get_mac’:
>     drivers/net/ethernet/freescale/fec_main.c:1667:28: warning: unused variable ‘pdata’ [-Wunused-variable]
>      1667 |  struct fec_platform_data *pdata = dev_get_platdata(&fep->pdev->dev);
> 	  |                            ^~~~~
> 
> [...]

Here is the summary with links:
  - net: fec: Silence M5272 build warnings
    https://git.kernel.org/netdev/net-next/c/32d1bbb1d609

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


