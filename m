Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F99EC76188
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Apr 2023 21:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjDDVRo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Apr 2023 17:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjDDVRn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Apr 2023 17:17:43 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE6A5274;
        Tue,  4 Apr 2023 14:17:07 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1pjo0o-00077h-Jn; Tue, 04 Apr 2023 14:16:18 -0700
Date:   Tue, 4 Apr 2023 14:16:18 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] nubus: Don't list slot resources by default
Message-ID: <20230404211618.GA26628@allandria.com>
References: <62e815b947d6d602def8294040529db80278c561.1679801822.git.fthain@linux-m68k.org>
 <20230403061827.GA3406@allandria.com>
 <e887a8c9-4310-a6cb-62d2-39db7d75d452@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e887a8c9-4310-a6cb-62d2-39db7d75d452@linux-m68k.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 04, 2023 at 08:50:59AM +1000, Finn Thain wrote:
> On Sun, 2 Apr 2023, Brad Boyer wrote:
> > Would it be better to give this option a name that indicates that it is 
> > for nubus only? These are effectively a global namespace. Other than 
> > this, I don't see any issues.
> 
> The name of the module here is "nubus", so this parameter is specified as 
> "nubus.populate_procfs" in the kernel parameters. Without the "nubus" it 
> doesn't work. I should probably add a comment about that.

OK. A comment would be good. Thank you for the clarification. It's been
a while since I needed to use anything like that myself. The code I
deal with on a regular basis is never built-in, so I missed how that
worked these days. Now that I looked at the headers, I see how that
works to add the prefix depending on the build type.

	Brad Boyer
	flar@allandria.com

