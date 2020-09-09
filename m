Return-Path: <SRS0=X0A7=CS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC828C433E2
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 06:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACC902087D
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 06:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgIIG4m (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Sep 2020 02:56:42 -0400
Received: from verein.lst.de ([213.95.11.211]:55991 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgIIG4m (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 9 Sep 2020 02:56:42 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 09FA06736F; Wed,  9 Sep 2020 08:56:40 +0200 (CEST)
Date:   Wed, 9 Sep 2020 08:56:39 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, hch@lst.de, geert@linux-m68k.org,
        arnd@arndb.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] m68knommu: switch to using asm-generic/uaccess.h
Message-ID: <20200909065639.GB9618@lst.de>
References: <20200909021831.1881990-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909021831.1881990-1-gerg@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Sep 09, 2020 at 12:18:31PM +1000, Greg Ungerer wrote:
> Switch to using the asm-generic/uaccess functions for non-MMU builds.
> Remove all the m68knommu local specific uaccess defines and macros.
> 
> There is nothing so special about the m68knommu targets that they cannot
> use all of the asm-generic uaccess support. Using the asm-generic
> uaccess definitions also resolves some of the existing problems with
> missing __user annotations in the m68knommu specific functions.
> 
> The elimination of all of the contents of uaccess_no.h means we can fold
> the uaccess_mm.h back into uaccess.h - and just have the single file
> now.
> 
> The resulting generated code ends up being slightly smaller (by a few
> hundred bytes) due to the compilers ability to better optimize load
> and stores without forcing its hand with asm statements.
> 
> Specifically trivial cases like this contrived example:
> 
>     get_user(x, ptr);
>     x++;
>     put_user(x, ptr);
> 
> end up now being optimized to a single instruction on m68k. More
> generally the compiler can avoid using a temporary register in many
> cases as well.

This looks great!

Reviewed-by: Christoph Hellwig <hch@lst.de>
