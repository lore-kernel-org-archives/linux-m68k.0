Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F628370
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170371; cv=none; b=pK5DTS8ycPXnhCIoRIKsuRZPCPcW3L24heuqe1rmfqw+ryUjhO6WMakEVD0JnYvt4a93me3RUjuJEvtef23ZdwfJ6MYwBff2VyTWZkwHkO3kQRrNcDuiqMi2xtlD0atz8j9PAtIQlNOcVZLGQ4lTzlHsJSOv/Jnp83CBH8PbwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170371; c=relaxed/simple;
	bh=2tZJQFkGkTXBsTyXnq/PcsKbXo0w3VLcb4AtoKgV/Y4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CtFiFeAFQej941JPTAQ++PkKTGmn9A0XD4EuwbEjMjgfuEKbxNR3urk7hbU5i5uUe0K3Dh59HYZ3kAhfcqBL1QcXoRIfNLrBYKAXiaRczkiU/2+AnwKgmIJ3EHpoHNLnpbzi64srTrW6TA/7CSj0dYBK8u1jse8l9TbtRxomP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EDXU56iz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EDXU56iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727170368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SJcOrndr2Q8kdTiLbvvnMMlyzTqrUkUtM9lZEdhJEqo=;
	b=EDXU56izzSyKBQ0cSncNtgJeacwBXvhSJPcOqrNWyba2jo7/ZLFi9yQPNpfKHm2UJez+Tv
	uZBeepC+9wd6wrVcxZIF5lsXeDJ6BCRokGAkpXhkUl+3mCQ7A2mmS7UHzrmizJJlKfzUbp
	bU5+A24ClmL38PWJ8emsJ/HebX7p4pQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-MVKiHKiwOYC_fBu9YLMREA-1; Tue, 24 Sep 2024 05:32:47 -0400
X-MC-Unique: MVKiHKiwOYC_fBu9YLMREA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374c3402d93so3006603f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 02:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727170366; x=1727775166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SJcOrndr2Q8kdTiLbvvnMMlyzTqrUkUtM9lZEdhJEqo=;
        b=lD62tLEr+g0EDpffhpvzkrn1cLu1fmTVXH0C1RC96SPK1LnHi4VP4ZHrag9quGqrnl
         TBWFH7gKM/lUWBuZF83VFKwZ7PjHKuhDAxg0yKn26r1D6+H0/nSt08Jtg3wWaqW2/H5v
         GSmEZpHklugEKtN7sfo26hEbqmUffIC14Xks4uqNUIp57SXwpECmxvRPovpO78LeTXaB
         evjtyv7RvmS/15UluB5y+Lmv4xQQq/MjcFe+GwllUvOnjMTRj5SR+hKPkkMWvqgDYpYJ
         UlZnCIZg/ayyiHkjerj3B/6TzaeExF1wMWcJkew0AojBtM/PGI0WBvu7yfMz/5CvUCRz
         mgAw==
X-Forwarded-Encrypted: i=1; AJvYcCUsNJlIp8RE6Tts97BS04EsfPCcHlgAOU6W1jpVnLZKnLWQrSc6kczj6SIyBRVyFEXWO/sV+Zh8M6cI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx0XZJN5a4hnaPDkvIQwvc6qVpIMSYpP6iiQBJMhzA921kQSGvP
	/RWmw3CVpWPSEBVWqeXBxt/K+4MNSGe7e29VC+4ONZ0ZR9zGGHMZr8ncund83vxvJWWJLQPBYz3
	4KEUW+Jux0jWpoSVgjapVzGgEW+qPzsNNnJUKloPgmFljdqM5SYiC4dUD4zNmBLALGA==
X-Received: by 2002:a05:6000:88a:b0:374:c8e0:d76b with SMTP id ffacd0b85a97d-37a43147c09mr8011120f8f.6.1727170365814;
        Tue, 24 Sep 2024 02:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDigGYORRKpsBhGsyLJBhWYL7Lww57gawSioYf+/xms9HoOPaT27ejHpSOx2colrco15ssXw==
X-Received: by 2002:a05:6000:88a:b0:374:c8e0:d76b with SMTP id ffacd0b85a97d-37a43147c09mr8011106f8f.6.1727170365401;
        Tue, 24 Sep 2024 02:32:45 -0700 (PDT)
Received: from [10.202.151.204] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2cf138sm1092835f8f.58.2024.09.24.02.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 02:32:44 -0700 (PDT)
Message-ID: <50912944-296b-4a15-9da5-a257e4c8801e@redhat.com>
Date: Tue, 24 Sep 2024 11:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: Define NR_CPUS
From: David Hildenbrand <david@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20240923235617.1584056-1-linux@roeck-us.net>
 <aa23abe3-7236-4b9e-b237-3b822ac9d186@redhat.com>
 <CAMuHMdVEfPtwps0A29WvHcwgo3f+3nTBiGn1PFxoYy1dxPsUMA@mail.gmail.com>
 <66d5e0c1-a6f2-47fd-9a5b-7651457beb43@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <66d5e0c1-a6f2-47fd-9a5b-7651457beb43@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.09.24 10:07, David Hildenbrand wrote:
> On 24.09.24 09:48, Geert Uytterhoeven wrote:
>> Hi David,
>>
>> On Tue, Sep 24, 2024 at 9:34 AM David Hildenbrand <david@redhat.com> wrote:
>>> On 24.09.24 01:56, Guenter Roeck wrote:
>>>> v2: Instead of trying to make SPLIT_PTE_PTLOCKS depend on the
>>>>        existence of NR_CPUS, define NR_CPUS for m68k.
>>>
>>> Okay, looks like we're cleaning up CONFIG_NR_CPUS for good.
>>>
>>> I'm back from conference travel tomorrow; I'll then throw in the following
>>> into cross compilers and fixup any other arch that needs attention:
>>>
>>>
>>> diff --git a/include/linux/threads.h b/include/linux/threads.h
>>> index 1674a471b0b4..e31715e6746b 100644
>>> --- a/include/linux/threads.h
>>> +++ b/include/linux/threads.h
>>> @@ -13,8 +13,7 @@
>>>      * bit of memory.  Use nr_cpu_ids instead of this except for static bitmaps.
>>>      */
>>>     #ifndef CONFIG_NR_CPUS
>>> -/* FIXME: This should be fixed in the arch's Kconfig */
>>> -#define CONFIG_NR_CPUS 1
>>> +#error "CONFIG_NR_CPUS not defined"
>>>     #endif
>>>
>>>     /* Places which use this should consider cpumask_var_t. */
>>
>> This is gonna trigger on almost all architectures if CONFIG_SMP=n.
> 
> Right, probably it's not as easy as:

Yeah, as assumed, Kconfig behaves weird if a symbol is not around. Let 
me think about this the upcoming weeks. Making split locks depend on SMP 
should make it work for now.

-- 
Cheers,

David / dhildenb

