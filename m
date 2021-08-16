Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E83C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Aug 2021 06:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 490DD61A81
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Aug 2021 06:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbhHPG7Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Aug 2021 02:59:25 -0400
Received: from verein.lst.de ([213.95.11.211]:53184 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233571AbhHPG7Z (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Aug 2021 02:59:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id F308C68AFE; Mon, 16 Aug 2021 08:58:51 +0200 (CEST)
Date:   Mon, 16 Aug 2021 08:58:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210816065851.GA26665@lst.de>
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com> <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de> <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de> <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com> <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de> <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 16, 2021 at 07:17:15AM +1200, Michael Schmitz wrote:
> Would it be acceptable to add this on top of the probe040/do_040writeback1 
> patch that I'm currently testing?

Sure.
