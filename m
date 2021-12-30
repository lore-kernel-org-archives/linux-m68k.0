Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C36C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Dec 2021 06:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236743AbhL3G54 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Dec 2021 01:57:56 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:36180 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhL3G5z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Dec 2021 01:57:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D21DEB81A56;
        Thu, 30 Dec 2021 06:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B6EC36AEA;
        Thu, 30 Dec 2021 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640847473;
        bh=7yCEFaye12lacfWq1rQcm1e7Rwy/HamcbeXfDiIxuWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eiZT5HF8ubExAG2r5jkflnbBWl86tM2NRdqcH23aCeQYlVxNRcWdnXdiLVQAVZwYJ
         0mZdD/ghl/4DfuZdNpTg8SB4Pl8Fb4u5E8ziRS0dp/LfYoepeZ6M6pelF4INc7LHHK
         CfxLRJP47hs/WWfPAmjBRZy0koLPG1ctDEtEpcY8=
Date:   Thu, 30 Dec 2021 07:57:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ryan Cai <ycaibb@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [Resource Leak] Missing closing files
Message-ID: <Yc1YbthVqjBIAOyC@kroah.com>
References: <5C277DBF-B1EF-4193-9983-63105E5BC053@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5C277DBF-B1EF-4193-9983-63105E5BC053@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Dec 30, 2021 at 11:04:58AM +0800, Ryan Cai wrote:
> Dear Kernel maintainers,
>  
>            In linux/drivers/zorro/gen-devlist.c, the file opened at Line 39 may not closed when going to Line 65. 
>  
>           I think, return 1 at Line 65 should be goto error. Should it be a bug? I can send a patch.
>  
> Location: https://github.com/torvalds/linux/blob/5bfc75d92efd494db37f5c4c173d3639d4772966/drivers/zorro/gen-devlist.c#L39-L65

Do you use this program / file?

If so, and you can duplicate the problem, sure, send a patch after
testing it.

thanks,

greg k-h
