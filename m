Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6BA12E5B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711580378; cv=none; b=ZJl27eFo4p5IM5ZwztCC9ePCH4OmnBumaM8JiMeYa8X+xC4VH5ACnyLfaVu0RpMoaQ+XReMeR9u1deQUDDkHj3x1OOzz1ucElF3+TKS7DDMPUAhUWdQPOsFaVaAgE+wGrmVbNGSfmC1po5WAzwwgYt/U6T9besNlHg+Zsjpih8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711580378; c=relaxed/simple;
	bh=TUkxXuLfuG/3fp33vnBH20k03O36BWh25sAy9boOWIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rl/uJFirclcZ1ULk6rjyjPIPgFmDzp9ngQ4Mu3XU4u0BXN7Oc78iDjKbg89354lY19zM01id8F0LJoUYkWTmQsqEW6tQ7us3/epciEQzd98ug1WktIwXupCFlHzxGC0fbyE5087GqILico92hc6tG0tt2bUXrohXePp99dd0nV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnQckXsu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnQckXsu"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a04ac98cf7so303482a91.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 Mar 2024 15:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711580377; x=1712185177; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAnZxzdG/vCNoVj7ED9+oQTfftXtq12vgK6Eqqom98I=;
        b=KnQckXsup2SkS/VFwaf6Y26BCkAcY3L4hQ4AXUFE09Tcl3otPOYUeyQh55+3LRzEep
         pKedvacDxmyi2hrcVq6iIcvI68m5EXyrswd44ADDHU+Mtc9ImWEQKla5RfE81wkZl3CN
         rMMB0Oe0PzyJwRCaf6AjJvF8K1Ptc0q7S1P7GbQMGLjkJRuKnNcqowtPcwhsIS0+qw+Q
         NpFZ3/GlblDh/oGDD7nJCD6bfKVG5FyreEONsYtOXebq9q0NC8vNlAAvpTV5ffyDFsXD
         feRdUAa7mmP6doBu9uiRSK/dcwfwnSbwLNLVLHpolDUpJnCMIWmIrhO07dhrQOtE/M6H
         wYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711580377; x=1712185177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAnZxzdG/vCNoVj7ED9+oQTfftXtq12vgK6Eqqom98I=;
        b=PcmtPlNXUZBd7j8ytkfhgLasRAFepHHCRqg0qQ/Nh//5CSGuXEIhPy/yrqyDDcuT0M
         NVgj5g6AJdm5e4K4GlzlYEZWQnGbjfqytLtg3GAX/fhDx8CeFB/YnyUV1oDvllg5yzKA
         sCi/4ZtiaZ+8b0XYMtXb9CZC8DKGHPNOLhvD/0rg4eIO0WidBwEavNfIrrzEmM6r4RNY
         H/mbsMUZyIbmds2KMFxcSffODuj0QdMc3ZSEH0yq6n802sYtGd4Sz0M7712jwv/vUEFa
         yv1NJFC5Rfm8z6JuWFlR+xehkt0eR2l2WpXsaIHWDVnLv/yovfAyLwYrDLnv4ymYKm67
         HqxQ==
X-Gm-Message-State: AOJu0YwFrYGJuILVqX1zGbtNVPd6I331dfjPC2ZrCbmVD82qhYmfsfI8
	ADpel8E/3MiqGNFMyKCBtDSOe7PMfyfhjD8q54c3G7RFDl3WCWlr
X-Google-Smtp-Source: AGHT+IEK50RdJst7Zr1zh8MOg9dU/ySHofMFsk7ZbWEm+Zpy+KAGZ3czpINN7DVl/bAh2CCflaHYvA==
X-Received: by 2002:a17:90b:1256:b0:2a0:3f0a:a863 with SMTP id gx22-20020a17090b125600b002a03f0aa863mr840037pjb.17.1711580376300;
        Wed, 27 Mar 2024 15:59:36 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cce2:5e6b:f484:1b3f? ([2001:df0:0:200c:cce2:5e6b:f484:1b3f])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090a8d0c00b002a09c114d7esm2199055pjo.45.2024.03.27.15.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:59:35 -0700 (PDT)
