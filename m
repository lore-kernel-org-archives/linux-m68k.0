Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4775DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  2 May 2022 12:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385101AbiEBMy6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 May 2022 08:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbiEBMy6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 2 May 2022 08:54:58 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764DABE23
        for <linux-m68k@lists.linux-m68k.org>; Mon,  2 May 2022 05:51:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 38A80CE198E;
        Mon,  2 May 2022 12:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F83C385A4;
        Mon,  2 May 2022 12:51:23 +0000 (UTC)
Message-ID: <7bf0c90b-c5f3-104d-6653-d4e4aba8a38e@linux-m68k.org>
Date:   Mon, 2 May 2022 22:51:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] m68k: fix typos in comments
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220430191122.8667-4-Julia.Lawall@inria.fr>
 <CAMuHMdVnbbURooc7bePQX4E0FZVPO+eiKd8kYW2cz0mx3r82ZA@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdVnbbURooc7bePQX4E0FZVPO+eiKd8kYW2cz0mx3r82ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Julia,

On 2/5/22 18:38, Geert Uytterhoeven wrote:
> On Sat, Apr 30, 2022 at 9:11 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>> Various spelling mistakes in comments.
>> Detected with the help of Coccinelle.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks for the patch. I will add to the m68knommu git tree
(for-next branch).

Regards
Greg

