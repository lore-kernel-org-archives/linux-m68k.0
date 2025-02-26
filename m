Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34892258CC5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Feb 2025 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558678; cv=none; b=WDpsaFIeWcIUZI9Tw8KzMUwFhoLKfhkXIohvRSFx6yZy0bTGU6xMMLB2An9MguI9EA0eIbHmJ4/bWeOfzyTzysF+8P7oZcsWUK2ybqd6hoGH0oW0VNDnRI0mrKml/WqphbsNn9jvma3GALuK60iJOxzG6qktvpGW3sDFBGhpKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558678; c=relaxed/simple;
	bh=t15i2Nu6IjmH90KiIySiPPJRC3rXNFYxxidwT82OIWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQgj/O3E/o4vdxgMq7mw8t/IwKD2C87KlMYq5kpb6CVcE9+bd7Yuz7wEdb9/+UmovxasDqtxyEz3Yc2BYbz3eOjcch9NMCbwbjtXjznwSiKBBcMiOk546f/kwg8p+xnQzMCp8dHyQigF+0gGfF4Y5YophITjrXFStWFI9vT1//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D791C01;
	Wed, 26 Feb 2025 00:31:31 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D573F673;
	Wed, 26 Feb 2025 00:31:08 -0800 (PST)
Message-ID: <2f4c6d8e-ecb4-42aa-8f42-3d386ac017f1@arm.com>
Date: Wed, 26 Feb 2025 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mm: pgtable: change pt parameter of
 tlb_remove_ptdesc() to struct ptdesc *
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 riel@surriel.com, vishal.moola@gmail.com, david@redhat.com,
 jannh@google.com, hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <60bb44299cf2d731df6592e446e7f694054d0dbe.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> All callers of tlb_remove_ptdesc() pass it a pointer of struct ptdesc, so
> let's change the pt parameter from void * to struct ptdesc * to perform
> a type safety check.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
