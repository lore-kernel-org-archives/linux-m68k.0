Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEF927603B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  2 Jul 2025 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461235; cv=none; b=JePDMWyDYmBsnq5D4zQnHvjlTq6ZK/YJue09YZERnrSIgr65nleuq3XTZDoEJe7VHuvn476lataqaqCdxL36t2VKokFDSdoZbK47gsCJYxFBObZMzhybtGUPfNQjGAYKRikIFuXsksg9uV0XhljURtV279wHZk90h5XCjbXAwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461235; c=relaxed/simple;
	bh=3jG+fkwb7Ujhu5FmDmiXnzy7sAxfPYKezCKC13BEJag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR5Qp02/Wq8JKtvw29ctqHwa4fuXUYqSWJ7ERdqbq+ZNzvhz3z70BE+5P5llT0JpfDlgNB/z4XuNvh75ecgHjXclDN2PmmSDc9GA43SLipvtbHzwA2YFUIUc/P/OAJy94dTuZMaYmkXiBo+N5RUH0y2X+whAn3Kny+Z2EAhSfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B2A643F28;
	Wed,  2 Jul 2025 13:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F356C4CEF0;
	Wed,  2 Jul 2025 13:00:30 +0000 (UTC)
Message-ID: <55f3eec5-184d-4743-8d1c-911c1fcc27b2@linux-m68k.org>
Date: Wed, 2 Jul 2025 23:00:28 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
To: Thomas Huth <thuth@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>, linux-kernel@vger.kernel.org
References: <20250611114056.118309-1-thuth@redhat.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250611114056.118309-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 11/6/25 21:40, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
> 
> The x86, parisc and sh patches already got merged via their specific
> architecture tree:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda
> 
> So I assume the m68k patches should go via the m68k tree.

Looks good to me, for the whole series:

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks
Greg



> v2:
> - Split the m68k patches from the global series
>    (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
> - Rebased the patches on linux-next and fixed the conflicts
>    and new occurances of __ASSEMBLY__
> 
> Thomas Huth (2):
>    m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
> 
>   arch/m68k/include/asm/adb_iop.h           |  4 ++--
>   arch/m68k/include/asm/bootinfo.h          |  4 ++--
>   arch/m68k/include/asm/entry.h             |  4 ++--
>   arch/m68k/include/asm/kexec.h             |  4 ++--
>   arch/m68k/include/asm/mac_baboon.h        |  4 ++--
>   arch/m68k/include/asm/mac_iop.h           |  4 ++--
>   arch/m68k/include/asm/mac_oss.h           |  4 ++--
>   arch/m68k/include/asm/mac_psc.h           |  4 ++--
>   arch/m68k/include/asm/mac_via.h           |  4 ++--
>   arch/m68k/include/asm/math-emu.h          |  6 +++---
>   arch/m68k/include/asm/mcf_pgtable.h       |  4 ++--
>   arch/m68k/include/asm/mcfmmu.h            |  2 +-
>   arch/m68k/include/asm/motorola_pgtable.h  |  4 ++--
>   arch/m68k/include/asm/nettel.h            |  4 ++--
>   arch/m68k/include/asm/openprom.h          |  4 ++--
>   arch/m68k/include/asm/page.h              |  4 ++--
>   arch/m68k/include/asm/page_mm.h           |  4 ++--
>   arch/m68k/include/asm/page_no.h           |  4 ++--
>   arch/m68k/include/asm/pgtable.h           |  2 +-
>   arch/m68k/include/asm/pgtable_mm.h        |  8 ++++----
>   arch/m68k/include/asm/ptrace.h            |  4 ++--
>   arch/m68k/include/asm/setup.h             | 10 +++++-----
>   arch/m68k/include/asm/sun3_pgtable.h      |  8 ++++----
>   arch/m68k/include/asm/sun3mmu.h           |  4 ++--
>   arch/m68k/include/asm/thread_info.h       |  6 +++---
>   arch/m68k/include/asm/traps.h             |  6 +++---
>   arch/m68k/include/uapi/asm/bootinfo-vme.h |  4 ++--
>   arch/m68k/include/uapi/asm/bootinfo.h     |  8 ++++----
>   arch/m68k/include/uapi/asm/ptrace.h       |  4 ++--
>   arch/m68k/math-emu/fp_emu.h               |  8 ++++----
>   30 files changed, 72 insertions(+), 72 deletions(-)
> 

