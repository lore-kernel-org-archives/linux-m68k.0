Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A353C10B4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Jun 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369830; cv=none; b=e9lTUOo1HnCfp/MG5+mQryrFdODm+/ieaHaVjzjQ1/qtwGWXfAFVmHPr2k6+CeUdVw/G3dk5HfCwBQB1X5dpRt+vg7pi7U4PRhI8KNx6BqTtOL4eSte1z0Qzx7M8vv3VkF3dM17kAIya5vXz4yOVn75cvOFFlB/rV6yshxF4PWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369830; c=relaxed/simple;
	bh=OUgJDAxGrGnstexm3uwh7RTc+V1z6zuT+cMkKUVRp84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+xiTeYM/q5LodpD9YpnuXOZRLDjCXZj1bsijL/yi+sZj9dSeHX1s5oU+165tOya/GQ8LNFO/c4AbfjEZI3vTpRMgJQPpft1s2WXI+824erHiAiaPNlpc/kNMd3L5X43uqA5RlNjgidDb4bH6DvUuPbo5oZaqsV+/dvz9XGWrPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42CAE6021C;
	Thu, 25 Jun 2026 06:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF871F00A3A;
	Thu, 25 Jun 2026 06:43:34 +0000 (UTC)
Message-ID: <c5b59c08-ea1c-4395-a79e-1333f042fb5e@linux-m68k.org>
Date: Thu, 25 Jun 2026 16:43:17 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] m68k: stale CONFIG_MTD_UCLINUX still guards ROMFS
 relocation paths
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260625060742.7769-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260625060742.7769-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pengpeng,

On 25/6/26 16:07, Pengpeng Hou wrote:
> Hi,
> 
> while auditing conditional source paths, I noticed that current m68k source
> still has an early boot/data path guarded by CONFIG_MTD_UCLINUX, but that
> symbol no longer appears to have a Kconfig provider in current mainline.
> 
> The relevant guard is in arch/m68k/68000/head.S:
> 
> #if defined(CONFIG_ROMFS_FS) && defined(CONFIG_RAMKERNEL) && \
>      defined(CONFIG_MTD_UCLINUX)
> 
> That guarded block moves ROMFS data and adjusts _ramstart / __bss_stop
> related state.  At the same time, several m68k defconfigs still request
> CONFIG_MTD_UCLINUX together with ROMFS support.
> 
> A bounded config oracle over representative m68k defconfigs shows that the
> final .config drops CONFIG_MTD_UCLINUX because the symbol has no current
> provider.  In other words, the source still describes a boot/data world that
> the current Kconfig universe cannot realize.
> 
> I am not sending a patch yet because the intended repair is a policy question:
> 
> 1. remove the stale defconfig requests and guarded source path;
> 2. retarget the guard to a current condition; or
> 3. restore an arch-local option if this boot path is still intended.
> 
> Could you advise which direction is expected for the remaining
> CONFIG_MTD_UCLINUX guarded m68k path?
> 
> This is static source/config analysis only.  I have not runtime-tested the
> affected boards.

Thanks for pointing this out. This is news to me, and looks to only have
been removed in the current 7.2 merge window. I am digging now, but I
believed this still worked before removal and was in fact in use.

Regards
Greg


