Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04619C6FD1F
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Mar 2023 08:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjCVIUv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Mar 2023 04:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjCVIUu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Mar 2023 04:20:50 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E454C5A1B1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Mar 2023 01:20:49 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 03B2568C4E; Wed, 22 Mar 2023 09:20:47 +0100 (CET)
Date:   Wed, 22 Mar 2023 09:20:46 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Caleb Sander <csander@purestorage.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Arnd Bergmann <arnd@arndb.de>, linux-nvme@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] nvme-tcp: fix nvme_tcp_term_pdu to match spec
Message-ID: <20230322082046.GC22321@lst.de>
References: <linux-m68k@lists.linux-m68k.org> <20230320155736.1492682-1-csander@purestorage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320155736.1492682-1-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks,

applied to nvme-6.3.
