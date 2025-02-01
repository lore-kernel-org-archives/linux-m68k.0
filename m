Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B321C5D78
	for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Feb 2025 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427863; cv=none; b=fsUr2Zg4Eg3Mg6JBiF4GEYITZbERGZA6ejDw+y8feyPt7HPdEF0Q+8ZjVeh6gR+SJqtn6l53A57kvYxCQ9ixEO25dwrfGvBWlFR3q2yxdNp2D0bXrZ02Uhlsqgmm9gWCrH8wHUhB6HioIeGwfPFBWUoFIv7X4JZ+tqhmM+aUZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427863; c=relaxed/simple;
	bh=Xsx+h7j2fm0O9kznMhuOvfwmOymLnm1uUUsgRlKvkR4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MDvaT0dOoS4DmOIosN0es3wSk1ZaKnKnOWr3CzL4kM9FODbdxcFGzOeJCgRWgS1DaWQReJTeVe/xTX0M8Vzkr6TXIQgHBSaixTPWjeMzyoCE6CQrW/F6KOE51BH0eLid6lU9rK0UVyIoDi4FV0O+FnYFiswShuceav1GsXvy/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ofkNjaVK; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ofkNjaVK"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738427859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5d2J9YxFE/gyu9Udpry9VU9ZuXZmhyr5X6vJaTZwsk=;
	b=ofkNjaVKFNL8YRLeDxfcCc10Ajba5jZEUiwulw30s3g6smGyDTCb9c1enziUyvhWqr0IB2
	c1zgQMOlfl8zNZIt2/pTXtZi3mJVsL+NVk6CsHuVeZh3jUsvC9zgE545hysDOUnpoopBPN
	ybpW+FveVZw/HwU7hFbzQaraRkq4kqc=
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] m68k: sun3: Use str_read_write() helper in
 mmu_emu_handle_fault()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
Date: Sat, 1 Feb 2025 17:37:26 +0100
Cc: Sam Creasey <sammy@sammy.net>,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7F49FB4-6DDF-47EA-97CA-8DFDC0D2F76C@linux.dev>
References: <20250117120605.126941-2-thorsten.blum@linux.dev>
 <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Migadu-Flow: FLOW_OUT

On 20. Jan 2025, at 16:41, Geert Uytterhoeven wrote:
>> --- a/arch/m68k/sun3/mmu_emu.c
>> +++ b/arch/m68k/sun3/mmu_emu.c
>> @@ -371,7 +372,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, =
int read_flag, int kernel_fault)
>>=20
>> #ifdef DEBUG_MMU_EMU
>>        pr_info("%s: vaddr=3D%lx type=3D%s crp=3D%p\n", __func__, =
vaddr,
>> -               read_flag ? "read" : "write", crp);
>> +               str_read_write(read_flag), crp);
>=20
> You haven't really tested this with DEBUG_MMU_EMU enabled, have you?
> Fix sent.

Sorry, I missed this question.

I compile-tested it with DEBUG_MMU_EMU, but ignored the pr_info() error
you fixed in [1].

Thanks,
Thorsten

[1] =
https://lore.kernel.org/linux-kernel/b1d12a1d24b4aea9f98d905383ba932b2dc38=
2e6.1737387419.git.geert@linux-m68k.org/=
