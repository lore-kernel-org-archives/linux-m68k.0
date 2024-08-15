Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403218D65A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Aug 2024 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723703537; cv=none; b=N6InE3oHZjCuivf0iLYEBQJmT9TEFBnx+nOUFgat21VpRpm6bNaC36b0bGSZmnSAP/9553qBQkRqL0Dlz4vAJZnNd9ckBXoxZzrtAChwrFJ9n4WHFIm+i+2e55wVErNYhS30RKwCyyjmhqBeAQkEnq0QnlA+o7fo5qzfhSAS6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723703537; c=relaxed/simple;
	bh=HXuXwTles2EvknzMcg/wNQdnX/Z4GUExBFPaBatXWHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRCK1tB0W9WefMdfNap8BzwHeiu5tzQ23N/3mJQDaUz72GvIACrVn5GO1y/gG9BFYi+xlwa2/2mO6KEgzItCx4JEbTnndGOHicHps2c/vDkXf0fQ4gGwpMCNd0PM4hvc6dFGe9HyVXLVskSpr10vNsX6dh4L/n2aENW2f2LWqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG7EM4WA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG7EM4WA"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc47abc040so5232765ad.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Aug 2024 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723703535; x=1724308335; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=FG7EM4WAlAWRlOpQW6ttg8wSHIWi7eaKILalQQijUQvgILcuLQz9dBEbHnfasaBXDX
         pl1k8wrPgGxaT5tFQQXVBcj3f/3oFIj8nI6ZADpAYn7Ht5FxTfR9AkCXnG0tR1fT6Ozr
         JFgiyHtNguQk5PxjYrUerHgtmCgzXZgOUVZLmrnTc/CLfZRV1sjoYQCz8GRH9gGu7jFg
         yfJzvBvi36Tv83nCHkTVMkvsuMywShokl68N9HjkzExywL8WimC9iIm8KVFYpvL/+y3l
         Lzui7yuP6Er/NfIW7S+7VQJzTNFMNApNuKxPbuTbSk9VkRCOSA+0nSL4n7DyY+pqafoy
         EYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703535; x=1724308335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=Nn2rwS9TohG2P3n2gyE0bqlZC7FcLbYFZBE98ekR0Wi1VMsv9g4/Wtml/1uxbs2VwG
         JywdALSheQrFw90bjGQhKYirKxvcNdRBz08ZJvfi5nAbJLfWZ++9UbkCI0o+qF8w0W7I
         bsXhayl8iDGJuO7mpZ+kjaCwWlJ4J8/vacWpCAb0xrt8plwSQeplnzwDuX/GiOI43rLH
         4fV79nPka8hui4ijq2sVYg2gBXIGpY3DdJo419x/mxdatrzwSQl3vo0gIbZZdPM5Y+m+
         YbP5LyKyu2Ow1f2E1NAVrNrf1CtdVpnYOniJMBSlN5Tf8CB9bW7aOLzpUf/OpTQ4fOSD
         /oyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBQr4i3k0h/ZlxXFwUWEedZ/LjzA1yuSFylSt2SK4NafPU44eq+PMHPaBY/p4cf/kXKtsSJhi0TFZvU5I+S72yJusS1xGBlHUiaW+vZUAZ
X-Gm-Message-State: AOJu0Yz6ZqXIvY/KhQVtWTuHcaHZ5MSw4FynUyAGekAFCw+3+W3gLjI8
	qHtAdxYCZNc+8Mmxd7jb39/ZuSA2UuDpN68I/iB2rfCs9S20vcO7
X-Google-Smtp-Source: AGHT+IGHQF6v1wj4OnSDtmW1i+o0W3hXKMZnU/CMxWJVexuFM/VLhfFkwN0de8G4/UHXSn+MbeyB0Q==
X-Received: by 2002:a17:903:11c4:b0:1fb:cf82:11b4 with SMTP id d9443c01a7336-201d63bc296mr66187655ad.6.1723703534763;
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039ef06sm5216095ad.249.2024.08.14.23.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Message-ID: <3351b0db-4764-48a4-8bab-478ba7bfa4f4@gmail.com>
Date: Thu, 15 Aug 2024 14:32:01 +0800
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 "alexs@kernel.org" <alexs@kernel.org>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/15/24 12:50 AM, LEROY Christophe wrote:
> Hi,
> 
> Le 30/07/2024 à 08:46, alexs@kernel.org a écrit :
>> From: Alex Shi <alexs@kernel.org>
>>
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
>>
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
>>
>> These blocks the conception and code update for page table descriptor to
>> struct ptdesc.
>>
>> So, the simple idea to push the ptdesc conception forward is to update
>> all pgtable_t by ptdesc or pte_t pointer. But this needs widely
>> knowledges for most all of different archs. Common code change is easy
>> for include/ and mm/ directory, but it's hard in all archs.
>>
>> Thanks for intel LKP framework, I fixed most all of build issues except
>> a bug on powerpc which reports a "struct ptdesc *" incompatible with
>> struct ptdesc *' pointer issue...
> 
> Can you tell more about that problem on powerpc ? Which defconfig for 
> instance ?
> 

Hi Leroy,

Thanks a lot for response. The detailed error and code tree is from LKP:

On 8/3/24 11:26 AM, kernel test robot wrote:
> tree:   https://github.com/alexshi/linux.git ptdesc
> head:   3735e634f8feb67c941d17222b53906ace2fd2b8
> commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)

>    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
>>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]

>>
>> Another trouble is pmd_pgtable() conversion in the last patch.
>> Maybe some of arch need define theirself own pmd_ptdesc()?
>>
>> This patchset is immature, even except above 2 issues, I just tested
>> virutal machine booting and kselftest mm on x86 and arm64.
>>
>> Anyway any input are appreciated!
> 
> Can you tell on which tree you based this series ? Last patch doesn't 
> apply on 6.11-rc1:

The code based on akpm/mm-unstable tree, not upstream, you can check the code on:
https://github.com/alexshi/linux.git ptdesc

Thanks a lot!
Alex
