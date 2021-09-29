Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE93C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Sep 2021 16:54:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C400161439
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Sep 2021 16:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245743AbhI2Qzs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Sep 2021 12:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27349 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245180AbhI2Qzs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Sep 2021 12:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632934446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wz7/LCBNzU2qEx/p5MvqtYMtlnh6TSWHAxM6fGc3vyI=;
        b=TTwHjR46KozkAq0BMn8cFZx5FUnCX3JkVpl/ZXDFdD/h52M+tEgfaBYbD6MWrO7vFj/YQN
        g8MW6+1s7SkewgncyhzTDGl7aEWbG5IY0EhblVRwUDvO1GVYOYpMjWuADhmwQjpi+/5hXj
        X4SNHmvKpbPCYKjJg8yPRZrc30MQBYM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Evj-5BMMMrWCSFWnr01WGQ-1; Wed, 29 Sep 2021 12:54:05 -0400
X-MC-Unique: Evj-5BMMMrWCSFWnr01WGQ-1
Received: by mail-wm1-f70.google.com with SMTP id 70-20020a1c0149000000b0030b7dd84d81so1512961wmb.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Sep 2021 09:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wz7/LCBNzU2qEx/p5MvqtYMtlnh6TSWHAxM6fGc3vyI=;
        b=FY68v5YWmCUHPTxg1THKXe/4KwEvFMb47dNaS8tv+wOxvGdPQ5r47gCYr4vJbEQ2VO
         W40luJa3tUZBCpuMK43YXcv9YJjnakTdaCW8qyFnniNfxfKVkNb3yd+WWRCHN16DCTak
         Y6RDikZkOMbhisIR9+Ea6DvXTFGtPZfOMtz+LQtl2BeGZA5ecHFfr7XHU/URXQErIt5V
         gjRZLOHrZJGXXdC70uSz5SA4bz759m92swGP+5cr4FLSpij4GuMiTIDsg2EoSXkbZZJW
         3bUEjLTB5J8p4KW6HAE+noafpkVX3Kkm7H4Rn2y+EOclBQq5Dynz9dgKwbqt0z4mzcLf
         3YWA==
X-Gm-Message-State: AOAM530SsbTJN8Ubw744igIcZFdwXYqv9FGGB148j3ISSi3ZDxdA4xCF
        xx/qpy1Qxq1Yxq14/WSeSQ2z1u6EOCR7d2D6g7qdm4hTAIHpwz99mo33zDivdrAqM6JfypfMk7G
        lg2Z/6yzIxFumU/ohj8ZyXaobzoXn
X-Received: by 2002:adf:de86:: with SMTP id w6mr1061892wrl.287.1632934443883;
        Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGkSiAZ0xz7kEyNo1HVkBwp/AkS+PaM+h+PvcslevGOtwequrlIC8Rb0h3s3NmIdNpczjkgw==
X-Received: by 2002:adf:de86:: with SMTP id w6mr1061866wrl.287.1632934443713;
        Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
        by smtp.gmail.com with ESMTPSA id m4sm465862wrx.81.2021.09.29.09.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jianyong Wu <Jianyong.Wu@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org,
        kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com> <YVSW3uuu7mIcJMm3@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
Date:   Wed, 29 Sep 2021 18:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSW3uuu7mIcJMm3@kernel.org>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 29.09.21 18:39, Mike Rapoport wrote:
> Hi,
> 
> On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
>> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
>> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
>> like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
>> regions to add to the vmcore for dumping in the crashkernel via
>> for_each_mem_range().
>   
> Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
> and MEMBLOCK_DRIVER_MANAGED?
> Unless I'm missing something they both mark memory that can be unplugged
> anytime and so it should not be used in certain cases. Why is there a need
> for a new flag?

In the cover letter I have "Alternative B: Reuse MEMBLOCK_HOTPLUG. 
MEMBLOCK_HOTPLUG serves a different purpose, though.", but looking into 
the details it won't work as is.

MEMBLOCK_HOTPLUG is used to mark memory early during boot that can later 
get hotunplugged again and should be placed into ZONE_MOVABLE if the 
"movable_node" kernel parameter is set.

The confusing part is that we talk about "hotpluggable" but really mean 
"hotunpluggable": the reason is that HW flags DIMM slots that can later 
be hotplugged as "hotpluggable" even though there is already something 
hotplugged.

For example, ranges in the ACPI SRAT that are marked as 
ACPI_SRAT_MEM_HOT_PLUGGABLE will be marked MEMBLOCK_HOTPLUG early during 
boot (drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()). Later, 
we use that information to size ZONE_MOVABLE 
(mm/page_alloc.c:find_zone_movable_pfns_for_nodes()). This will make 
sure that these "hotpluggable" DIMMs can later get hotunplugged.

Also, see should_skip_region() how this relates to the "movable_node" 
kernel parameter:

	/* skip hotpluggable memory regions if needed */
	if (movable_node_is_enabled() && memblock_is_hotpluggable(m) &&
	    (flags & MEMBLOCK_HOTPLUG))
		return true;

Long story short: MEMBLOCK_HOTPLUG has different semantics and is a 
special case for "movable_node".

-- 
Thanks,

David / dhildenb

