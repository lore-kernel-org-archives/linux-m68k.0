Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864F71D6C7F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 13 Sep 2024 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223255; cv=none; b=HCEjLdMxjsw9JM/uHdbVDHK8P6zxCKewcJlWLriCM8zGrlEs3q5Gwhcrn9BpOhI9YFwRTmoEb+rZKgCWSCAVHF0CQoE9x9hJbxF8583O/X0kjyjkvLJlfy0PyA+8CJdDGjiWrlxLs3MuTULyaxaYmv/t3876Rm6PltYSwaqAybQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223255; c=relaxed/simple;
	bh=kmK/SPNRil/4AojhazHVknaNAsrDW0H1jS/HHKg8VEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OONj1w6rdCfNyB1QcUmvMhegxvZOunebNVHtE9gj4J8E3r7bcc6MHNvG6QrUkz0vs9HrR1ssnn5TVCfw8g4KieXhekZQROlDcYxbB21O8G8S+0FaGxf8N2GyUaRV7OW/77r8UGQoTs9xTTnAPmIdiZi4rbDWikrxjvLP01mwzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372AA13D5;
	Fri, 13 Sep 2024 03:28:02 -0700 (PDT)
Received: from [10.57.82.141] (unknown [10.57.82.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F132B3F64C;
	Fri, 13 Sep 2024 03:27:30 -0700 (PDT)
Message-ID: <f7129bab-4def-4d64-8135-b5f0467bf739@arm.com>
Date: Fri, 13 Sep 2024 11:27:29 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] mm: Use ptep_get() for accessing PTE entries
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-fsdevel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <20240913084433.1016256-1-anshuman.khandual@arm.com>
 <20240913084433.1016256-4-anshuman.khandual@arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240913084433.1016256-4-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/09/2024 09:44, Anshuman Khandual wrote:
> Convert PTE accesses via ptep_get() helper that defaults as READ_ONCE() but
> also provides the platform an opportunity to override when required.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 2a6a3cccfc36..05e6995c1b93 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1060,7 +1060,7 @@ static inline int pgd_same(pgd_t pgd_a, pgd_t pgd_b)
>   */
>  #define set_pte_safe(ptep, pte) \
>  ({ \
> -	WARN_ON_ONCE(pte_present(*ptep) && !pte_same(*ptep, pte)); \
> +	WARN_ON_ONCE(pte_present(ptep_get(ptep)) && !pte_same(ptep_get(ptep), pte)); \

Suggest reading once into a temporary so that the pte can't change between the 2
gets. In practice, it's not likely to be a huge problem for this instance since
its under the PTL so can only be racing with HW update of access and dirty. But
good practice IMHO:

    pte_t __old = ptep_get(ptep); \
    WARN_ON_ONCE(pte_present(__old) && !pte_same(__old, pte)); \

Thanks,
Ryan

>  	set_pte(ptep, pte); \
>  })
>  

