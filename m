Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2FFC001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 07:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242527AbjHPHiA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 03:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbjHPHhl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 03:37:41 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985E9268A
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 00:37:23 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5713E32007D7;
        Wed, 16 Aug 2023 03:37:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 16 Aug 2023 03:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692171438; x=1692257838; bh=+ibLpG2m5IkYq
        9JLrLGPbuZbXlJv6uvQ7/O1SpDhQ9E=; b=F0K5QFtE1BDbikL1OAZV7MsA4lcYX
        8rA6DAoEswzaTXrcgDhksBtFjyO1Bh6YgMSwkjMWFWyECncJAjW9Lm2lmBsAKn6U
        MILdIZ0le98FyY12PQDrq7Ygi96Aa5nkXooMo8N9ABYwLCfZZmyysyR2ZDUVhDaF
        1qjyDwjRnPnqG7U4pQzEILY2bGrMfSlfeTq+hBSlJj//l6xruErYBqjDys5lz61m
        F058cJFXXyQCqW5tBPqskq1EgrfvlumH4TV1S7W64uO8rZ9mwIbvtOOxzhiEvTB2
        DUskzNlH9I0gglPrTddhQNwrgpUkwT6hDG/8rSjmQOqvYc5zWt5lQJKig==
X-ME-Sender: <xms:rnzcZOxtgBldKmV8B7oo7qe_0sRDqmXlBocPbkWUiSupueMvDRzlHg>
    <xme:rnzcZKTx9oO2cJ_Cb8gxLsIG7sIiO0N2XNGVTY_pjNDNQ_elGpb2PLdVPAn4x-dWR
    7q5fTBrV01hNPWQkMQ>
X-ME-Received: <xmr:rnzcZAWTzv8Zb0bbl3_r4-mjzrNkIRrdaXjCb5hjX8emzKxmpvWw4FZlsnAakfiPydvId01Bs1Gr8nFrw9bkKsQfMYv8uCpSOcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:rnzcZEiDiqaYP4uhdIDOVMlagfigq_Sj2S-vYQUUirv9RGi4yaBjKw>
    <xmx:rnzcZABakA0XTn_QiPG-_Sm7JOkPEH9yxZZw3RPjXVWNcqoXo-Nsvw>
    <xmx:rnzcZFLuOPBADBwg31raJdzBNnY6Ftrznw40U3LRj1QNoSwR-TTx4g>
    <xmx:rnzcZDOnTCabosHVmAwa-443hZoB6hJng7j-yF1RwO6eSXIdmuU_tA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Aug 2023 03:37:15 -0400 (EDT)
Date:   Wed, 16 Aug 2023 17:37:24 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     will@sowerbutts.com, linux-m68k@vger.kernel.org, rz@linux-m68k.org,
        geert@linux-m68k.org
Subject: Re: [PATCH RFC v3] m68k/q40: fix IO base selection for Q40 in
 pata_falcon.c
In-Reply-To: <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
Message-ID: <44bc64de-8463-5e43-7335-8ea1ffc07cee@linux-m68k.org>
References: <20230815223212.13620-1-schmitzmic@gmail.com> <29964423-b09e-662f-7fcc-1a33e33e2139@linux-m68k.org> <df430e28-9bca-4453-2c81-c50edbbf4f9e@gmail.com> <2371f714-e0a2-7c0e-d811-5b7ea7a6684f@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 16 Aug 2023, Finn Thain wrote:

> Given it's a platform device that's only ever instantiated once, you 
> could just use the module-scope variable rather than device-scope.
> 

I see that atari instantiates one platform device but q40 actually 
instantiates two ata ports, and each port has two drives. So it appears 
the module parameter would need to have 4 bits.

You could set ap->private_data to pdev. Then pata_falcon_data_xfer() can 
use pdev->id and sdev_target->id to find the relevant bit in the module 
parameter.
