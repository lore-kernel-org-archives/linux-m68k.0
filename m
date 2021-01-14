Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE62BC43332
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Jan 2021 01:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C87923436
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Jan 2021 01:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbhANBm1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Jan 2021 20:42:27 -0500
Received: from mga01.intel.com ([192.55.52.88]:42693 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbhANBmZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Jan 2021 20:42:25 -0500
IronPort-SDR: NYIZsnWXkPDdkDpEfsESHYgXpdNOE9yDzzUHTVpDPRXz8LOkYoBwZkYvbHNsXCR45tTl60w+FN
 J0siLR7VvYDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="196943236"
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="196943236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 17:41:38 -0800
IronPort-SDR: VHO6jrW5YazjvOQ4YqzRga1Fjuy/tZ5Ev3N1cWfNVRaRH9ezQJbgHx0RNk4qwH0wPptWNWufOe
 NyntUyA0Rb+Q==
X-IronPort-AV: E=Sophos;i="5.79,345,1602572400"; 
   d="scan'208";a="382080684"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.117]) ([10.239.13.117])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 17:41:37 -0800
Subject: Re: [m68k:m68k-queue] BUILD SUCCESS
 069e2573efc3884d5b93f2fd35a9caefafc2132b
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kbuild test robot <lkp@intel.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <5ffe161f.9I/JUOwwZ9adISdw%lkp@intel.com>
 <CAMuHMdVs4fGG5k_BL=BEPHOkY2kMb7o8jFxO80Eg2yf_ypuLfw@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <f8833768-e0ed-d95d-8a4c-781964cbc779@intel.com>
Date:   Thu, 14 Jan 2021 09:40:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVs4fGG5k_BL=BEPHOkY2kMb7o8jFxO80Eg2yf_ypuLfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 1/13/21 4:30 PM, Geert Uytterhoeven wrote:
> Hi kernel test robot:
>
> Thanks for your report!
>
> On Tue, Jan 12, 2021 at 10:35 PM kernel test robot <lkp@intel.com> wrote:
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
>> branch HEAD: 069e2573efc3884d5b93f2fd35a9caefafc2132b  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support
>>
>> elapsed time: 798m
>>
>> configs tested: 237
>> configs skipped: 2
> Comparing this to your other email:
>
>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
>> branch HEAD: c941d009e8721648ba8eb1f5226125c3808a6cfe  Merge tag 'v5.11-rc3'
>>
>> elapsed time: 796m
>>
>> configs tested: 224
>> configs skipped: 2
> I deduce you're still doing separate builds for m68k/master and m68k/queue.
> As both branches should have the same source tree contents, both
> branches point to the same tree object:
>
> $ git cat-file commit $(git show -s --format="%h" master) | grep tree
> tree 5a8b647f6c7b356475d900715c6ca2d416b36377
> $ git cat-file commit $(git show -s --format="%h" master) | grep tree
> tree 5a8b647f6c7b356475d900715c6ca2d416b36377
>
> and you could save some cycles by only building one of them.
> The same may be true for other trees.

Hi Geert,

Thanks a lot, we'll ignore the m68k-queue branch.

Best Regards,
Rong Chen

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>

