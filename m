Received: from server43.webgo24.de (server43.webgo24.de [185.30.32.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AF26AD9
	for <linux-m68k@vger.kernel.org>; Tue,  4 Mar 2025 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.30.32.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741067276; cv=none; b=lpBXNCfgj6RLuiKjtPHdfvermlD+OzHDVwMrWhzNs33EbBOxAPMXomraP9q1U5puCjt8DVFsFNZtCjgd4H0Lr9veEsvGr2sG41/RilkC6gGBrjEXgiRgsQwbXkrZ/W5PNijrvg8KaCUDvO19WBEyPiJNrjAn5i+z8L1mqpbsPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741067276; c=relaxed/simple;
	bh=cY7tXOU1DaxJQVZ1ojSdCu5Abx/zLbSp0+vOZ0ZKnVY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBI+rQSI5ZoHMm4JiY9/DCOeJLkxbZjhmwTe6Is1GvEiEWtpMe0/IyETrawrTe03JSgwOtLlj0ZLSFIwz53ZN7qx1KsW4HKVLhpPuHr6J8MzdFZKuMKUxcoxkpRVrC7NZTS4y02GRf51wM9RnieNMtJbolqze8w5WPE6CGr3QtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de; spf=pass smtp.mailfrom=tho-otto.de; dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b=alI+Rv4V; arc=none smtp.client-ip=185.30.32.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b="alI+Rv4V"
Received: from earendil.localnet (dynamic-080-171-054-098.80.171.pool.telefonica.de [80.171.54.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server43.webgo24.de (Postfix) with ESMTPSA id BEF9D4111227;
	Tue,  4 Mar 2025 06:47:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tho-otto.de; s=dkim;
	t=1741067271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lj7HjDQnI8Gc57Ke93/Yr1df1eXahmQe8cuP1K6bKxc=;
	b=alI+Rv4Vq3wU0iYkz24c3QeIyd0l2a2v8QG+pa1RhUoRXOW77DoprxP+63GvRUJ+MiaWhb
	UPUB7vACiinj9AaJqH6WLtTZP+keyAEtP+1HWy9jyKYPC9g8S6ED3a4A8CdAX/CJZ4fHf8
	s4K+mjM3Of/Mgr2vUqgQ2SErj8NNLhSXpoRjt5SSGor5pkuOLWyy6Qoobq87uC6UQnOPFQ
	/ZisNsR5yITh+/ocLK2kN5WetIWuLxV/9Lga71a1sLvt3V+AQIRMhZcJYplgZIijO9+I0L
	NExYanJ36MarDN4I/p9sP4dkzMJuazL5fc36WX6fK+2tx8E15KIpRoSIkxT2+A==
From: Thorsten Otto <admin@tho-otto.de>
To: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Software FPU emulation in linux kernel
Date: Tue, 04 Mar 2025 06:47:40 +0100
Message-ID: <6144250.UjTJXf6HLC@earendil>
In-Reply-To: <091d25fa-6a79-4685-a920-075611e79626@gmail.com>
References:
 <3374772.VqM8IeB0Os@earendil>
 <091d25fa-6a79-4685-a920-075611e79626@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> 
> both operands are checked for infinity
> first.

Not really. The code reads

/* Handle infinities */
	if (IS_INF(dest)) {
		if (IS_ZERO(src))
			fp_set_nan(dest);
		return dest;
	}

So the src argument is checked for ZERO first.

Similar in the implementation of fgetman:

	if (IS_ZERO(dest))
		return dest;

	if (IS_INF(dest))
		return dest;



> I cannot locate the specific assembly function you mention
> (fp_long_ext2ext). Can you post code or disassembly to illustrate the
> problem?

A sorry, i meant fp_conv_ext2ext. It is called by the fp_normalize_ext() macro 
in fp_emu.h, which in turn is called by fp_monadic_check/fp_dyadic_check.

> That might be a genuine error in the sqrt algorithm there - can't see
> how it does arise though.

I think this is caused by

	dest->exp += (exp - 0x3FFF) / 2;

`exp` here is the original exponent of the source, and if that is < 1.0, the 
expression `exp - 0x3FFF` will become negative, but the division truncates it 
towards zero. IMHO using `>> 1` should fix that.

>  You may
> have to look elsewhere for a feature complete FPU emulation (does netbsd
> have that?).

Yes, NetBSD has something similar, and it seems to be almost complete, 
including all the trigonometric functions. However they do everything in C, 
including all the <ea> calculations. The linux version seems to be much better 
in this regard.



