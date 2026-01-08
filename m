Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702E23EA99
	for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jan 2026 02:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839032; cv=none; b=KqaPDWWWHZU50SIYD67G5dn6q9TR+4TOP0h5ZOObhhabRJXuvXrhanT+JKd1ROBGg01uCSgaj038IwYAj5pCoG1r5UNyDWYa8ZNsUiOW/Vxxd3O9ez+8WPnF6Cb8MPSQcxJZbVuYbzY/fU9s0SfN9aMAyh5FkOROjbdOboPUVuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839032; c=relaxed/simple;
	bh=ZDpPQWr5z3NT2bQ1AQqz7QtzavFPv5XMuiJ4qVKOIms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ8vKDUqzXC0DVBZhBMWYKhLVfPR2YV1KLFGTlQYVvZsKXgA3XEK3WnCXb4A4SYwMgMbmqyb4Efqk6ZH7cZh09Jo9MYIfnAXs9K9M2j5Y5ACkkM4OxrxSp+nrNCvl9Lr9oT8ZqZC6K4dt1guHt4AXBDirYBRAgv64Jlz8lxRdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpiW3HGu; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpiW3HGu"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fcb465733so30352307b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jan 2026 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767839029; x=1768443829; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=ZpiW3HGujPtsDb0MwUtMtE3MxbHsl81BhQ/YpQVJ9jj6kxp8bzLnX5Y2Cl/lCc3i+J
         wHjuO1sxJd1ST/i8EYMOb9zRGjLsDjODJKIq3FH0N6x0ycsNJpKXmO9PRr98A3Ar5qpQ
         PVNFOU4o3wIXOIhqApuUawvJBRQ+MAeEkLY+TODkitYiZIL2oEhzcv2RV9zfCd1cLhFq
         noI8MFfXwUH1k1a5kUmxOg2kcmv1khNPWEesuj4q1+rfbXBm4nHyfuBNCnxlhBConsGe
         zyV4ip/Rs1Uc5bI5MvHTS7nTuSBrROlE2PmrvBjVhmhlUqYBRchywTk5sbXumYzB7viL
         ZzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767839029; x=1768443829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WPMqEgbiq/1nCGoqJgHIPGVbxZP1MvEMarO5Hdi07w=;
        b=XlLTUG5qq6Ba/tEy13wYf4R9zWuRl6ZnfM7P91CSc73fuCId5eD3HVg8vQeRAdwrCl
         6EGEnh+3sfB+q0vDOy75ye82Q7IbsBLpS62j5SZA8xcnt6rvSrfUYqND7nufttnZjGvO
         RSQvBGY6hiGHbkx67IukNi5gTAJogoLm0GNoweqDvnxc/LUXdP6ftqTsxxBXyKDt6yoA
         mGeDmR7Y1uxvyTrH9HCNG9wn1jvFjSvw5EvCOixUU8DDtEhUNM2iTlg7v9a75HqIAhah
         4slA26yCTkszRJsAy738CSyApXeCugTVZz4KF9bU86EwjxyRyOsJIQF0LCL2Pv/6Om9A
         0CCw==
X-Forwarded-Encrypted: i=1; AJvYcCUMppKq5pWDGWLG9QB5YZURzJMjq1lQmzpIoTXhQYWhOfKLng7rIUIkAe05hO8slzv2IPTm7IbivcII@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyPyOrswt1DzE03r/+2QqnMn2+Dnsef2SvmnHY9W/d+aWUx+Xcy
	zzkmRJIbJgvXpe5xPrIIZ/idp4YdDkL9G7cCDRUJnFOvVKjMKRRho2EJ
