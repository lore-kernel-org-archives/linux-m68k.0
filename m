Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170FBC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 08:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB5FC61375
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 08:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhGII4K (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 04:56:10 -0400
Received: from verein.lst.de ([213.95.11.211]:42764 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhGII4K (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 04:56:10 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C078468C4E; Fri,  9 Jul 2021 10:53:24 +0200 (CEST)
Date:   Fri, 9 Jul 2021 10:53:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
Message-ID: <20210709085324.GA23590@lst.de>
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com> <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com> <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com> <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de> <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com> <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 09, 2021 at 08:34:07PM +1200, Michael Schmitz wrote:
> Just booting to a login prompt: Quite a few with 8 bytes, some with 4 bytes 
> (those from the keyboard driver), the rest is 16, 24, 36 and 92 bytes (a 

The 4/8 byte ones can usually be switched to just use get/put_user easily.

