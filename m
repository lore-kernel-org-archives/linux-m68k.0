Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D133F597
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Mar 2026 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774580169; cv=none; b=l8O2Vx9Rf3L07m/6qR2n7Ud+1F8ovhXZgiOoRNcPG3zraKhsMmzRxxJWikIdD/tHrwk1rNmOzaVQMXCa7HqPX9HaD1Q9CGqcDABvRamT5XTZG1Doygiz7k6YWOyrhJMF7tY8A8L7E58+Co5j218dDsSkhGPvPDrYDQ4WCnoGqpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774580169; c=relaxed/simple;
	bh=OXABB1eFjeN1oGH/SXFHZZT4FCIkSR1xm49zyhunO7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QVWElLHrsJuxvYTzXzn5dFyn2avutKNkJiZo3XfanDxsu0swjND1n1oRaYT895M3PKiFvpgE2kjnDf4nR5zJYSBzs25KN1Rl8iR+2KLHZmpojrmat4Cwz60r1hb1YKAB0sFv0VTZevnlt56M78NO1ElUQwTL2EHhdAW7Lv1edDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B0DC60054;
	Fri, 27 Mar 2026 02:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62989C116C6;
	Fri, 27 Mar 2026 02:55:59 +0000 (UTC)
Message-ID: <b89ac970-7990-4a12-9769-82efc945c950@linux-m68k.org>
Date: Fri, 27 Mar 2026 12:55:55 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of
 align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-kernel@vger.kernel.org
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
 <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/3/26 02:56, Ilpo Järvinen wrote:
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
> 
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
> 
> Thus, remove the duplicated aligning from pcibios_align_resource().
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

LGTM.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> ---
>   arch/m68k/kernel/pcibios.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>   	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>   		start = (start + 0x3ff) & ~0x3ff;
>   
> -	start = (start + align - 1) & ~(align - 1);
> -
>   	return start;
>   }
>   

