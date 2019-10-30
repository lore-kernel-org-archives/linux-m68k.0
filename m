Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D977FCA9EC7
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 23:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B48A120873
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 23:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfJ3XPU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 19:15:20 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41668 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfJ3XPU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Oct 2019 19:15:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 7AA6829BDE;
        Wed, 30 Oct 2019 19:15:17 -0400 (EDT)
Date:   Thu, 31 Oct 2019 10:15:15 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Kars de Jong <jongk@linux-m68k.org>
cc:     linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
In-Reply-To: <CACz-3rhp4qsY=JMdxrEqSxZj6VamSrvGH8Jr+FxHZN71-6Spkw@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.1910310959460.8@nippy.intranet>
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com> <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet> <CACz-3rhp4qsY=JMdxrEqSxZj6VamSrvGH8Jr+FxHZN71-6Spkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 30 Oct 2019, Kars de Jong wrote:

> 
> Actually, I think the PCSCSI value is also at the wrong position in the 
> list, its CONFIG3 (called CNTLREG3 in the data manual 
> http://bitsavers.trailing-edge.com/components/amd/_dataSheets/1993_53c974_PCscsi.pdf) 
> has pretty much the same layout as the FAS236 and FSC, so it would 
> probably have the same issue as me at high synchronous speeds...
> 

The PCSCSI driver (drivers/scsi/am53c974.c) is maintained by its author, 
Hannes Reinecke. He would need to review changes to the core driver 
relating to this chip.

-- 

> Kind regards,
> 
> Kars.
> 
