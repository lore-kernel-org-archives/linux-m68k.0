Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A46347536
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595268; cv=none; b=aZM0MCq7vXAL4XHOkWNTp5v5pT7ohUKB4yenR99MWWzPeZb3Xyc2UIGDUlwG0FfhAxKiS6nM+cJEvjkXzcmUcyHQaqAp+BOrieBrf8pnZyuC9mCRAdmL+/TayJLJQ0BrDrfE5rNfyE8RxwVBcOh7XyrtClI4AOgkIINQHctWZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595268; c=relaxed/simple;
	bh=y4hlWk9ZEJA6jYo3iCVEIFOERUQU8wyIz8sHPRPAkk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jEaLNZ1hlQGWHiM71VhgiSZdgv7GC5b8730ZU53F/5KIOj1uGO+fQv0c/OeGLkZP7YSsJcWAxMqLtxOFsMp9kPR1muoQvEMfkWdyWPh7cIBEHLz+xFmWHODSQZsmT5QoeV9K7uaQ1KvX1aroJCKjFVSRaJxzhgT38EXE1iP99Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzd//Lv1; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzd//Lv1"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7BF600E2;
	Sat,  5 Sep 2026 08:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCB91F00A3D;
	Sat,  5 Sep 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595266;
	bh=57c8Q441YCTfAzPWDpB534N08KkDAY1tKDYFjbar4Sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Tzd//Lv1GCVMF2Nk2OOIDP1wRyuNyZfaFTWI4T6yaczfAbrvD0reuhb9zmpb7goit
	 6vIQ30ma5hTbKi/gLlsU+4kONtUSwX3g7CuCUSasbdoOOankk+UMiqTrK/kc+TYrbi
	 ddthFwYT56YXbZv8ubzvemzBkWc8LSupkqT+vFrueABmEzQjZqSNY+3JfEBqX4nfeL
	 jjD2MROQP/ujoSRsa++wU6RwIHO8N7qKT3iEWR+ceEl5T5daV22LdAbX74WIOSAwVI
	 toUy0wNpPFAi1rT5fkmaDhVkw2AdhxjLJ4jUdS01NfUzDO4ust/xfs99g/Rz2mnhPm
	 f469vj6TKclnA==
Message-ID: <bfd2fd19-0671-44f0-a2b8-a159be6a1c7d@kernel.org>
Date: Sat, 5 Sep 2026 17:01:00 +0900
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and
 pata_legacy.winbond entries
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org
References: <20260905070347.25902-1-kmehltretter@gmail.com>
 <20260905070347.25902-10-kmehltretter@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260905070347.25902-10-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 16:03, Karl Mehltretter wrote:
> pata_legacy no longer has qdi or winbond module parameters. The QDI
> support went away with commit 0dcd0a76370a ("libata: remove no longer
> needed pata_qdi driver") and the Winbond VLB support with commit
> 3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
> refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
> which do not exist either.
> 
> Drop both entries.
> 
> Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
