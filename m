Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4FEC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 14:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 114532080D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 14:00:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390720AbgJLOAR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 10:00:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389452AbgJLOAO (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 12 Oct 2020 10:00:14 -0400
Received: from [192.168.0.162] (193-116-102-242.tpgi.com.au [193.116.102.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27B0E2087E;
        Mon, 12 Oct 2020 14:00:12 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: align BSS section to 4-byte boundaries
To:     Philippe De Muyter <phdm@macq.eu>
Cc:     linux-m68k@vger.kernel.org
References: <20201012043432.787588-1-gerg@linux-m68k.org>
 <20201012133405.GA24704@frolo.macqel>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <233fa145-a942-4b17-fff1-fdc573186fc9@linux-m68k.org>
Date:   Tue, 13 Oct 2020 00:00:09 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012133405.GA24704@frolo.macqel>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Philippe,

On 12/10/20 11:34 pm, Philippe De Muyter wrote:
> On Mon, Oct 12, 2020 at 02:34:32PM +1000, Greg Ungerer wrote:
>> The kernel start up code for all of the nommu m68k types expects the
>> BSS section to be on a 4-byte boundary, and to be a whole number of 32bit
>> words. The BSS initialization loop sets 32bit sized quantities and has
>> no provision for odd or unaligned accesses.
>>
>> Although this has always been the case, in practice the BSS was typically
>> aligned and sized this way. The problem was first observed after commit
> 
> not aligned and sized ... ?

No, I really was saying that it typically worked out that the BSS was
aligned and sized to 4-bytes. So it almost always worked ok.

Perhaps if I reword it to make it clearer:

The BSS copy has always been coded this way, and by luck, the alignment
and size of the BSS has historically worked out to be 4-byte aligned.

Regards
Greg


