Return-Path: <SRS0=nM4c=CR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8EDC433E2
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 17:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFF7C207DE
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 17:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731447AbgIHRAc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 13:00:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731695AbgIHRAa (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Sep 2020 13:00:30 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8E8022CB1;
        Tue,  8 Sep 2020 13:06:51 +0000 (UTC)
Subject: Re: [char-misc:char-misc-next 28/28] drivers/char/mem.c:737:21:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
To:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <202009060512.tOc1hWe8%lkp@intel.com>
 <20200907062456.GA19124@lst.de>
 <CAMuHMdVTysHJoghpLC5KyX=s7SOFNFxsXKX1m69AseM12x3XRQ@mail.gmail.com>
 <20200907071400.GA19764@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <d538937a-6ad0-2591-ad81-4f043b74abbf@linux-m68k.org>
Date:   Tue, 8 Sep 2020 23:06:47 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907071400.GA19764@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 7/9/20 5:14 pm, Christoph Hellwig wrote:
> On Mon, Sep 07, 2020 at 09:04:15AM +0200, Geert Uytterhoeven wrote:
>> Hi Christoph,
>>
>> On Mon, Sep 7, 2020 at 8:25 AM Christoph Hellwig <hch@lst.de> wrote:
>>> On Sun, Sep 06, 2020 at 05:14:15AM +0800, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
>>>> head:   99f667352f6c938440d9043d0f66f859d6f3d50d
>>>> commit: 99f667352f6c938440d9043d0f66f859d6f3d50d [28/28] /dev/zero: also implement ->read
>>>> config: m68k-randconfig-s031-20200904 (attached as .config)
>>>> compiler: m68k-linux-gcc (GCC) 9.3.0
>>>
>>> Looks like m68 does not have proper __user annotations for clear_user..
>>
>> M68k has, m68knommu apparently hasn't.
>> Same for strncpy_from_user() and strnlen_user().
> 
> Sorry, I mean to write m68knommu, that's why I added Greg to the
> Cc list.

Yep, needs fixing. Will send a patch.

Thanks
Greg


