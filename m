Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD39C07E95
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 05:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C79761002
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 05:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhGMFoZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jul 2021 01:44:25 -0400
Received: from verein.lst.de ([213.95.11.211]:57329 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhGMFoZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jul 2021 01:44:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7B23D67373; Tue, 13 Jul 2021 07:41:34 +0200 (CEST)
Date:   Tue, 13 Jul 2021 07:41:34 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210713054134.GA5880@lst.de>
References: <20210709070132.3387689-1-hch@lst.de> <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home> <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 13, 2021 at 07:12:45AM +1200, Michael Schmitz wrote:
> That confirms my guess - can we rely on the call trace in that case? And 
> how does overwriting kernel code at that address tee up with the kernel 
> still happily chugging along?

So if you remove the WARN_ON everything keeps running just fine?  I
wonder if in_interrupt somehow is not exact in m68k.  Or we actually
call it from an interrupt.  Let me try to unwind the various call
chains.