Message-ID: <728a40f7-c189-461f-bab1-7175388faaa6@gmail.com>
Date: Thu, 28 Mar 2024 11:59:32 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] m68k: skip kernel premption if interrupts were
 disabled
Content-Language: en-US
To: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
 <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
 <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
 <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
 <6f264600-0118-fae7-dc7c-e3407b661d66@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <6f264600-0118-fae7-dc7c-e3407b661d66@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 27/03/24 21:38, Finn Thain wrote:
> On Wed, 27 Mar 2024, Finn Thain wrote:
>
>> On Wed, 27 Mar 2024, Michael Schmitz wrote:
>>
>>> it might be easier for Geert to merge the two patches (or a single one)
>>> on top of his preempt branch if they come in the usual git format.
>> I suppose that would be easier, assuming it doesn't need a lot of rework.
>> Anyway, here's the diff.
>>
>> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
>> index c1761d309fc6..d0092a3127c0 100644
>> --- a/arch/m68k/mm/motorola.c
>> +++ b/arch/m68k/mm/motorola.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/mm.h>
>>   #include <linux/swap.h>
>>   #include <linux/kernel.h>
>> +#include <linux/preempt.h>
>>   #include <linux/string.h>
>>   #include <linux/types.h>
>>   #include <linux/init.h>
>> @@ -139,10 +140,14 @@ void __init init_pointer_table(void *table, int type)
>>   
>>   void *get_pointer_table(int type)
>>   {
>> -	ptable_desc *dp = ptable_list[type].next;
>> -	unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
>> +	ptable_desc *dp;
>> +	unsigned int mask;
>>   	unsigned int tmp, off;
>>   
>> +	preempt_disable();
>> +
>> +	dp = ptable_list[type].next;
>> +	mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
>>   	/*
>>   	 * For a pointer table for a user process address space, a
>>   	 * table is taken from a page allocated for the purpose.  Each
>> @@ -153,9 +158,13 @@ void *get_pointer_table(int type)
>>   		void *page;
>>   		ptable_desc *new;
>>   
>> +		sched_preempt_enable_no_resched();
>> +
>>   		if (!(page = (void *)get_zeroed_page(GFP_KERNEL)))
>>   			return NULL;
>>   
>> +		preempt_disable();
>> +
>>   		if (type == TABLE_PTE) {
>>   			/*
>>   			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
>> @@ -170,6 +179,7 @@ void *get_pointer_table(int type)
>>   		PD_MARKBITS(new) = ptable_mask(type) - 1;
>>   		list_add_tail(new, dp);
>>   
>> +		sched_preempt_enable_no_resched();
>>   		return (pmd_t *)page;
>>   	}
>>   
>> @@ -180,6 +190,7 @@ void *get_pointer_table(int type)
>>   		/* move to end of list */
>>   		list_move_tail(dp, &ptable_list[type]);
>>   	}
>> +	sched_preempt_enable_no_resched();
>>   	return page_address(PD_PAGE(dp)) + off;
>>   }
>>   
>> @@ -190,6 +201,8 @@ int free_pointer_table(void *table, int type)
>>   	unsigned long page = ptable & PAGE_MASK;
>>   	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
>>   
>> +	preempt_disable();
>> +
>>   	dp = PD_PTABLE(page);
>>   	if (PD_MARKBITS (dp) & mask)
>>   		panic ("table already free!");
>> @@ -203,6 +216,7 @@ int free_pointer_table(void *table, int type)
>>   		if (type == TABLE_PTE)
>>   			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
>>   		free_page (page);
>> +		sched_preempt_enable_no_resched();
>>   		return 1;
>>   	} else if (ptable_list[type].next != dp) {
>>   		/*
>> @@ -211,6 +225,7 @@ int free_pointer_table(void *table, int type)
>>   		 */
>>   		list_move(dp, &ptable_list[type]);
>>   	}
>> +	sched_preempt_enable_no_resched();
>>   	return 0;
>>   }
>>   
>>
> For my part,
>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Same for me:

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>


