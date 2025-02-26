Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE021C9EC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Feb 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537323; cv=none; b=UOzi9MlOwE9BOJ2tCtyMSwsfian7vpeYb+HZLIv1Bcidg1CDPobXvxfrDjEvYasiFGq9owks5rwNyzunM/tAMtscOF/Sr7+bf6C+vvmbu7GGv4KR6mSxZWpjKvpx3NAR/uvCTJKoI3ueI1LAwBe7xshfC6JKbjvfMswipVxlk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537323; c=relaxed/simple;
	bh=D1D8rS483Kvk10lvdoELGqdaSPPJ8+RwRwWrcJv/f3I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mCLbxAocDRansCgeTUFkLvHbPmsYj95hZ1nukhrLOUq+ucVD4czegncbXtN4NZ4ZfZgSvUx3GAF+H6XNDokQuA6qzI8i0c08JZDQ1AxtRB/Y8B1sVpSPxOQL64v34jgZIcxi2ZbnXAaGSIisiuzsvOKZn64+uSvc1KJyiCXhQnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S1gwcxb1; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S1gwcxb1"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1B905C42C6;
	Wed, 26 Feb 2025 02:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C5C4CEDD;
	Wed, 26 Feb 2025 02:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1740537320;
	bh=D1D8rS483Kvk10lvdoELGqdaSPPJ8+RwRwWrcJv/f3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S1gwcxb1U5NetK3xMsHF5vM6u60LvjvD37R2V7WH6p4gYsrCTXOx/Tm8FgtAbjivR
	 qz+7qiIisTFHmeHWl5R9WetoFdsZhGC4DSBkZuJtQrrOYkeMmMmZLGVAL4e/QXKk4q
	 rWdAk6qG/KIo4K2Hgo8x/4gNeZ32aVYhEb8keWT8=
Date: Tue, 25 Feb 2025 18:35:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Message-Id: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
In-Reply-To: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
	<36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> The x86 has already been converted to use struct ptdesc, so convert it to
> use tlb_remove_ptdesc() instead of tlb_remove_table().
> 

This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add
Rik's patch to mm-unstable also and shall figure it out during the
merge window.
