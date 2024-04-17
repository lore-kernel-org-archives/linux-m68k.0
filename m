Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F316FF4E
	for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2024 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713371590; cv=none; b=VDkc31AYXwgZmkADA2KNcTi6pdX5pIU2dEvo+QQV728KCFNEmNEw4fR3mRnteIZI1/E6av+rQ48ug9ORdt1nGWpvh9mp3YUGwrQUcIIF4SgnoMKKsGJObAErdUjSbeHgZAftnOXW+ZYgLbtsYem0t2HpzEOzpSXMtoKqsPhWyns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713371590; c=relaxed/simple;
	bh=2q48mlrSLU3CF5HRaDmHTYXn+CUusrASxcFUvGFAB0w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YFR5Yau9h8OH/4D2Z4nd/XHPdo7Mn5UGfvYqG0Rth+drKcyWhXLNOnmdsyNNMtY76bJhKDz2VofSzvU85/1Xu5cqVQKUkDOVzd0JSnRzSJFLLaR+u9mRZ9nAp7GcE1e9rTd8uK/Vp6cy2MhIcn6NQ+pLowGk7mnknZ3fI9ZxLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4VKRBM1SBmz1s955;
	Wed, 17 Apr 2024 18:26:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4VKRBM0jykz1qqlS;
	Wed, 17 Apr 2024 18:26:51 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id uKXZ_cT_E_o6; Wed, 17 Apr 2024 18:26:50 +0200 (CEST)
X-Auth-Info: 626UZqyBFLLlbF3JIfNS1KPZOYamKum0hvU4jFn50fKKrdmRMM4dy4IZdcD0uwEQ
Received: from igel.home (aftr-82-135-83-9.dynamic.mnet-online.de [82.135.83.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 17 Apr 2024 18:26:50 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id ED7892C1A84; Wed, 17 Apr 2024 18:26:49 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  Michael Schmitz
 <schmitzmic@gmail.com>,  linux-m68k@vger.kernel.org,  Finn Thain
 <fthain@linux-m68k.org>,  linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC] m68k: Handle __generic_copy_to_user faults more
 carefully
In-Reply-To: <71553982-6353-4786-9d12-fb83ea1b87a7@helsinkinet.fi> (Eero
	Tamminen's message of "Wed, 17 Apr 2024 11:16:57 +0300")
References: <20240416203643.3390-1-schmitzmic@gmail.com>
	<CAMuHMdV-ggmMVera8Ya4fDLCJzDXguKCOpg2i_+g98ZvAoctHA@mail.gmail.com>
	<71553982-6353-4786-9d12-fb83ea1b87a7@helsinkinet.fi>
X-Yow: ...Um...Um...
Date: Wed, 17 Apr 2024 18:26:49 +0200
Message-ID: <87bk68gdkm.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Apr 17 2024, Eero Tamminen wrote:

> But is that valid also across page boundaries?

Yes, the cpu will split misaligned accesses into sequences of aligned
accesses.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
