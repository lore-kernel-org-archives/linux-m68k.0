Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872F19B3EC
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310645; cv=none; b=XfVRAhvBM44HzxlCCGCcwWf3q0NvZ8wepIQioIb4iwU9xDfpHLNm0WGxO3jelC9DmeGVv3I253JWMLiZJelgv/h7sHaOL5ehCHkIlG1yrVnlXJkAE/8z+3iniUlroFHUrpUkMd7qRtFq3HQv33R/Bn8wSBecguhwQvv5DEbhFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310645; c=relaxed/simple;
	bh=K6ip57r1pyfWAUR83dovHSsqmJYfItI0oPrxqUWoCJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rK1AIgBOYpHNXwPY2C6L0jXLDnNwC5YXpyJhuTV3zHLOLRIGDFgS+3ktru8AfESvWDU+oWgQg4BQIMr2EBG8tsTDmreZDl/GPocPF3HYZYj8VdKsrddaKgcqweiNxfJH9+DhWh7xcQ2nYJ2Ae1eDZnPipdIbLdAU07sicyZ8QyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4bF2PB73xSz1sFPP;
	Sat,  7 Jun 2025 17:37:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4bF2PB5Ljbz1qqlS;
	Sat,  7 Jun 2025 17:37:18 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id U2B-JYtLrVye; Sat,  7 Jun 2025 17:37:09 +0200 (CEST)
X-Auth-Info: MwAgyJH4/x17btrfi2qLm1HrBVmDf9yi5zxx396xxgRurlWCceROeSgd6woZiJBw
Received: from igel.home (aftr-82-135-83-135.dynamic.mnet-online.de [82.135.83.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  7 Jun 2025 17:37:09 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 02BE12C192A; Sat,  7 Jun 2025 17:37:07 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
  debian-68k <debian-68k@lists.debian.org>,  linux-m68k
 <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <2eb555796aaa51267c0d2c88ad890b72f6684b94.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz's message of "Sat, 07 Jun 2025 17:23:44
	+0200")
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	<442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	<9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	<80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	<95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	<CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	<d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	<758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	<8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	<87sekbq3f8.fsf@linux-m68k.org>
	<2bd7d3370101b73288f9a1cd1b6eed0ba0da700e.camel@physik.fu-berlin.de>
	<87cybfaa74.fsf@igel.home>
	<cca30c2641b40815e58add6bebee3178896666a4.camel@physik.fu-berlin.de>
	<875xh7a91r.fsf@igel.home>
	<1483007ddfcb164a5b1a5ccfcc053965af1a56bd.camel@physik.fu-berlin.de>
	<871prva88s.fsf@igel.home>
	<2eb555796aaa51267c0d2c88ad890b72f6684b94.camel@physik.fu-berlin.de>
Date: Sat, 07 Jun 2025 17:37:07 +0200
Message-ID: <87tt4r8sws.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 07 2025, John Paul Adrian Glaubitz wrote:

> It was very obviously your decision to use 2 byte alignment even though it
> was against the official SVR4 ABI ;-).

No, I followed the official ABI.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
