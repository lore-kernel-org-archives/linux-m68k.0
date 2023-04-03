Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB07C76196
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Apr 2023 06:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDCGSd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Apr 2023 02:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjDCGSc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Apr 2023 02:18:32 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72535A0;
        Sun,  2 Apr 2023 23:18:30 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1pjDWN-0000vy-Sl; Sun, 02 Apr 2023 23:18:27 -0700
Date:   Sun, 2 Apr 2023 23:18:27 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] nubus: Don't list slot resources by default
Message-ID: <20230403061827.GA3406@allandria.com>
References: <62e815b947d6d602def8294040529db80278c561.1679801822.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e815b947d6d602def8294040529db80278c561.1679801822.git.fthain@linux-m68k.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Mar 26, 2023 at 02:37:02PM +1100, Finn Thain wrote:
> diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
> index f70ba58dbc55..d2d2b580f646 100644
> --- a/drivers/nubus/nubus.c
> +++ b/drivers/nubus/nubus.c
> @@ -32,6 +32,12 @@
>  
>  /* Globals */
>  
> +/* This parameter makes slot resources available in procfs. It's deprecated and
> + * disabled by default as procfs is no longer thought to be suitable for that.
> + */
> +bool populate_procfs;
> +module_param(populate_procfs, bool, 0);
> +
>  LIST_HEAD(nubus_func_rsrcs);
>  
>  /* Meaning of "bytelanes":

Would it be better to give this option a name that indicates that it
is for nubus only? These are effectively a global namespace. Other
than this, I don't see any issues.

	Brad Boyer
	flar@allandria.com

