Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FD01FBCB2
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749332610; cv=none; b=UNbwcd+ZIwanJ/2doF4Uykf+I0dEuMmcgv9TREPG3sDzyxkXCO0YABoAZyDpjozKw1TG1AOZJNoLnSzKE/BnW81Hy2UNHoW/OT05fhpp4z+uK4PchSddiIINxuljRET8QxzsK3j5Vd+RpkqAOen6+G0k19+doueM+dpP5gMM7q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749332610; c=relaxed/simple;
	bh=XutJfJxwL3Ma5GSMWXDElv+vO5KhNCEazSv3H0Xx7o0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rWuu/UYRCrHX6JsK+ckPf9KWd4cRlJyCcv9qt+gcF6/tSq/pFO3nxqg09mfiOu6FsjdxmPVvz2zN83DOUXnz4wB8StXyVQRZtv+OnmdPDMA3F6HTAWKh/WSgzrVq9IBxq3WSefL5UwE5ReYwmVOZwDL49LuLOZ66wuck0H0mFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4bFBWZ601Nz1r4pQ;
	Sat,  7 Jun 2025 23:43:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4bFBWZ58sBz1qqlS;
	Sat,  7 Jun 2025 23:43:22 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id otONdCFfmrQ8; Sat,  7 Jun 2025 23:43:12 +0200 (CEST)
X-Auth-Info: Q5dAvlAchzB60BFWaiQd0C8nvvWAAx9oBf3x5eVe826Oc0mT7e7khtKbXVwDoGjg
Received: from igel.home (aftr-82-135-83-135.dynamic.mnet-online.de [82.135.83.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  7 Jun 2025 23:43:12 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 9E2142C193F; Sat,  7 Jun 2025 23:43:12 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jason Thorpe <thorpej@me.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Finn Thain
 <fthain@linux-m68k.org>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,  port-m68k
 <port-m68k@netbsd.org>,  debian-68k <debian-68k@lists.debian.org>,
  linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <2126C1A0-7737-4228-9B28-B160C672C8AD@me.com> (Jason Thorpe's
	message of "Sat, 7 Jun 2025 11:43:00 -0700")
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
	<2126C1A0-7737-4228-9B28-B160C672C8AD@me.com>
Date: Sat, 07 Jun 2025 23:43:12 +0200
Message-ID: <87ldq38byn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 07 2025, Jason Thorpe wrote:

> https://m680x0.github.io/ref/sysv-m68k-abi-part1.pdf

How is that relevant?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
