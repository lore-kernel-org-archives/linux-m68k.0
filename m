Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DF2690CF
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642252; cv=none; b=s1EX9L1jw7njR3ukxRgJYPCLEXZBVVFxPN4Iq/P0BEHoCyvCkuOQrlnIk225buhh1Eiapxj30sFpS1orW+CTA+Ab7BxH4SPI+qpLaihqknzDfqX4fiIYEdHpv4eQSXnTwJilH0btU5XPnBwwbd1AQj5XvJDb6HwRQ//aF1p1Gc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642252; c=relaxed/simple;
	bh=ecp8QAYfIX6gZcyfm5Fkbb3D5zbIh5wXihPhAIAOKfU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RSlqruHy/NkfbVUAglA2Sz01wM5gWbpC6ErKHqp/3ChhBSxDGJlZF/dIGPBxYp6RNNjlEhJhrKoXsCglDl+LKmckOL/LRE/0P9wHQPzdb1J1UvL2RnP/r6UsiFZ6SW0DiZlUiXmuq8Ifot4+TF56qoE4JIMvbs/OpMqP3OZJWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4b19DX6tPpz1r5Sd;
	Mon, 19 May 2025 10:03:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4b19DX4fSwz1qqlS;
	Mon, 19 May 2025 10:03:40 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id th2dglqFWtCp; Mon, 19 May 2025 10:03:30 +0200 (CEST)
X-Auth-Info: YgEOoy7tGhicJQXS6kBfFfrxSyDUEFKQdT6+myXdJzwNHy33B1Pzrtr9PCd3EZYn
Received: from hawking (unknown [81.95.8.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 19 May 2025 10:03:28 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  Antonio Vargas Gonzalez
 <windenntw@gmail.com>,  James Le Cuirot <chewi@aura-online.co.uk>,
  libc-help@sourceware.org,  debian-68k <debian-68k@lists.debian.org>,
  linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz's message of "Mon, 19 May 2025 09:54:55
	+0200")
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	<CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
	<ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
	<CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
	<75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
Date: Mon, 19 May 2025 10:03:28 +0200
Message-ID: <mvm4ixhf2nj.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mai 19 2025, John Paul Adrian Glaubitz wrote:

> Good idea. I will do that. My assumption is that on Linux, GCC developers
> actually just forgot to switch alignment from 2 to 4 bytes with the switch
> to ELF unlike NetBSD.

The Linux developers care about backward compatilibity.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