X-Gm-Gg: AY/fxX4v2vkv6QjrzKhMRkxvEf8NI2u0UHl/ZUJOfQAzoPQHgVnewGtd9EA2MdVIa3P
	nu8tCStSt7iHpN0hKcdxBYqG/4r+ZM3Lm2Ikr37WoAPteJe6B2TIs4z6/eAabrC2uLeQ8xdoEFA
	lBahJNIiMIzBfFX1mG63IAxV1M0rdAxD1g2TaHYKEzzRy2rpjYmj9kixb8WoDV2KX9zUDvcnZtH
	jc7Wgq3EedsKYGZXFwJDbVV97RZxUh1OaNBtEV1Y1m27LOApzPgEODw64teJTr6q8q9sQv5vfbo
	QJLymNAY546R2FXq+0msavw2SxdM6cSTH3KQsU81UHYtIRyC7/SXiZob2H8E84vQARRmvQE4a/y
	CpG0o+J0+IT2x7jaQihNKTMPEfqMzuuve/Is8zDOYHFkoyrQxMURjH7ucvqdD+A/Pt1t2xyS/wh
	L+ZyDHp2P+V2z63dLc0JqEQGvE8g+h8S8wvP4wjA==
X-Google-Smtp-Source: AGHT+IGgMpL+kZMdvF4ADTgetvjR8KjnRPwe3Xe2CKlVvJLk69qHA2NQZ4MxPPVQYhnVGWyKjWzQjw==
X-Received: by 2002:a05:690e:1c06:b0:644:6b68:f126 with SMTP id 956f58d0204a3-64716cacb29mr3927712d50.77.1767839028925;
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790ae603282sm21321087b3.13.2026.01.07.18.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 18:23:48 -0800 (PST)
Message-ID: <1d110134-89ab-474b-bca6-cfbfd4b5057f@gmail.com>
Date: Thu, 8 Jan 2026 10:23:19 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pgtable: convert pgtable_t to ptdesc pointer
To: Matthew Wilcox <willy@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>, alexs@kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-arch@vger.kernel.org>,
 "open list:MMU GATHER AND TLB INVALIDATION" <linux-mm@kvack.org>,
 "open list:C-SKY ARCHITECTURE" <linux-csky@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:OPENRISC ARCHITECTURE" <linux-openrisc@vger.kernel.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:USER-MODE LINUX (UML)" <linux-um@lists.infradead.org>
References: <20260107064642.15771-1-alexs@kernel.org>
 <aV4h5vQUNXn5cpMY@kernel.org>
 <080e493a-e4f1-4c97-a3e1-f76f126b5213@gmail.com>
 <aV5yIuGi9Ni5YP5E@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <aV5yIuGi9Ni5YP5E@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/1/7 22:48, Matthew Wilcox wrote:
> On Wed, Jan 07, 2026 at 05:28:36PM +0800, Alex Shi wrote:
>> Right, I will fix this. and sent the 2nd version.
> No, the patch is stupid and wrong.  Don't send a v2.  You seem to have a
> hairtrigger resend, so I'm trying to prevent a v2 being sent instead of
> sending a patient reply.

Hi Matthew,

I hear you—no v2 will be sent.
but sorry for a bit confusing, what's your expected fix? is the too 
quick resenting? or the direction to alignment pgtable_t with ptdesc is 
wrong?

If it's the first. the new change for review address Mike's concern.
diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
index a17f01235c29..a204c3ac800a 100644
--- a/arch/arm/include/asm/pgalloc.h
+++ b/arch/arm/include/asm/pgalloc.h
@@ -94,13 +94,13 @@ pte_alloc_one_kernel(struct mm_struct *mm)
  static inline pgtable_t
  pte_alloc_one(struct mm_struct *mm)
  {
-       struct page *pte;
+       struct ptdesc *pte;

         pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
         if (!pte)
                 return NULL;
-       if (!PageHighMem(pte))
-               clean_pte_table(page_address(pte));
+       if (!PageHighMem(ptdesc_page(pte)))
+               clean_pte_table(ptdesc_address(pte));
         return pte;
  }

@@ -141,7 +141,7 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, 
pgtable_t ptep)
         else
                 prot = _PAGE_USER_TABLE;

-       __pmd_populate(pmdp, page_to_phys(ptep), prot);
+       __pmd_populate(pmdp, page_to_phys(ptdesc_page(ptep)), prot);
  }

  #endif /* CONFIG_MMU */
