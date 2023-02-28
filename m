Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC28C64EC7
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Feb 2023 22:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjB1WMB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Feb 2023 17:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjB1WMA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Feb 2023 17:12:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED5232E7F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Feb 2023 14:11:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF83FB80ECC;
        Tue, 28 Feb 2023 22:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC5DC433D2;
        Tue, 28 Feb 2023 22:11:56 +0000 (UTC)
Message-ID: <6f6854e5-ffcf-5443-84b2-8cf73000e3c1@linux-m68k.org>
Date:   Wed, 1 Mar 2023 08:11:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] MAINTAINERS: drop uclinux.org
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org
References: <20230228163726.10984-1-rdunlap@infradead.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20230228163726.10984-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 1/3/23 02:37, Randy Dunlap wrote:
> uclinux.org is dead. Drop it from the MAINTAINERS file.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org

Thanks for doing this Randy.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I can take this via the m68knommu git tree if nobody else picks it up.

Regards
Greg



> ---
>   MAINTAINERS |    2 --
>   1 file changed, 2 deletions(-)
> 
> diff -- a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21384,10 +21384,8 @@ F:	include/uapi/linux/ublk_cmd.h
>   UCLINUX (M68KNOMMU AND COLDFIRE)
>   M:	Greg Ungerer <gerg@linux-m68k.org>
>   L:	linux-m68k@lists.linux-m68k.org
> -L:	uclinux-dev@uclinux.org  (subscribers-only)
>   S:	Maintained
>   W:	http://www.linux-m68k.org/
> -W:	http://www.uclinux.org/
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
>   F:	arch/m68k/*/*_no.*
>   F:	arch/m68k/68*/
