Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CFAC77B60
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Apr 2023 21:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbjDZVsp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Apr 2023 17:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238389AbjDZVsn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Apr 2023 17:48:43 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9F01FF9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Apr 2023 14:48:41 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1prn08-000166-1P; Wed, 26 Apr 2023 14:48:36 -0700
Date:   Wed, 26 Apr 2023 14:48:35 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
Message-ID: <20230426214835.GA3547@allandria.com>
References: <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <87y1mgryp1.fsf@igel.home>
 <ff777f08-a8a5-6f16-e197-6f2ee2510e56@gmail.com>
 <a72de14b-2e3a-60c3-0aba-81e36d2a68ae@linux-m68k.org>
 <63d4ef2b-ffdc-0294-30c8-aac50ee7b946@gmail.com>
 <f408a661-06d5-be01-e3b5-931647cd8617@linux-m68k.org>
 <51b8464a-bb05-144b-949f-b92720b1227c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b8464a-bb05-144b-949f-b92720b1227c@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 26, 2023 at 09:10:50PM +1200, Michael Schmitz wrote:
> Am 26.04.2023 um 16:42 schrieb Finn Thain:
> >If the long format frame was corrupted while on the user stack, the
> >partially completed MOVEM won't be resumed correctly. That's why I was
> >concerned about a bug in sys_sigreturn.
> 
> Yes, it turns out I hadn't read mangle_kernel_stack() carefully enough. I
> thought the exception frame had remained on the kernel stack to be restored,
> but I'd missed that it is actually being restored from the user stack copy
> to the kernel stack.

Isn't that a security hole? If we restore the exception frame from
user memory, doesn't that allow a malicious program to affect the
internal state of the CPU just by handling a signal?

	Brad Boyer
	flar@allandria.com

