Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2B13CF690
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088636; cv=none; b=t2mg/vVRV2CMEKfIX+yegYNISa2wm+TwhXHZvZ3ikqD/0dnYHBk0MJfc6CeJ1cDEYdXQqHOpTh4+JuWvVhhD+Rc8dLcQ4Xov9ny6vF8N6aUSN1YIYlFlul+xSAo6bcNwS5AR+/GJxfuAtjTZTYTSLsjXuiqxSReFHDyi7NA/hrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088636; c=relaxed/simple;
	bh=2cBIiO+uz/sws7ZGm4x5pp2RKIGkU2SjwNQ62cLQ2BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8JSVsz1dy+507O1B0KZmBj7Fq3bbqvaQ2X9XjLwRlqoHUya6OvTqCznVW6RWX6WD/I8tPZbie9t+UuJP1Gf8Fzm/YVO+nLWRFrUTAH7XKuKOuCvN/j+DXOuZSRrDDrKf49YUdZp+klyzM9YCUsRD93GiMxJTlaHUsnnQJJlfKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJIkjFeO; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJIkjFeO"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65DA042E41;
	Mon, 18 May 2026 07:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE195C2BCC9;
	Mon, 18 May 2026 07:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779088634;
	bh=2cBIiO+uz/sws7ZGm4x5pp2RKIGkU2SjwNQ62cLQ2BY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kJIkjFeOaa7zncyj5zvFqCrGCLGohQai1h2Av72Khf33cOhPPn6TzFIGa1aAHUuBf
	 hUfNBO4hFM4dT4vPLRDPgAdYVrp2y0ljMfbN7vurRfxn6A9TQxsd4REakCoQF3wyTX
	 9kqlQGV1sDaEKlGASEfnpaC+gPQgHkBGEaXSXM11pHI0fLK/tWpAylD3/P8fIRwzBU
	 HTMYhsatWzFVTmw2p45J/CV2qi5Gd6bz2EFKXXlqCnSyVoAWVz3NwwZUwjgIDu6DZk
	 eCxKzkKzwbmKxEpGV0yH6sHlg8W/nkCyazr6KAeRYeA3zgbPTgUqyzLhoQkxA+vCjU
	 bv/NWzQvbxsIw==
Message-ID: <76942c55-5918-4ec3-a75e-4717e4e3eb01@kernel.org>
Date: Mon, 18 May 2026 17:17:09 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel() on
 ColdFire
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-mmc@vger.kernel.org
References: <20260506142644.3234270-2-gerg@kernel.org>
 <20260506142644.3234270-6-gerg@kernel.org>
 <CALSJ-wDuXfMzV=Ydic-2S=2v+jbe034gqmy+wr-R1d14LBxuFQ@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CALSJ-wDuXfMzV=Ydic-2S=2v+jbe034gqmy+wr-R1d14LBxuFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 18/5/26 05:00, Angelo Dureghello wrote:
> Hi Greg,
> 
> On Thu, May 07, 2026 at 12:26:46AM +1000, Greg Ungerer wrote:
>> From: Greg Ungerer <gerg@linux-m68k.org>
>>
>> The implementation of the readX() and writeX() family of IO access
>> functions is non-standard on ColdFire platforms. They check the supplied
>> IO address and will return either big or little endian results based on
>> that check. This is non-standard, they are expected to always return
>> little-endian byte ordered data. Unfortunately this behavior also means
>> that ioreadX()/iowroteX() and their big-endian counter parts
>> ioreadXbe()/iowriteXbe() are wrong. This is now in the process of being
>> cleaned up and fixed.
>>
>> Change the use of the readX() and writeX() access functions in this driver
>> to use the recently defined specific ColdFire internal SoC hardware IO
>> access functions mcf_read8()/mcf_read16()/mcf_read32() and
>> mcf_write8()/mcf_write16()/mcf_write32().
>>
>> There is no functional change to the driver. Though it does have the
>> effect of making the IO access slightly more efficient, since there is
>> no longer a need to do the address check at every register access.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
[snip]
> 
> Tested this now on stmark2, sdcard mount/umount/read/write/erase works
> as usual. Thanks.
> 
> Acked-by: Angelo Dureghello <adureghello@baylibre.com>
> Tested-by: Angelo Dureghello <adureghello@baylibre.com>

Fantastic, thanks testing.

Regards
Greg

