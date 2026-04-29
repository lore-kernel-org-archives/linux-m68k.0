Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578753B7741
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470310; cv=none; b=aCvwVDgBNlmF7vHwgqYwE/v5X7X/WkH7HXwW7gLms0Ez+GuV0lUrVi0AnHMdeu/rQQE5rrsfnxYZUJpAdJL5tpwlZfZ0+JTs97RllVwYk8p5fzLe04rMoC03xDhaK1dRGtg2SEwfHwH+4AVuzGFRZJy6OMaYxh9wkCCkJUKqveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470310; c=relaxed/simple;
	bh=28+tnpURcjI3sWdESS5K4K12F1ma/NQ5bjrkODhCHQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utrsNS1K3ItI5oIp2xfFIu4W7IoxeqLn1+KuoqzCZAdSOAkZceo8W0WNaSa7b6rc9g4uXxP8Jjidp3tZvVMOp/FC7gpn48EXRXb4iymxTN84DOqpovG2KYO9HsvVO7piuefvokvshilFtlss5QcDhXBbQRLgRojXalLhzNHze34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lam0AiPb; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lam0AiPb"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 126EF60138;
	Wed, 29 Apr 2026 13:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9787FC19425;
	Wed, 29 Apr 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777470306;
	bh=28+tnpURcjI3sWdESS5K4K12F1ma/NQ5bjrkODhCHQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lam0AiPbwbzBU/0hSc41RevrvSuQAvPZmo1aNCx1j4GAePdCwUm9IfR7OdrFHFLY/
	 +SmndazdWl8HJfmjngd9zWSXQEtZV5CxUydIDt9CIgCoQ1T1p/3099syI86PmiJrvd
	 1xtajhVWlGVyMlbVRu207NiixRKlgWZyDARjC2G1sM+EXAIKhqS7dZEjX3ARQ9SDxC
	 sexyQcNvXUqqMUudEcuYpSTuc24A3rWmmsnpuIvLxa6SshIuq8oy9MREg/KuF5M9eE
	 evzlPUxDrHcEmFER6dZ17qE9nV9axjuoOKWp2vypqNUOKu1MesmgkT8NUR1TaAj+EB
	 hidUEPS/IIa0A==
Message-ID: <096acd5f-5284-45a4-b634-08514ae8fff1@kernel.org>
Date: Wed, 29 Apr 2026 23:45:02 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: coldfire: select legacy gpiolib interface for
 mcfqspi
To: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20260428155729.3278685-1-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20260428155729.3278685-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 29/4/26 01:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The common coldfire code uses the old GPIO number based interfaces for
> at least the QSPI chipselect lines. Select the required Kconfig symbol
> to keep it building when that becomes optional.
> 
> Apparently there are no devices attached to a QSPI controller in any of
> the coldfire boards, so this is not actually used in upstream kernels.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, applied to m68knommu for-next branch.

Regards
Greg



> ---
>   arch/m68k/Kconfig.cpu | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index c9a7e602d8a4..148f8a79d206 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>   	select CPU_HAS_NO_MULDIV64
>   	select GENERIC_CSUM
>   	select GPIOLIB
> +	select GPIOLIB_LEGACY if SPI_COLDFIRE_QSPI
>   	select HAVE_LEGACY_CLK
>   	select HAVE_PAGE_SIZE_8KB if !MMU
>   

