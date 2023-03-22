Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8163CC6FD1C
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Mar 2023 06:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjCVGuO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Mar 2023 02:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCVGty (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Mar 2023 02:49:54 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0561F2B9C6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Mar 2023 23:49:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8E7FF3200931;
        Wed, 22 Mar 2023 02:49:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 22 Mar 2023 02:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679467784; x=1679554184; bh=qm/wfm09fuhCS
        M5vGnT7Tur7d91xNuD8sTp/mz7MCZA=; b=fevLYV3Lo9jkshZ2VfF1nPavNEaik
        ORa93Y/N60UrSViWQx93YXtT4eZJAgbRbCcAVa7Tpo/eXdIbLJ0EztGGO4Qz70kI
        xVVOitGwqPEGoYDmNzYk8FMkbvZAf6W7g8BGOtiPDRTopcTDg8nqKpHMSMtgUs5n
        8++OH4cXoiEv2QXJ3t/+hXFOStWilz04L8GMN6F8vGzOiElPhA1sWT+aPp8BGp0M
        KUOVjLCJr6Rmi5CjdrgHeSg98CVQvpsP8NpAc7dNJCTrdkpGtnGqWI9LZrs8A7e+
        yS9ytTZcBnxz8oRYaRPHwrmvoQFPXHRMUXE3izkwUtfO9T7zZOXBHCUtQ==
X-ME-Sender: <xms:B6UaZJCgBhOFAluHevzB6UPp8vrkUtHzdpgaLJKndfN6AQFGtTbXvA>
    <xme:B6UaZHjZyTpuVwDISzeY90vJlPftHEm3-CSsTyOKbd351K5ZYCABXi7uFdSHE0W1b
    Awl_AEl8cSF-5Mhezc>
X-ME-Received: <xmr:B6UaZEnAU-PF7pFLsNVStXvHFogwWplRMwTVlHSCqW2GQ5ec85W786oqG24XDkGu-iF_9OO_Wxbfi7hmMbywI5s-xur5uBK1P74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:B6UaZDzhmd9xazwHEUxLeAo6Q94BOTmcuDvut3RLBGfL2JmY3VR4Xg>
    <xmx:B6UaZOSSdFyuxzCbY6GqK9xrQbvubGduKICCw6202xCRXL3lyZcixQ>
    <xmx:B6UaZGb_sbzn3XjurNDhJtJePv7vlGLvUGfXp63hCfH9DpCtCZAI1g>
    <xmx:CKUaZH49E5zT9DgC1RsNKgRpKw0I5cq47bqo8RqqyCRkMFgGwfJ1iQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 02:49:40 -0400 (EDT)
Date:   Wed, 22 Mar 2023 17:52:34 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: Avoid scanning "private" card resources
In-Reply-To: <4f5e5d058c21270ebf31609a71c2b800fd99fa93.1679446472.git.fthain@linux-m68k.org>
Message-ID: <9b0d643e-2555-8d09-a47c-19196add3345@linux-m68k.org>
References: <4f5e5d058c21270ebf31609a71c2b800fd99fa93.1679446472.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Wed, 22 Mar 2023, Finn Thain wrote:

> Some Nubus cards have many ROM resources. A single Radius video card
> produced well over a thousand entries under /proc/bus/nubus. Populating
> /proc/bus/nubus on a slow machine with several such cards installed takes
> long enough that the user may think that the system is wedged. All those
> procfs entries also consume significant RAM though they are not normally
> needed except by developers. Omit the "private" resources from
> /proc/bus/nubus/ by default and add a kernel parameter to enable them
> when needed. On the test machine, this saved 196 KiB and 5 seconds.
> 

This patch is nice and short but I suspect it can be improved upon. If the 
procfs entries are only needed for debugging then I should probably omit 
all of them by default, and save even more time and RAM. So I think I'll 
revise this patch.

> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  drivers/nubus/nubus.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
> index f70ba58dbc55..777099b8e818 100644
> --- a/drivers/nubus/nubus.c
> +++ b/drivers/nubus/nubus.c
> @@ -34,6 +34,9 @@
>  
>  LIST_HEAD(nubus_func_rsrcs);
>  
> +bool all_func_rsrcs;
> +module_param(all_func_rsrcs, bool, 0444);
> +
>  /* Meaning of "bytelanes":
>  
>     The card ROM may appear on any or all bytes of each long word in
> @@ -572,9 +575,9 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
>  			nubus_proc_add_rsrc(dir.procdir, &ent);
>  			break;
>  		default:
> -			/* Local/Private resources have their own
> -			   function */
> -			nubus_get_private_resource(fres, dir.procdir, &ent);
> +			if (all_func_rsrcs)
> +				nubus_get_private_resource(fres, dir.procdir,
> +							   &ent);
>  		}
>  	}
>  
> 
