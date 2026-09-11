Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48ADEADC
	for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Sep 2026 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087334; cv=none; b=gmdowuZOXMBeoWXWc3BLvwXAAbcysn2fVEvwkPTCOjZS9gQOuDZHB23CiEa5c/UYbdm1ZXSdiHxvxPMxaM5dwaNC8Yk5OmIz97MBdD/q1Gj1D0Puxtl4UE0U4UkRtKHa0fMDrre/zxmYmBIW33cbrTPBQtB6OMuK53LTAFpLURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087334; c=relaxed/simple;
	bh=ifwhu8qRshgYL3v+PSYoaQhUNJ9YbnEjID0Sa6yKFHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3ZgUcNMYVRpdIrBvHnGgZALUjb60uldQnBYHyk6IkFgsQlBN7GvXqYuvtTYiy9v2hxbwM+UA4dJl48uR5I65XYljR6r9JP82WJSg9TNp2miAeSRlOYdzjyTmV9usjcSrO3ss9usmlr3sYpQSaTGOYchevh3v7/aPOj/bda9Ljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TF+Elq0H; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TF+Elq0H"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 322834171D;
	Fri, 11 Sep 2026 00:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F1D1F000FF;
	Fri, 11 Sep 2026 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789087332;
	bh=4COo+AepnDjGaBzFEu1pr+/w/FLjgeFSlX8uKK9eUrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TF+Elq0HsskrnOkrNPUnzocRSh6qm6Mj546ed6RKFfRs/YDSuduejlQxYAUNfguF+
	 Rf6NCwXW+bzMKSDBgjWVz53eGRQ01OgQyGrtUE8tukSqzQqatYu/dLUgjbkvXiEFem
	 +brumAPvBD09yKWr4K9UjxRk61mClBJaNkvhSiQhUFXHGUK2xMrY6kXzP8hlJsKlze
	 dte8NVKY3czbDPr5mmwxXCktKp94RcRRNVAZIwCb3QLqHQBhq2gncYR3Opx4fcBRNa
	 Ep7hAyAgKO7167mo4bIfdJ+3t544voqEpBUrlf6ttQ/IKyv9CNaZwnQR2fU97PVCQW
	 ZOL3uvSUVAQKw==
Date: Thu, 10 Sep 2026 17:42:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for
 ColdFire
Message-ID: <20260910174210.0f8a4ad2@kernel.org>
In-Reply-To: <20260907134037.1855408-2-gerg@linux-m68k.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
	<20260907134037.1855408-2-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 23:37:09 +1000 Greg Ungerer wrote:
> The FEC driver works today because the m68k architecture io.h has a
> kludge in the definitions of the readl() and writel() functions for
> ColdFire that allow big-endian access if the address of the register to
> access is within the SoC's internal peripheral registers. This is being
> fixed in the near future to define readl() and writel() correctly - with
> no byte swapping. Thus the motivation for this fix here.

What is the motivation for this cleanup? Is someone still making
new SKUs of Coldfire boards? Or (and please don't take this the wrong
way) it was a long standing TODO that was tempting to feed to an LLM?

IMO keeping the hacks in m68k is a better choice. FEC was used on more
modern SoCs, definitely on PPC ones. So we'll be able to get rid of
m68k before we can get rid of FEC. Sprinkling m68k workarounds in 
the FEC driver is backwards.
