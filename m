Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61238C07E99
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 09:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4300961026
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 09:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbhGLJxH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jul 2021 05:53:07 -0400
Received: from verein.lst.de ([213.95.11.211]:51761 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240678AbhGLJxH (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jul 2021 05:53:07 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 66E9E67373; Mon, 12 Jul 2021 11:50:15 +0200 (CEST)
Date:   Mon, 12 Jul 2021 11:50:15 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210712095015.GA22566@lst.de>
References: <20210709070132.3387689-1-hch@lst.de> <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 11, 2021 at 07:20:26PM +1200, Michael Schmitz wrote:
> Hi Christoph,
>
> Am 09.07.2021 um 19:01 schrieb Christoph Hellwig:
>> Hi all,
>>
>> this series converts m68k to the new world where set_fs is gone to make
>> the uaccess routines work on kernel pointers.  Note that it is compile
>> tested only and thus needs to be handled with care.
>
> Testing your series, I've got this in the console log:

This comes from bad_super_trap, but at this point my knowledge of
the m68k low-level details is over and I can't help much.
