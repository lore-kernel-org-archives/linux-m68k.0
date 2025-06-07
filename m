Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9313AF2
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749308609; cv=none; b=bYcJIp0cVIoRvY9RBXVC3KlcANlUGuZ4nPyM+G0suHsUSXrYwjbYqIZOpeDlWKvXJiXh4JppYB5IxoV89SducHtNW/L4IS5hqL6xLtS8csda6KWC/POsxR/HdCyO/2gAQ/kMPKQeGbWoO7gNiYS5H96hDm3cj4qJlPdU3H+iAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749308609; c=relaxed/simple;
	bh=2xp4WRNoWuiUCfm4yxpNBNMRqmf5H0XZDUCpknAhG60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ft5+SpycTNeBuwkyKKh0oqVHvOYuJt2jlHLE83WQajAh/Sa/5IuJIobSFzLOc+B0pG/Zrrv+VZQ5Jo5gj3flQDRnse7sAR+JhmyrlLuQPab8sbdmSIw7Xjp8KCPYAImo1QtIPvmoFraeuYFBRaS6dWQD+yjFRcCd3cZWPSEM7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4bF1f31DZMz1r56j;
	Sat,  7 Jun 2025 17:03:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4bF1f26t9Tz1qqlS;
	Sat,  7 Jun 2025 17:03:22 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id z5ax5ATrq5et; Sat,  7 Jun 2025 17:03:13 +0200 (CEST)
X-Auth-Info: mCWMwuapfcdeI94zodT46DKwYjrYmc993zzm8sqvH9IDU1s9hvVOeFt+NBXyyi3x
Received: from igel.home (aftr-82-135-83-135.dynamic.mnet-online.de [82.135.83.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  7 Jun 2025 17:03:13 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id BF3842C192A; Sat,  7 Jun 2025 17:03:12 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>,  port-m68k <port-m68k@netbsd.org>,
  debian-68k <debian-68k@lists.debian.org>,  linux-m68k
 <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <cca30c2641b40815e58add6bebee3178896666a4.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz's message of "Sat, 07 Jun 2025 16:54:43
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
Date: Sat, 07 Jun 2025 17:03:12 +0200
Message-ID: <875xh7a91r.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 07 2025, John Paul Adrian Glaubitz wrote:

> you cannot change the ABI because that would change the ABI.

That's the fundamental property of an ABI.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
