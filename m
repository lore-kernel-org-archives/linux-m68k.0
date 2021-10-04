Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456C5C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Oct 2021 07:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EF8961360
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Oct 2021 07:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhJDHt2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Oct 2021 03:49:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:55370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhJDHt2 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Oct 2021 03:49:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F60D6120C;
        Mon,  4 Oct 2021 07:47:38 +0000 (UTC)
Subject: Re: [RFC PATCH] m68k: set a default value for MEMORY_RESERVE
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20211003000223.25769-1-rdunlap@infradead.org>
 <CAMuHMdWxZn85bk9MuMfW1K_k4v68t4duvJtVHgArdqgawxf78Q@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <fe79ea3f-0cd0-7a14-65f3-c12e5c5069c0@linux-m68k.org>
Date:   Mon, 4 Oct 2021 17:48:12 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWxZn85bk9MuMfW1K_k4v68t4duvJtVHgArdqgawxf78Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/10/21 4:47 pm, Geert Uytterhoeven wrote:
> On Sun, Oct 3, 2021 at 2:02 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> 'make randconfig' can produce a .config file with
>> "CONFIG_MEMORY_RESERVE=" (no value) since it has no default.
>> When a subsequent 'make all' is done, kconfig restarts the config
>> and prompts for a value for MEMORY_RESERVE. This breaks
>> scripting/automation where there is no interactive user input.
>>
>> Add a default value for MEMORY_RESERVE. (Any integer value will
>> work here for kconfig.)
>>
>> Fixes a kconfig warning:
>>
>> .config:214:warning: symbol value '' invalid for MEMORY_RESERVE
>> * Restart config...
>> Memory reservation (MiB) (MEMORY_RESERVE) [] (NEW)
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # from beginning of git history
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> As this is relevant for m68knommu, I'll leave it to Greg, unless he's too
> busy.

Thanks Geert. No problem though, I'll pick this up and push to
the m68knommu git tree.

Regards
Greg



