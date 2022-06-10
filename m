Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B013C43334
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jun 2022 11:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239694AbiFJLQx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbiFJLQw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jun 2022 07:16:52 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9517A463
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jun 2022 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654859810; x=1686395810;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=cAfzi4fexLUwHQlT5FLFpGoP20ZVi205Z8QVNm+l/X0=;
  b=Jz7c9gvFjnKu6RQHheS66XvvyD7onl3n1MJz477At/weDFcmWRd4873Y
   iLTZ8sa7f0tGM+yyBfYunbc3aaPLWfnxUOebO4Ed1U5240RNA2K4HX3a5
   hsaoJB71XRv+N8ZrBkNCEWo6HGu8c4KiWA2atMNkXLtuxV9MsjoTLBbWI
   YoWpXH1xqaMrszHwMHEFVLnAG/aob7evhcRGp7fCiEzmMvlbIloMy0KMo
   qUmlIduWc+zauaz6HYWw3Dc+EWuAwrg6EiuI94uEIneucEJLRSvTP7i7a
   GL4O4EMjwQXsXkUswmM1JYOJf0o9yf06tVjIEUePtU6YuxAyZXDZHXI02
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="276376003"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="276376003"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:16:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="638083293"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.29.64]) ([10.255.29.64])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:16:48 -0700
Subject: Re: [kbuild-all] Re: {standard input}:3978: Error: value 178 out of
 range
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kernel test robot <lkp@intel.com>,
        Sumit Saxena <sumit.saxena@broadcom.com>,
        kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Himanshu Madhani <himanshu.madhani@oracle.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <202206100855.uY63FJUH-lkp@intel.com>
 <CAMuHMdVGdzkaT=SR2OWoN9S=Xr-2Ckki41P_p7t4WDgRLzfuGg@mail.gmail.com>
 <87wndoalyx.fsf@igel.home>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <2698711f-aaf6-bfc4-9b4f-b49d6acf3a32@intel.com>
Date:   Fri, 10 Jun 2022 19:16:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87wndoalyx.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 6/10/2022 5:47 PM, Andreas Schwab wrote:
> On Jun 10 2022, Geert Uytterhoeven wrote:
> 
>> The offending instruction is:
>>
>>      | drivers/scsi/mpi3mr/mpi3mr_fw.c:299:  switch (host_tag) {
>>              mvz.w %d2,%d0   | tmp160, host_tag
>>              mov3q.l #5,%d1  |,
>>              cmp.l %d0,%d1   | host_tag,
>>              jcs .L154               |
>>              tst.w %d6       | host_tag
>>              jeq .L133               |
>>              subq.l #2,%d2   |, tmp238
>>              mvz.w %d2,%d2   | tmp238, tmp240
>>              mov3q.l #3,%d0  |,
>>              cmp.l %d2,%d0   | tmp240,
>>              jcs .L140               |
>>              add.l %d2,%d2   | tmp244
>>>>>          move.w .L155(%pc,%d2.l),%d0     |, tmp245
>>              jra .L186               |
>>
>> And the table L155 is just too far from the above instruction, so
>> the displacement is too large, causing the failure.
>>
>> Looks like a compiler bug to me?
> 
> Yes, it's https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028.
> 

Thanks for the information, we have added the commit 43ca110050
to ignore list to avoid reporting it again.

Best Regards,
Rong Chen
